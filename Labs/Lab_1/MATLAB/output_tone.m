%#codegen
function[i_out, q_out, blinky] = output_tone(myInput)
%Output a tone at 1MHz
    persistent i_hold q_hold phi blinky_cnt
    if (isempty(phi))
        phi=1;
        blinky_cnt = 0;
    end

    %ROMs *not* declared persistent
    lSin = SIN;
    lCos = COS;

    i_hold = lSin(phi);
    q_hold = lCos(phi);

    phi = phi + 20;
    if phi > 400
        phi = phi-400;
    end

    blinky_cnt = blinky_cnt + 1;
    if blinky_cnt == 20000000
        blinky_cnt = 0;
    end
    blinky = floor(blinky_cnt/10000000);

    i_out = (2^11-1)*i_hold;
    q_out = (2^11-1)*q_hold;    
end