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
function [s_t_i, s_t_q, blinky, tauh] =...
    qpsk_rx(i_in, q_in)

persistent blinky_cnt

if isempty(blinky_cnt)
    blinky_cnt = 0;
end

% frequency offset estimation. Note that time constant is input as integer
[s_f_i, s_f_q] = ...
    qpsk_rx_foc(i_in, q_in);

% Square-root raised-cosine band-limited filtering
[s_c_i, s_c_q] = qpsk_rx_srrc(s_f_i, s_f_q);

% Time offset estimation. Output data changes at the symbol rate.
[s_t_i, s_t_q, tauh] = ...
    qpsk_rx_toc(s_c_i, s_c_q);

blinky_cnt = blinky_cnt + 1;
if blinky_cnt == 20000000
    blinky_cnt = 0;
end
blinky = floor(blinky_cnt/10000000);