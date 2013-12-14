function [dout, empty, byte_received, full, bytes_available, dbg_head_out, dbg_tail_out, dbg_last_queue, dbg_byte_recieved, dbg_handshake, dbg_byte_out] = ...
    tx_fifo(get_byte, store_byte, byte_in, reset_fifo)
    %
    %  First In First Out (FIFO) structure.
    %  This FIFO stores integers.
    %  The FIFO is actually a circular buffer.
    %
    persistent head tail fifo byte_out handshake

    if (reset_fifo || isempty(head))
        head = 1;
        tail = 2;
        byte_out = 0;
        handshake = 0;
    end

    if isempty(fifo)
        fifo = zeros(1,1024);
    end

    full = 0;
    empty = 0;
    byte_received = 0;

    % Section for checking full and empty cases
    if ((tail == 1 && head == 1024) || ((head + 1) == tail))
        empty = 1;
    end
    if ((head == 1 && tail == 1024) || ((tail + 1) == head))
        full = 1;
    end

    % handshaking logic
    if store_byte == 0
        handshake = 0;
    end
    if handshake == 1
        byte_received = 1;
    end

    %%%%%%%%%%%%%%get%%%%%%%%%%%%%%%%%%%%%
    if (get_byte && ~empty)
        head = head + 1;
        if head == 1025
            head = 1;
        end
        byte_out = fifo(head);
    end
    %%%%%%%%%%%%%put%%%%%%%%%%%%%%%%%%%%%
    if (store_byte && ~full && handshake == 0)
        fifo(tail) = byte_in;
        tail = tail + 1;
        if tail == 1025
            tail = 1;
        end
        byte_received = 1;
        handshake = 1;
    end

    % Section for calculating num bytes in FIFO
    if (head < tail)
        bytes_available = (tail - head) - 1;
    else
        bytes_available = (1024 - head) + tail - 1;
    end

    dout = byte_out;
    dbg_head_out = head;
    dbg_tail_out = tail;
    dbg_last_queue = byte_in;
    dbg_byte_recieved = byte_received;
    dbg_handshake = handshake;
    dbg_byte_out = byte_out;
    