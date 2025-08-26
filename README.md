# FPGA_LFSR
A Pseudorandom Number Generator implemented using an LFSR Module implemented on a Basys 3 FPGA


#Overview
This project implements a configurable-width Linear Feedback Shift Register (LFSR) in SystemVerilog and drives a 4-digit seven-segment display with the current LFSR value in hexadecimal format. The design supports LFSR sizes from 3 to 16 bits (selectable with switches) and advances the LFSR once per second by default (driven by an internal counter running against a 100 MHz clock). The code can handle LFSR widths up to 32 bits, but since the Basys 3 FPGA I was using has only four segments, I decided to limit it to 16 bits, which allows for display of 0000 to FFFF.

The implementation uses XNOR-style taps in the feedback logic as recommended in this [paper](https://docs.amd.com/v/u/en-US/xapp052) by AMD, which produces affine behavior in some tap combinations.

A snippet video of its operation can be found below:

https://github.com/user-attachments/assets/d1e2a31a-6345-46ed-8786-835f477093b8

