mcu_reset_reg = 0;
tr_sw_reg = 1;
pa_en_reg = 0;
tx_en_reg = 1;
rx_en_reg = 1;
init_done = 0;

for i1 = 0:2^16
    [mcu_reset,tr_sw, pa_en, tx_en, rx_en,...
    init_done_reg, latch_done, blinky] = ...
    mcu_driver(init_done, mcu_reset_reg,...
    tr_sw_reg, pa_en_reg, tx_en_reg, rx_en_reg, 1, 0);
end