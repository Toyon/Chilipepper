%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% QPSK demonstration packet-based transceiver for Chilipepper
% Toyon Research Corp.
% http://www.toyon.com/chilipepper.php
% Created 10/17/2012
% embedded@toyon.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file is the top level entry function for the receiver portion of the
% example. The entire receiver is designed to run at Rate=1 (one clock
% cycle per iteration of the core. 
% We follow standard receive practice with frequency offset estimation,
% pulse-shape filtering, time estimateion, and correlation to determine
% tart of packet.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%#codegen

function [r_out, s_t_i, s_t_q, t_est_out, blinky] = ...
    qpsk_rx(i_in, q_in)

    persistent blinky_cnt
    
    if isempty(blinky_cnt)
        blinky_cnt = 0;
    end

    % scale input data coming from the Chilipepper ADC to be purely fractional
    % to avoid scaling issues
    r_in = complex(i_in, q_in);

    % frequency offset estimation. Note that time constant is input as  a 
    % constant integer with value 40
    [s_f_i, s_f_q] = qpsk_rx_foc(i_in, q_in, 40);
    
    % Square-root raised-cosine band-limited filtering
    [s_c_i, s_c_q] = qpsk_rx_srrc(s_f_i, s_f_q);

    % Time offset estimation. Output data changes at the symbol rate.
    [s_t_i, s_t_q, tauh] = qpsk_rx_toc(s_c_i, s_c_q, 327);

    % estimation value for frequency offset
    t_est_out = tauh;

    % original signal out (real version)
    r_out = real(r_in);

    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);
end