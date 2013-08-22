This design is not finished

The goal of this tutorial project is to demonstrate the use of MATLAB to HDL translation for building a QPSK transceiver. The unique element of this design is the absence of Simulink within the design flow.

Files in this directory provide a demonstration for a complete QPSK ad hoc wireless transceiver.

The complete set of code for the physical layer is written in MATLAB and translated to hardware using Mathworks HDL Coder. 

The MAC and peripheral (serial port) interfaces are written in C.

This example differs from QPSK_Radio in that it uses newer tools and skips the previously required Simulink export tool.

  MATLAB R2013b
   
  Xilinx Vivado 2013.2
