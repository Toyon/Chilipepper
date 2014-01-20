dac_en = 0;

for i1 = 0:2:256
    tx_i = i1;
    tx_q = -(i1+1);
    [tx_iq_sel(i1+1), txd(i1+1), blinky] = dac_driver(tx_i, tx_q, dac_en);
    [tx_iq_sel(i1+2), txd(i1+2), blinky] = dac_driver(tx_i, tx_q, dac_en);
    if i1 > 10
        dac_en = 1;
    end
end
%plot the result
subplot(2,1,1)
plot(txd)
title('Interleaved I and Q signal');
subplot(2,1,2)
plot(tx_iq_sel)
title('I/Q select line');