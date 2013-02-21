muFOC = floor(.01*2^12)/2^12;
muTOC = floor(.01*8*2^12)/2^12;
OS_RATE = 8;

xlLoadChipScopeData( 'ADC.prn' );
iFile = tx_i( 1:end );
qFile = tx_q( 1:end );
r = complex( iFile, qFile );

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
         fe_out(i1), test1(i1), test2(i1)] = ...
         qpsk_rx(i_in, q_in, floor(muFOC*2^12), floor(muTOC*2^12), mcu_rdy);

     if en == 1
         byte_count = byte_count + 1;
         bytes(byte_count) = byte;
     end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
subplot(2,5,1)
scatter(real(r),imag(r))
title('OTA Receive Signal');
subplot(2,5,6)
plot(real(r_out));
title('OTA Receive Signal (real part)');
subplot(2,5,2)
scatter(real(s_f),imag(s_f))
title('Signal Post FOC');
subplot(2,5,7)
plot(real(s_f));
title('Signal Post FOC (real part)');
subplot(2,5,3)
scatter(real(s_t),imag(s_t))
title('Signal Post TOC');
subplot(2,5,8)
plot(t_est);
title('Time estimate');
subplot(2,5,4)
plot(real(s_p));
title('Message bits');
axis([0 length(s_p) -1.25 1.25]);
subplot(2,5,9)
plot(s_o);
title('Correlation magnitude');
axis([0 length(s_o) 0 160]);
%subplot(2,5,5)
%plot(test1);
%title('phi 1');
subplot(2,5,10)
plot(test2);
title('phi');


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