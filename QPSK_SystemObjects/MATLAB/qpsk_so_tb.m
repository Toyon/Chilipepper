%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: qpsk_so_tb.m
% data: 6/30/2013
% purpose: 
% This is the top level testbench for a qpsk transceiver example that seeks
% to demonstrate the use of System Objects within HDL code generation. The
% basic pipeline involves
% Tx:
% Microprocessor data buffer -> Bytes to binary -> CRC generation -> 
% Reed Solomon encoding -> Convolutional interleaving -> QPSK Modulation
% -> Training Insertion
% Channel:
% We emulate a random Gaussian noise channel
% Rx:
% Frequency offset correction -> Timing offset estimation -> Correlation
% and synchronization -> QPSK Demondulation -> Convolutional deinterleaving
% -> Reed Solomon decoding -> CRC check -> binary to bytes ->
% Microprocessor data buffer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


hHDLEnc = comm.HDLRSEncoder(204,188,'BSource','Property','B',0);
hHDLDec = comm.HDLRSDecoder(204,188,'BSource','Property','B',0);
hInt = comm.ConvolutionalInterleaver('NumRegisters', 3, ...
                    'RegisterLengthStep', 2, ...
                    'InitialConditions', [-1 -2 -3]');
hDeInt = comm.ConvolutionalDeinterleaver('NumRegisters', 3, ...
                    'RegisterLengthStep', 2, ...
                    'InitialConditions', [-1 -2 -3]');
hGen = comm.HDLCRCGenerator;

                
data = uint8((0:40)');
intrlvData = step(hInt, data);
deintrlvData = step(hDeInt, intrlvData);
[data, intrlvData, deintrlvData]

dataIn = [randi([0,255],188,1,'uint8') ; zeros(1024-188,1)];
for ii = 1:1024
  [encOut(ii), startOut(ii), endOut(ii), validOut(ii)] = ...
      step(hHDLEnc, dataIn(ii), ii==1, ii==188, ii<=188);
  [decOut(ii), decStartOut(ii), decEndOut(ii), decValidOut(ii), decErrOut(ii)] = ...
      step(hHDLDec, encOut(ii), startOut(ii), endOut(ii), validOut(ii));
end
% Check the result:
assert(all(dataIn(1:188) == decOut(decValidOut)'))

