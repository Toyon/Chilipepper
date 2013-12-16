function [mcu_reset_out, tr_sw, pa_en, tx_en, rx_en,...    
    init_done_reg, latch_done, reg_reset_done, blinky] = ...
    mcu_driver(init_done, mcu_reset_in, tr_sw_reg,...
    pa_en_reg, tx_en_reg, rx_en_reg, latch, mcu_reg_reset)

    persistent reset pa_enable tx_enable rx_enable tr_switch blinky_cnt

    reg_reset_done = 0;
    if (isempty(reset) || mcu_reg_reset == 1)
        reset = 1;
        tr_switch = 0;
        pa_enable = 0;
        tx_enable = 0;
        rx_enable = 0;
        reg_reset_done = 1;
        blinky_cnt = 0;
    end

    latch_done = 0;
    if (latch == 1)
        reset = mcu_reset_in;
        tr_switch = tr_sw_reg;
        pa_enable = pa_en_reg;
        tx_enable = tx_en_reg;
        rx_enable = rx_en_reg;
        latch_done = 1;
    end

    init_done_reg = init_done;
    mcu_reset_out = reset;
    tr_sw = tr_switch;
    pa_en = pa_enable;
    tx_en = tx_enable;
    rx_en = rx_enable;
    
    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);
end