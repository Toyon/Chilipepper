%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model/simulation parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sim = 1;     % simulation param (1 is sim qpsk, 0 is loaded from chipscope)
OS_RATE = 8;
SNR = 100;
fc = 10e3/20e6; % sample rate is 20 MHz, top is 10 kHz offset
muFOC = floor(.01*2^12)/2^12;
muTOC = floor(.01*8*2^12)/2^12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize LUTs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
make_srrc_lut;
make_train_lut;
make_trig_lut;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% load packet that was transmitted and captured from chipscope %%%%%%
if (~sim)
    xlLoadChipScopeData( 'tx.prn' );
    iFile = tx_i( 1:end )/2^11;
    qFile = tx_q( 1:end )/2^11;
    x = complex( iFile, qFile );
else
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
    tx_en = 0;
    valid = 0;
    debounce = 0;
    numBytesFromFifo = 0;
    num_samp = ml*8*2*2*3;
    x = zeros(1,num_samp);
    for i1 = 1:(num_samp +30)
        % first thing the processor does is clear the internal tx fifo
        if i1 == 1
            clear_fifo = 1;
        else
            clear_fifo = 0;
        end

        data_in = messageWithCRC(numBytesFromFifo+1);

        [i_out, q_out, tx_done_out, ready, blinky] = ...
            qpsk_tx(uint32(data_in),clear_fifo,tx_en,valid);
        x_out = complex(i_out,q_out)/2^11;
        x(i1) = x_out;

        % processor loaded all bytes into FIFO so begin transmitting
        if (i1 > 5 && (numBytesFromFifo+1) < length(messageWithCRC))
            valid = 1;
        elseif (numBytesFromFifo+1) == length(messageWithCRC)...
                && debounce <2
            valid = 1;
            debounce = debounce + 1;
        else
            valid = 0;
        end

        %%% Emulate stream write interface
        if (ready == 1 && (numBytesFromFifo +1) < length(messageWithCRC)...
                && mod(i1,3)==1)
            numBytesFromFifo = numBytesFromFifo + 1;
        end    

        if numBytesFromFifo == (length(messageWithCRC) - 1)
            tx_en = 1;
        end
    end
end

index = find(abs(x) > sum(SRRC))+24*8; % constant is pad bits
offset = index(1)+6+length(TB_i)*OS_RATE;
if (~sim)
    idx = offset:8:index(end);
else
    idx = offset:8:(offset+8*ml*4-1);
end
y = x(idx); % four symbos per byte of data
sc = zeros(1,18*8);
sc(1:2:end) = real(y);
sc(2:2:end) = imag(y);
sh = sign(sc);
sb = (sh+1)/2;
d = zeros(1,ml);
for i1 = 1:ml
    si = sb(1+(i1-1)*8:i1*8);
    d(i1) = bi2de(si);
end
figure(1)
clf
plot(real(x))
hold on
plot(idx,real(y),'ro')
title('Transmit samples');

error_tx = sum(abs(d-messageWithCRC));
if error_tx == 0
    disp('Transmitted message correctly');
else
    disp('Transmitted message incorrectly');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




