function [dout, empty, byte_recieved, full, bytes_available] = ...
    tx_fifo(get_byte, store_byte, byte_in, reset_fifo)
%
%  First In First Out (FIFO) structure.
%  This FIFO stores integers.
%  The FIFO is actually a circular buffer.
%
persistent head tail fifo byte_out debounce

if (isempty(head) || reset_fifo == 1)
    head = 1;
    tail = 2;
    byte_out = 0;
    debounce = 0;
end

if isempty(fifo)
    fifo = zeros(1,1024);
end

full = 0;
empty = 0;
byte_recieved = 0;

if ((tail == 1 && head == 1024) || ((head + 1) == tail))
    empty = 1;
end
if ((head == 1 && tail == 1024) || ((tail + 1) == head))
    full = 1;
end
if store_byte == 0
    debounce = 0;
end
if debounce == 1
    byte_recieved = 1;
end

%%%%%%%%%%%%%%get%%%%%%%%%%%%%%%%%%%%%
if (get_byte && empty == 0)
    head = head + 1;
    if head == 1025
        head = 1;
    end
    byte_out = fifo(head);
end

%%%%%%%%%%%%%put%%%%%%%%%%%%%%%%%%%%%
if (store_byte && full == 0 && debounce == 0)
    fifo(tail) = byte_in;
    tail = tail + 1;
    if tail == 1025
        tail = 1;
    end
    byte_recieved = 1;
    debounce = 1;
end

% Section for calculating num bytes in FIFO
if (head < tail)
    bytes_available = (tail - head) - 1;
else
    bytes_available = (1024 - head) + tail - 1;
end

dout = byte_out;

end