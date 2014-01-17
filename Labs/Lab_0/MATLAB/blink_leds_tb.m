for i1 = 1:200
    [blinky_out(i1)] = blink_leds(1);
end

plot(blinky_out,'o')