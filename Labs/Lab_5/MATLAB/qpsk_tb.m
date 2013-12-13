%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model/simulation parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sim=1;
OS_RATE = 8;
fc = 10e3/20e6; % sample rate is 20 MHz, top is 10 kHz offset
muFOC = floor(.01*2^12)/2^12; % = 40 (if changing this variale, 
% change the hardcoded value in qpsk_rx as well)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize LUTs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
make_srrc_lut;
make_trig_lut;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (sim)
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

        [new_data_in, empty_in, byte_recieved, full, percent_full] = ...
        tx_fifo(byte_request, store_byte_buf(1), data_buf(1), reset_fifo);

        [i_out, q_out, tx_done_out, request_byte] = ...
            qpsk_tx(new_data_in,empty_in,clear_buf(1),tx_en_buf(1));
        x_out = complex(i_out,q_out)/2^11;
        x(i1) = x_out;
        byte_request = request_byte;

        %%% Emulate write to FIFO interface
        if mod(i1,8) == 1 && numBytesFromFifo < length(messageWithCRC)
            data_in = messageWithCRC(numBytesFromFifo+1);
            numBytesFromFifo = numBytesFromFifo + 1;
        end
        %%% Software lags a bit on the handshaking signals %%%
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Emulate channel
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % pad on either side with zeros
    p = complex(zeros(1,100),zeros(1,100));
    xp = [p x p]; % pad

    % Apply frequency offset
    y = xp.*exp(1i*2*pi*fc*(0:length(xp)-1));
    r = y/max(abs(y))*.1*2^11; % this controls receive gain
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load Chipscope samples
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (~sim)
    fid = fopen('rx.prn');
    M = textscan(fid,'%d %d %d %d','Headerlines',1);
    fclose(fid);
    is = double(M{3});
    qs = double(M{4});
    r = complex(is,qs);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main receiver core
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r_out = zeros(1,length(r));
s_f = zeros(1,length(r));
f_est = zeros(1,length(r));
for i1 = 1:length(r)+200
    if i1 > length(r)
        r_in = 0;
    else
        r_in = r(i1);
    end
    i_in = round(real(r_in));
    q_in = round(imag(r_in));
    [r_out(i1), s_f_i, s_f_q, f_est(i1)] = qpsk_rx(i_in, q_in);
    s_f(i1) = complex(s_f_i,s_f_q);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
subplot(2,2,1)
scatter(real(r),imag(r))
title('Pre FOC Signal');
subplot(2,2,3)
plot(real(r_out));
title('Pre FOC Signal (real part)');
subplot(2,2,2)
scatter(real(s_f),imag(s_f))
title('Signal Post FOC');
subplot(2,2,4)
plot(f_est);
title('Frequency estimate');