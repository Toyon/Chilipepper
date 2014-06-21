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
function [store_byte, byte, num_bytes_ready, clear_fifo_out, blinky] =...
    qpsk_rx(i_in, q_in, mcu_rx_ready_in)

persistent finish_rx_latch
persistent blinky_cnt

if isempty(finish_rx_latch)
    finish_rx_latch = 0; % feedback once packet is received to rest
    blinky_cnt = 0;
end

% frequency offset estimation. Note that time constant is input as integer
[s_f_i, s_f_q] = ...
    qpsk_rx_foc(i_in, q_in, finish_rx_latch);

% Square-root raised-cosine band-limited filtering
[s_c_i, s_c_q] = qpsk_rx_srrc(s_f_i, s_f_q);

% Time offset estimation. Output data changes at the symbol rate.
[s_t_i, s_t_q] = ...
    qpsk_rx_toc(s_c_i, s_c_q, finish_rx_latch);

% Determine start of packet using front-loaded training sequence
[byte, store_byte, finish_rx, num_bytes_ready, clear_fifo_out] = ...
    qpsk_rx_correlator(s_t_i, s_t_q, mcu_rx_ready_in);

blinky_cnt = blinky_cnt + 1;
if blinky_cnt == 20000000
    blinky_cnt = 0;
end
blinky = floor(blinky_cnt/10000000);
finish_rx_latch = finish_rx;