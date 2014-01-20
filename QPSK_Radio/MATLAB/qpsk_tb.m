%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model/simulation parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OS_RATE = 8;
SNR = 100;
fc = 10e3/20e6; % sample rate is 20 MHz, top is 10 kHz offset
muFOC = floor(.01*2^12)/2^12;
muTOC = floor(.01*8*2^12)/2^12;
sim = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize LUTs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
make_srrc_lut;
%make_train_lut;
make_trig_lut;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Emulate microprocessor packet creation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data payload creation
messageASCII = 'hello world!';
message = double(unicode2native(messageASCII));
% add on length of message to the front with four bytes
msgLength = length(message);
messageWithNumBytes =[ ...
    mod(msgLength,2^8) ...
    mod(floor(msgLength/2^8),2^8) ...
    mod(floor(msgLength/2^16),2^8) ...
    1 ... % message ID
    message];
% add two bytes at the end, which is a CRC
messageWithCRC = CreateAppend16BitCRC(messageWithNumBytes);
ml = length(messageWithCRC);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FPGA radio transmit core
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_in = 0;
empty_in = 1;
tx_en_in = 0;
store_byte = 0;
numBytesFromFifo = 0;
num_samp = ml*8*2*2*3;
x = zeros(1,num_samp);
CORE_LATENCY = 4;
data_buf = zeros(1,CORE_LATENCY);
store_byte_buf = zeros(1,CORE_LATENCY);
clear_buf = zeros(1,CORE_LATENCY);
tx_en_buf = zeros(1,CORE_LATENCY);
re_byte_out(1) = 0;
reset_fifo = 0;
byte_request = 0;
for i1 = 1:num_samp
    % first thing the processor does is clear the internal tx fifo
    if i1 == 1
        clear_fifo_in = 1;
    else
        clear_fifo_in = 0;
    end

    data_buf = [data_buf(2:end) data_in];
    store_byte_buf = [store_byte_buf(2:end) store_byte];
    clear_buf = [clear_buf(2:end) clear_fifo_in];
    tx_en_buf = [tx_en_buf(2:end) tx_en_in];
    
    [new_data_in, bytes_available, byte_recieved, empty_in] = ...
    tx_fifo(reset_fifo, store_byte_buf(1), data_buf(1), byte_request);
    
    [i_out, q_out, tx_done_out, request_byte, clear_fifo_in_done] = ...
        qpsk_tx(new_data_in,empty_in,clear_buf(1),tx_en_buf(1));
    x_out = complex(i_out,q_out)/2^11;
    x(i1) = x_out;
    byte_request = request_byte;
    
    %%% Emulate write to FIFO interface
    if mod(i1,8) == 1 && numBytesFromFifo < length(messageWithCRC)
        data_in = messageWithCRC(numBytesFromFifo+1);
        numBytesFromFifo = numBytesFromFifo + 1;
    end
    %%% Software lags a but on the handshaking signals %%%
    if (0 < mod(i1,8) && mod(i1,8) < 5) && tx_en_in == 0
        store_byte = 1;
    else
        store_byte = 0;
    end
    % processor loaded all bytes into FIFO so begin transmitting
    if (numBytesFromFifo == length(messageWithCRC) && mod(i1,8) > 5)
        empty_in = 1;
        tx_en_in = 1;
    end
end
if ~sim % load data that was transmitted and captured from chipscope
    if 1
        fid = fopen('tx.prn');
        M = textscan(fid,'%d %d %d %d %d %d %d %d %d %d','Headerlines',1);
        fclose(fid);
        iFile = double(M{3})'/2^11;
        qFile = double(M{4})'/2^11;
    else
        M = load('dac.prn');
        if M(1,end-1) == 0
            iFile = M(1:2:end,end)'/2^11;
            qFile = M(2:2:end,end)'/2^11;
        else
            qFile = M(1:2:end,end)'/2^11;
            iFile = M(2:2:end,end)'/2^11;
        end
    end
    x = complex(iFile,qFile);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Emulate channel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pad on either side with zeros
