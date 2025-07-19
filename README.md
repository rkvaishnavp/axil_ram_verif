# AXI4-Lite Memory Verification

## Overview

This project provides a verification environment for AXI4-Lite compliant memory modules using SystemVerilog and UVM (Universal Verification Methodology). The testbench validates the functionality of an AXI4-Lite slave interface, focusing on correctness, protocol adherence, and basic corner cases.

The AXI4-Lite protocol is a lightweight, memory-mapped interface used widely in FPGA and ASIC designs for control and status register access.

<!-- ## Features

✅ AXI4-Lite compliant master and slave agents  
✅ Configurable memory model for read/write transactions  
✅ Randomized and directed testcases  
✅ Protocol checks and assertions  
✅ Scoreboard for data integrity checking  
✅ Functional coverage collection  
✅ Self-checking environment with pass/fail reports

## Directory Structure

```
axi4lite_verification/
│
├── docs/              # Documentation and diagrams
├── rtl/               # DUT (Design Under Test) files
├── tb/                # Testbench files
│   ├── env/           # UVM environment files
│   ├── test/          # Test scenarios
│   ├── sequences/     # Sequences driving stimulus
│   └── agents/        # AXI4-Lite master/slave agents
├── sim/               # Simulation scripts (Makefile, run.do, etc.)
└── README.md          # This file
```

## Getting Started

### Prerequisites

- Simulator: QuestaSim, VCS, Xcelium, or Verilator (limited SystemVerilog support)
- UVM Library
- GNU Make or equivalent build tool

### Cloning the Repository

```bash
git clone https://github.com/your_org/axi4lite_verification.git
cd axi4lite_verification
```

## Usage

### Running Simulation

```bash
cd sim
make run TEST=<test_name>
```

Example:
```bash
make run TEST=basic_read_write
```

### Testcases

| Test Name             | Description                          |
| --------------------- | ------------------------------------ |
| basic_read_write      | Simple read/write functional test    |
| random_access         | Random address and data transactions |
| burst_write (if used) | Burst write test (if applicable)     |
| reset_test            | Reset and recovery scenarios         |
| protocol_violation    | Negative test for protocol checks    |

## Coverage

- **Functional Coverage**: Collected via covergroups in sequences and scoreboard
- **Code Coverage**: Enabled via simulator-specific options
- Coverage report can be generated using:

```bash
make coverage
```

## Results

Test results and logs are saved under the `sim/reports/` directory. Each test run generates:

- `transcript.log`
- `waveform.vcd` or `dump.fsdb` (if enabled)
- `coverage.ucdb` (if applicable)

## Waveform Viewing

To view waveforms:
```bash
make wave
```

Or manually:
```bash
vsim -view sim/reports/<test_name>/waveform.vcd
```

## Contributing

Contributions are welcome! Feel free to fork the repository, make changes, and submit a pull request. For major changes, please open an issue first to discuss.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## References

- [AMBA AXI4-Lite Specification](https://developer.arm.com/documentation/ihi0022/latest/)
- [UVM 1800.2 Standard](https://accellera.org/downloads/standards/uvm) -->