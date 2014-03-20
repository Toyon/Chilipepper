function [i_out, q_out, rssi_out, dir_out, blinky, d1, d2, d3, d4, d5, d6, d7, d8, gain_out] = ...
    dc_offset_correction(i_in, q_in, gain_en_in,...
        rssi_low_goal_in, rssi_high_goal_in, rx_en_in, gain_in)

persistent i_dc q_dc i_mean q_mean
persistent counter rssi_sum
persistent dir_state dir_latch rssi_latch
persistent rssiHold timeout
persistent noise_offset noise_inc noise_dec
persistent blinky_cnt

%alpha = alpha_in/2^12;
alpha = 1/2^12;
saturation_threshold = 5780000; %1700*1700*2 dont go above this amount
if isempty(i_dc)
    dir_latch = 0;
    rssi_latch = 0;
    i_dc = 0;
    q_dc = 0;
    i_mean = 0;
    q_mean = 0;
    counter = 0;
    noise_inc = 0;
    noise_dec = 0;
    noise_offset = 0;
    rssi_sum = 0;
    dir_state = 0;
    rssiHold = 0;
    blinky_cnt = 0;
    timeout = 0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DC Correction section
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if rx_en_in == 1
    i_mean = (1-alpha)*i_mean + alpha*i_in;
    q_mean = (1-alpha)*q_mean + alpha*q_in;

    i_dc = (1-alpha)*i_dc + alpha*i_in; %update the i dc offset
    q_dc = (1-alpha)*q_dc + alpha*q_in; %update the q dc offset

    if (i_mean - i_dc) > (50 + noise_offset)  % too much noise, raise cieling.
        noise_inc = noise_inc + 1;
        i_dc = i_dc/2;
    else
        noise_dec = noise_dec + 1;
    end
    if (q_mean - q_dc) > (50 + noise_offset)  % too much noise, raise cieling.
        noise_inc = noise_inc + 1;
        q_dc = q_dc/2;
    else
        noise_dec = noise_dec +1;
    end
    if (noise_inc > 10)
        %there is a high dc_offset value that needs to be corrected
        noise_offset = noise_offset + 10;
        noise_inc = 0;
    end
    if (noise_dec > 100000)
        %dc offset threshold is higher than needed
        noise_offset = noise_offset - 10;
        noise_dec = 0;
    end
end
i_out = i_in - i_dc;
q_out = q_in - q_dc;
%correct false positive/nagatives
if (abs(i_mean) < 50)
    noise_inc = 0;
end
if (abs(i_mean) > noise_offset - 10)
    noise_dec = 0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RSSI Estimation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rssi_inst = i_out*i_out + q_out*q_out;
rssi_en_out = 0;
rssi_out = 0;

if rx_en_in == 1
    if counter == 0 
        if rssi_inst > 2*50*50
            % we think we have data
            counter = 1;
            rssi_sum = 0;
            if timeout > 0
                timeout = timeout - 1;
            end
        else
            timeout = timeout + 1;
        end
    end

    if counter ~= 0 % if its data, accumulate it
        if rssi_inst < 2*50*50
            % false alarm, reset the counter
            counter = 0;
        else
            % yay, data
            counter = counter + 1;
            rssi_sum = rssi_sum + rssi_inst;

            if counter >= 2^8 % should be packet length (or smaller)
                counter = 0;
                rssi_out = round(rssi_sum/2^8);
                rssiHold = rssi_out;
                rssi_en_out = 1;
                timeout = 0;
            end
        end
    end
    % timeout is used to slowly increase the gain if we haven't recieved
    % anything in awhile.
    if (timeout > 2^25)
        rssiHold = rssi_inst;
        rssi_en_out = 1;
        timeout = 0;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gain Correction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dir_out = 0;
dir_en_out = 0;

% dir_out = 0 - do nothing
% dir_out = 1 - increase
% dir_out = 2 - decrease
% dir_out = 3 - decrease a lot (were saturating)
% only increase power if the rssi is away from the mean
rssi_diff = abs(rssiHold-(i_mean*i_mean+q_mean*q_mean));
if rx_en_in == 1
    switch dir_state
        case 0 % wait for some action and the processor is done
            if gain_en_in == 0
                if rssi_en_out == 1
                    if rssi_diff < rssi_low_goal_in %too low - increase
                        dir_out = 1;
                        dir_en_out = 1;
                        dir_state = 1;
                    end
                    if rssi_diff > rssi_high_goal_in %too high - decrease
                        dir_out = 2;
                        dir_en_out = 1;
                        dir_state = 1;
                    end
                end
                %this overrides everything. If we're saturating, back off the gain
                if (rssi_inst > saturation_threshold)
                    timeout = 0; % reset the slow gain increase
                    dir_out = 3; % decrease by a factor of 10
                    dir_en_out = 1; % now!
                    dir_state = 1; % latch it
                end
            end
        case 1 % see if the MCU has done something and if so reset
            if gain_en_in == 1
                dir_out = 0;
                dir_en_out = 1;
                dir_state = 0;
            end
        otherwise
            dir_state = 0;
    end
end

if dir_en_out == 1
    dir_latch = dir_out;
end
if rssi_en_out == 1
    rssi_latch = rssi_out;
end
rssi_out = rssi_latch;
dir_out = dir_latch;
d1 = rssi_diff;
d2 = rssi_inst;
d3 = rssiHold;
d4 = rssi_out;
d5 = dir_out;
d6 = timeout;
d7 = rssi_en_out;
d8 = rx_en_in;
gain_out = gain_in;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);
end