function [dout, bytes_available, byte_ready, empty, d_1] = ...
    rx_fifo(reset_fifo, store_byte, byte_in, get_byte)

%
%  First In First Out (FIFO) structure.
%  This FIFO stores integers.
%  The FIFO is actually a circular buffer.
%

persistent head tail fifo byte_out handshake sb_handshake

if (reset_fifo || isempty(head))
    head = 1;
    tail = 2;
    byte_out = 0;
    handshake = 0;
    sb_handshake = 0;
end

if isempty(fifo)
    fifo = zeros(1,1024);
end

full = 0;
empty = 0;

% handshaking logic
if (handshake == 1 && get_byte == 0)   % reset for next request
    byte_ready = 0;
    handshake = 0;                  
elseif (handshake == 1)                 % keep byte ready until users flags they are done
    byte_ready = 1;                   
else
    byte_ready = 0;                     % no requests, no byte ready
end

if store_byte == 0;
    sb_handshake = 0;
end

if ((tail == 1 && head == 1024) || ((head + 1) == tail))
    empty = 1;
end
if ((head == 1 && tail == 1024) || ((tail + 1) == head))
    full = 1;
end

%%%%%%%%%%%%%%get%%%%%%%%%%%%%%%%%%%%%
if (get_byte && handshake == 0 && ~empty)
    head = head + 1;
    if head == 1025
        head = 1;
    end
    byte_ready = 1;
    handshake = 1;
    byte_out = fifo(head);
end
%%%%%%%%%%%%%put%%%%%%%%%%%%%%%%%%%%%
if (store_byte && ~full && sb_handshake == 0)
    fifo(tail) = byte_in;
    sb_handshake = 1;
    tail = tail + 1;
    if tail == 1025
        tail = 1;
    end
end

% Section for calculating num bytes in FIFO
if (head < tail)
    bytes_available = (tail - head) - 1;
else
    bytes_available = (1024 - head) + tail - 1;
end

dout = byte_out;
d_1 = byte_out;
end