Chilipepper
===========

This repository hosts projects related to the Toyon Research Corporation Chilipepper FMC radio board. The board can be purchased here
<http://www.toyon.com/chilipepper.php>. All supporting guides and demonstration files are found off this page on github.

The labs and examples target the Xilinx ZED board
http://www.zedboard.org/

A short description of each release is given below. To checkout a release, first use git clone to obtain the entire repository. You can then checkout a specific tag (release) using git checkout <tagname>.

Rev 1:
Revision 1 contains the QPSK Demo Labs created using MATLAB HDL Coder and the MATLAB System Generator.

Rev 2:
Revision 2 contains the QPSK Demo Labs created using the MATLAB HDL Coder IP Core Generation Workflow.

Philosophy
----------

Generally, this repository is meant to provide two major components. The first is a set of tutorials on how to use [MathWorks](http://www.mathworks.com) HDL Coder specifically via MATLAB to HDL code generation, along with Xilinx tools. These include the Xilinx Platform Studio (XPS) and Xilinx System Generator. These laboratory exercises can be found in the "Labs" directory.

These laboratory exercises eventually lead up to the second component, which is a QPSK ad hoc modem exmample. This is found in the QPSK_Radio directory.

As Chilipepper is meant more as a learning tool than a true product we encourage other open source projects. Please contact <embedded@toyon.com> if you are interested in contributing.

Support
-------

The Chilipepper User's Guide and firmware for the microcontroller can be found in the ChilipepperSupport directory. You may submit issues and feature requests through github or contact us at <embedded@toyon.com>. 

[![Mathworks Connection Program partner](mcp.jpg)](http://www.mathworks.com)