p = complex(zeros(1,100),zeros(1,100));
xp = [p x p]; % pad

% Apply frequency offset and receive/over-the-air AWGN
y = xp.*exp(1i*2*pi*fc*(0:length(xp)-1));
rC = y/max(abs(y))*.1*2^11; % this controls receive gain
%r = awgn(rC,SNR,0,1);
r = rC;
if ~sim
    %M = load('rx.prn');
    fid = fopen('rx.prn');
    %M = textscan(fid,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d','Headerlines',1);
    M = textscan(fid,'%d %d %d %d','Headerlines',1);
    fclose(fid);
    is = double(M{3});
    qs = double(M{4});
    r = complex(is,qs);
    figure(3)
    subplot(2,1,1);
    plot(is);
    subplot(2,1,2);
    plot(qs)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main receiver core
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s = zeros(1,length(r));
r_out = zeros(1,length(r));
s_f = zeros(1,length(r));
s_t = zeros(1,length(r));
tau = zeros(1,length(r));
s_o = zeros(1,length(r));
o = zeros(1,length(r));
bytes = zeros(1,ml); byte_count = 0; next_byte = 0; bytes_available = 0;
for i1 = 1:length(r)+200
    if i1 == 1
        mcu_rdy = 0;
    else
        mcu_rdy = 1;
    end
    if i1 > length(r)
        r_in = 0;
    else
        r_in = r(i1);
    end
    i_in = round(real(r_in));
    q_in = round(imag(r_in));
    r_out(i1) = real(complex(i_in,q_in));
   
    [dc_i_out, dc_q_out, rssi_out, rssi_en_out, dir_out, dir_en_out] = ...
        dc_offset_correction(i_in, q_in, mod(i1,2), 500, 1500, +(i1>3000));
    
    [store_byte, byte, num_bytes_ready, clear_fifo_out] =...
        qpsk_rx(dc_i_out, dc_q_out, mcu_rdy);

     % To FIFO
    [rx_fifo_byte_out(i1), bytes_available(i1), byte_ready(i1)] = ...
        rx_fifo(clear_fifo_out, store_byte, byte, next_byte);
    if (i1>1)
        if (byte_ready(i1) == 1 && byte_ready(i1-1) == 0)
            byte_count = byte_count + 1;
            bytes(byte_count) = rx_fifo_byte_out(i1);
            next_byte=0;
        else
            next_byte=1;
        end
    end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
subplot(2,4,1)
scatter(real(r),imag(r))
title('OTA Receive Signal');
subplot(2,4,5)
plot(real(r_out));
%title('OTA Receive Signal (real part)');
%subplot(2,4,2)
%scatter(real(s_f),imag(s_f))
%title('Signal Post FOC');
%subplot(2,4,6)
%plot(real(s_f));
%title('Signal Post FOC (real part)');
%subplot(2,4,3)
%scatter(real(s_t),imag(s_t))
%title('Signal Post TOC');
%subplot(2,4,7)
%plot(t_est);
%title('Time estimate');
%subplot(2,4,4)
%plot(real(s_p));
%title('Message bits');
%axis([0 length(s_p) -1.25 1.25]);
%subplot(2,4,8)
%plot(s_o);
%title('Correlation magnitude');
%axis([0 length(s_o) 0 160]);

numRecBytes = bytes(1)+bytes(2)+bytes(3);
msgBytes = bytes((1+4):(numRecBytes+4));
if sum(msgBytes-message) == 0
    disp('Received message correctly');
else
    disp('Received message incorrectly');
end    
native2unicode(bytes);
native2unicode(msgBytes)

if ~sim
    bs = double(M{end-1});
    es = double(M{end});
    recBytes = bs(es==1);
    native2unicode(recBytes')
end