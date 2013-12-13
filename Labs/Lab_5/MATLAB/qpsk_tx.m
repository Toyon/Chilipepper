function [i_out, q_out, tx_done_out, request_byte, blinky] = ...
    qpsk_tx(data_in, empty_in, clear_fifo_in, tx_en_in)

    persistent blinky_cnt
    
    if isempty(blinky_cnt)
        blinky_cnt = 0;
    end

    [byte_out, request_byte, tx_done] = ...
        qpsk_tx_byte2sym(data_in, empty_in, clear_fifo_in, tx_en_in);

    [d_ssrc] = qpsk_srrc(byte_out);

    % make i/q discrete ports and scale to the full 12-bit range of the DAC
    % (one bit is for sign)
    i_out = round(real(d_ssrc)*2^11);
    q_out = round(imag(d_ssrc)*2^11);
    tx_done_out = tx_done;

    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);
end
