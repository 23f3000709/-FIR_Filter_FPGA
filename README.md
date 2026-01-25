# Design and FPGA Implementation of a Digital FIR Filter

## Overview
This project demonstrates the complete DSP-to-FPGA design flow of a
Finite Impulse Response (FIR) filter. The FIR filter is first designed
and analyzed in MATLAB, then implemented using Verilog HDL, verified
through simulation, and finally synthesized and implemented on FPGA
using Xilinx Vivado with timing constraints.

The project focuses on fixed-point digital signal processing and
hardware-efficient implementation using FPGA DSP blocks.

---

## Design Flow
1. FIR filter design and analysis in MATLAB
2. Generation of FIR filter coefficients
3. Fixed-point RTL implementation in Verilog
4. Functional verification using testbench (EDA Playground)
5. FPGA synthesis and implementation in Vivado
6. Timing constraint application and timing closure

---

## MATLAB Design
- FIR filter designed using standard DSP techniques
- Frequency response and impulse response analyzed
- Coefficients generated for fixed-point implementation

File:
- `test_filter.m` – MATLAB script for FIR filter design

---

## RTL Implementation
- FIR filter implemented using direct-form architecture
- Shift-register based delay line
- Multiply-Accumulate (MAC) operation
- Fixed-point arithmetic for FPGA efficiency

Files:
- `fir_filter_fpga.v` – FIR filter RTL module
- `top.sv` – Top-level FPGA wrapper module

---

## Functional Verification
The Verilog design was verified using a self-checking testbench on
EDA Playground.

EDA Playground link:
https://www.edaplayground.com/x/di9w

Testbench File:
- `tb_fir_filter.sv`

---

## FPGA Implementation
- Synthesized and implemented using Vivado 2025.2
- Clock constraints applied using XDC file
- Timing closure successfully achieved

Constraint File:
- `constraints.xdc`

---

## Results
- Timing constraints met successfully
- No setup or hold timing violations
- Efficient hardware mapping achieved

Resource Utilization:
- DSP Blocks: 24
- LUTs: 16
- Registers: 385

This confirms that each FIR tap is mapped to FPGA DSP blocks,
demonstrating a hardware-optimized implementation.

---

## Applications
- Audio noise reduction
- Digital signal filtering
- Real-time DSP acceleration on FPGA
- Embedded signal processing systems

---

## Future Work
- Interface FIR filter with real audio input (ADC / I2S)
- Real-time audio noise filtering on FPGA board
- Pipelined FIR architecture for higher clock frequency
- AXI-Stream based data flow integration

---

## Tools Used
- MATLAB
- Verilog / SystemVerilog
- EDA Playground
- Xilinx Vivado 2025.2

---

## Author
Shubham
