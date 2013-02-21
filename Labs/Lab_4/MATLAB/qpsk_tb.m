muFOC = floor(.01*2^12)/2^12;
muTOC = floor(.01*8*2^12)/2^12;
OS_RATE = 8;
sim = 0;     % simulation param (1 is sim qpsk, 0 is loaded from chipscope)

if (~sim)
    xlLoadChipScopeData( 'rx.prn' );
    iFile = tx_i( 1:end );
    qFile = tx_q( 1:end );
    r = complex( iFile, qFile );
else
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Emulate microprocessor packet creation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % data payload creation
    messageASCII = 'Hello World!';
    message = double( unicode2native( messageASCII ) );
    
    % add on length of message to the front with four bytes
    msgLength = length( message );
    messageWithNumBytes = [ mod( msgLength, 2^8 ),...
        mod( floor( msgLength/2^8 ), 2^8 ),...
        mod( floor( msgLength/2^16 ), 2^8 ), 1, message ];
    
    % add two bytes at the end, which is a CRC
    messageWithCRC = CreateAppend16BitCRC( messageWithNumBytes );
    ml = length( messageWithCRC );
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % FPGA radio transmit core
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    data_in = 0;
    empty_in = 1;
    tx_en_in = 0;
    numBytesFromFifo = 0;
    num_samp = ml*8*2*2*3;
    r = zeros(1,num_samp);
    CORE_LATENCY = 4;
    data_buf = zeros(1,CORE_LATENCY);
    empty_buf = ones(1,CORE_LATENCY);
    clear_buf = zeros(1,CORE_LATENCY);
    tx_en_buf = zeros(1,CORE_LATENCY);
    for i1 = 1:num_samp
        % first thing the processor does is clear the internal tx fifo
        if i1 == 1
            clear_fifo_in = 1;
        else
            clear_fifo_in = 0;
        end

        if i1 == 5 % wait a little bit then begin to load the fifo
            empty_in = 0;
            numBytesFromFifo = 0;
        end

        data_buf = [data_buf(2:end) data_in];
        empty_buf = [empty_buf(2:end) empty_in];
        clear_buf = [clear_buf(2:end) clear_fifo_in];
        tx_en_buf = [tx_en_buf(2:end) tx_en_in];
        [i_out, q_out, re_byte_out, tx_done_out] = ...
            qpsk_tx(data_buf(1),empty_buf(1),clear_buf(1),tx_en_buf(1));
        x_out = complex(i_out,q_out)/2^11;
        r(i1) = x_out;

        %%% Emulate read FIFO AXI interface
        if re_byte_out == 1 && numBytesFromFifo < length(messageWithCRC)
            data_in = messageWithCRC(numBytesFromFifo+1);
            numBytesFromFifo = numBytesFromFifo + 1;
        end
        % processor loaded all bytes into FIFO so begin transmitting
        if numBytesFromFifo == length(messageWithCRC)
            empty_in = 1;
            tx_en_in = 1;
        end    
    end
end
%index = find( abs( x )>sum( SRRC ) );

%offset = index( 1 ) + (24*OS_RATE) + 6 + length( TB_i )*OS_RATE;
%r = offset:OS_RATE:index(end)-(OS_RATE*4*3);

ml=length(r);

s = zeros(1,length(r));
r_out = zeros(1,length(r));
s_f = zeros(1,length(r));
s_t = zeros(1,length(r));
tau = zeros(1,length(r));
s_o = zeros(1,length(r));
o = zeros(1,length(r));
bytes = zeros(1,ml); byte_count = 0;
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
     [byte, en, clear_fifo(i1), num_bytes_ready_out, ...
         r_out(i1), s_f(i1), s_c(i1), s_t(i1), t_est(i1), s_p(i1), s_o(i1), ...
         fe_out(i1), phi(i1)] = ...
         qpsk_rx(i_in, q_in, floor(muFOC*2^12), floor(muTOC*2^12), mcu_rdy);

     if en == 1
         byte_count = byte_count + 1;
         bytes(byte_count) = byte;
     end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
subplot(2,4,1)
scatter(real(r),imag(r))
title('OTA Receive Signal');
subplot(2,4,5)
plot(real(r_out));
title('OTA Receive Signal (real part)');
subplot(2,4,2)
scatter(real(s_f),imag(s_f))
title('Signal Post FOC');
subplot(2,4,6)
plot(real(s_f));
title('Signal Post FOC (real part)');
subplot(2,4,3)
scatter(real(s_t),imag(s_t))
title('Signal Post TOC');
subplot(2,4,7)
plot(t_est);
title('Time estimate');
subplot(2,4,4)
plot(real(s_p));
title('Message bits');
axis([0 length(s_p) -1.25 1.25]);
subplot(2,4,8)
plot(s_o);
title('Correlation magnitude');
axis([0 length(s_o) 0 160]);

numRecBytes = bytes(1)+bytes(2)+bytes(3);
msgBytes = bytes((1+4):(numRecBytes+4));
%if sum(msgBytes-message) == 0
%    disp('Received message correctly');
%else
%    disp('Received message incorrectly');
%end    
native2unicode(bytes);
native2unicode(msgBytes)

if 0
    bs = double(M{end-1});
    es = double(M{end});
    recBytes = bs(find(es==1));
    native2unicode(recBytes')
end