%#codegen
function [ tx_iq_sel, txd, blinky] = dac_driver( tx_i, tx_q, dac_en )
%interleave I and Q channels into txd
    persistent count blinky_cnt
    if isempty(count)
        count = 0;
        blinky_cnt = 0;
    else
        count = +~count;
    end
    %DAC runs at 2x the input rate
    if dac_en == 1
        tx_iq_sel = count;
        if tx_iq_sel == 0
            txd = tx_i;
        else
            txd = tx_q;
        end
    else
        tx_iq_sel = 0;
        txd = 0;
    end
    
    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);
end