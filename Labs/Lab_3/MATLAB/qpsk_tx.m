function [i_out, q_out, tx_done_out, ready, blinky] = ...
    qpsk_tx(data_in, clear_fifo_in, tx_en_in, valid)

    persistent blinky_cnt
    
    if isempty(blinky_cnt)
        blinky_cnt = 0;
    end
    
    [d_b2s, tx_done_out, ready] = ...
        qpsk_tx_byte2sym(uint8(data_in), clear_fifo_in, tx_en_in, valid);

    [d_ssrc] = qpsk_srrc(d_b2s);

    % make i/q discrete ports and scale to the full 12-bit range of the DAC
    % (one bit is for sign)
    i_out = round(real(d_ssrc)*2^11);
    q_out = round(imag(d_ssrc)*2^11);

    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);
end