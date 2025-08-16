# AXI4-Lite Memory Verification

It's still WIP. Not yet Completed.

## Overview

This project is for verifying a AXI4-Lite Slave compliant memory modules using SystemVerilog and UVM (Universal Verification Methodology). The testbench validates the functionality of an AXI4-Lite slave memory, focusing on correctness, protocol adherence, and corner cases.

The AXI4-Lite protocol is a lightweight, memory-mapped interface used widely in FPGA and ASIC designs for control and status register access.

## Design Under Test
AXI4-Lite Memory Source - [axil_ram.sv](https://github.com/alexforencich/verilog-axi/blob/master/rtl/axil_ram.v)<br>Thanks [@alexforencich](https://github.com/alexforencich)


## Features to be Implemented
- AXI4-Lite compliant master and slave agents
- Self-checking environment with pass/fail reports
- Protocol checks and assertions
- Scoreboard for data integrity checking
- Functional coverage collection
- Randomized and directed testcases

## References
- [AMBA AXI4-Lite Specification](https://developer.arm.com/documentation/ihi0022/latest/)
- [UVM 1800.2 Standard](https://accellera.org/downloads/standards/uvm)
