%#codegen
% this core runs at an oversampling rate of 8
function [d_out, tx_done_out, ready] = ...
    qpsk_tx_byte2sym(data_in, clear_fifo_in, tx_en_in, valid)

OS_RATE = 8;
SYM_PER_BYTE = 4; % number of symbols per byte (QPSK 4)
tbi = TB_i;
tbq = TB_q;

persistent count
persistent symIndex
persistent diLatch dqLatch
persistent tx_fifo
persistent wrCount rdCount
persistent txDone
persistent sentTrain
persistent debounce

if isempty(count)
    count = 0;
    symIndex = 0;
    diLatch = 0;
    dqLatch = 0;
    wrCount = 0; rdCount = 0;
    txDone = 0;
    sentTrain = 0;
    debounce = 0;
end
if isempty(tx_fifo)
    tx_fifo = zeros(1,1024);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if want to transmit a new packet reset things
if clear_fifo_in == 1
    wrCount = 0;
    txDone = 0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% we are ready to transmit some data
rdIndex = wrCount-rdCount+1;
if rdIndex <= 0
    rdIndex = 1024;
end
data = tx_fifo(rdIndex);

d_out = 0;
% fifo should be empty and the processor says go ahead and transmit
% we stop when we've written all the data out that we wrote to the fifo.
% This core doesn't care about packet length, just about how many bytes got
% written to the fifo.
PAD_BITS = 24;
if tx_en_in == 1 && txDone == 0
    if sentTrain <= PAD_BITS
        if count == 0
            diLatch = mod(sentTrain,2)*2-1;
            dqLatch = mod(sentTrain,2)*2-1;
        end
        count = count + 1;
        if count >= OS_RATE
            count = 0;
            sentTrain = sentTrain + 1;
        end
        d_out = complex(diLatch,dqLatch);
    elseif sentTrain <= 65+PAD_BITS
        if count == 0
            diLatch = tbi(sentTrain-PAD_BITS);
            dqLatch = tbq(sentTrain-PAD_BITS);
        end
        count = count + 1;
        if count >= OS_RATE
            count = 0;
            sentTrain = sentTrain + 1;
        end
        d_out = complex(diLatch,dqLatch);
    else
        if mod(count,OS_RATE) == 0
            sym2 = symIndex*2;
            diLatch = mybitget(data,sym2+1)*2-1;
            dqLatch = mybitget(data,sym2+2)*2-1;
            symIndex = symIndex + 1;
        end
        d_out = complex(diLatch, dqLatch);

        count = count + 1;
        if count >= OS_RATE*SYM_PER_BYTE
            count = 0;
            symIndex = 0;
            rdCount = rdCount - 1;
        end
        if rdCount == 0
            txDone = 1;
        end
    end
end

% this will work for one packet at a time, but needs to be fixed to recieve
% data while transmitting a packet as well
if valid == 1 && debounce == 0
    ready = 1;
    wrCount = wrCount + 1; %total number of bytes to send out
    rdCount = wrCount;
    tx_fifo(wrCount) = data_in;
    txDone = 0;
    sentTrain = 1;
    debounce = 2;
else
    if debounce > 0
       debounce = debounce - 1;
    end
    ready = 0;
end

tx_done_out = txDone;