muFOC = floor(.01*2^12)/2^12;
OS_RATE = 8;

%xlLoadChipScopeData( 'ADC.prn' );
fid = fopen('adc.prn');
M = textscan(fid,'%d %d %d %d','Headerlines',1);
fclose(fid);
tx_i = double(M{3})'/2^11;
tx_q = double(M{4})'/2^11;
r = complex( tx_i, tx_q );
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
         r_out(i1), s_f(i1), s_c(i1), s_t(i1), t_est(i1), ...
         s_p(i1), s_o(i1), ...
         fe_out(i1), phi(i1)] = ...
     qpsk_rx(i_in, q_in, floor(muFOC*2^12), floor(muTOC*2^12), mcu_rdy);

     if en == 1
         byte_count = byte_count + 1;
         bytes(byte_count) = byte;
     end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
subplot(2,2,1)
scatter(real(r),imag(r))
title('OTA Receive Signal');
subplot(2,2,3)
plot(real(r_out));
title('OTA Receive Signal (real part)');
subplot(2,2,2)
scatter(real(s_f),imag(s_f))
title('Signal Post FOC');
subplot(2,2,4)
plot(phi);
title('phi');

