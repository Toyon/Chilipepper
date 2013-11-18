

for i1 = 0:2:512
    rxd = mod(i1,4)/2;
    rx_iq_sel = mod(i1,4)/2;
    [ rx_i(i1+1), rx_q(i1+1) ] = adc_driver_pcore( rxd, rx_iq_sel );
    [ rx_i(i1+2), rx_q(i1+2) ] = adc_driver_pcore( rxd, rx_iq_sel );
end

plot(rx_i)
plot(rx_q)