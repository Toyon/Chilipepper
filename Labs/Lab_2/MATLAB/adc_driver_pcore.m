function [rx_i, rx_q, blinky] = adc_driver_pcore(rxd, rx_iq_sel)

    persistent i_out q_out q_out_delay blinky_cnt

    if isempty(i_out)
        i_out = 0;
        q_out = 0;
        q_out_delay = 0;
        blinky_cnt = 0;
    end

    if rx_iq_sel == 0
        q_out_delay = rxd;
    else
        i_out = rxd;
        q_out = q_out_delay;
    end
        rx_i = i_out;
        rx_q = q_out;
        
    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);
end