# 32-bit Single-Cycle RISC-V Processor

A 32-bit single-cycle RISC-V processor implemented in Verilog HDL, developed through modular RTL design and simulation-based verification.

## Overview

This project aims to design a simplified RISC-V processor by implementing individual hardware modules, verifying them through simulation, and integrating them into a working CPU.

The project is currently under development. Individual RTL modules have been implemented and tested; full CPU integration remains future work.

## Implemented Modules

| Module | Function | Status |
|---|---|---|
| ALU | ADD, SUB, AND, OR, XOR operations and zero flag | Implemented and tested |
| Register File | 32 × 32-bit registers, two read ports, one write port, x0 protection | Implemented and tested |
| Program Counter | Synchronous reset and increment by 4 | Implemented and tested |
| Instruction Memory | Stores predefined 32-bit instructions and provides combinational reads | Implemented and tested |

## Planned Modules

- Immediate Generator
- Control Unit
- Data Memory
- CPU Top module and datapath integration
- Full CPU-level instruction execution and verification

## Planned Instruction Set

The initial processor is intended to support a subset of RV32I instructions:

- **R-type:** ADD, SUB, AND, OR, XOR
- **I-type:** ADDI
- **Load/store:** LW, SW
- **Branch:** BEQ

These instructions will be verified as the processor is integrated. This is an educational subset, not a complete RV32I implementation.

## Tools Used

- Verilog HDL
- Icarus Verilog — RTL compilation and simulation
- GTKWave — waveform analysis
- Visual Studio Code
- Git and GitHub

## Repository Structure

```text
.
├── docs/
│   └── architecture.md
├── rtl/
│   ├── alu.v
│   ├── instruction_memory.v
│   ├── pc.v
│   └── register_file.v
├── sim/
├── tb/
│   ├── alu_tb.v
│   ├── instruction_memory_tb.v
│   ├── pc_tb.v
│   └── register_file_tb.v
├── .gitignore
└── README.md
```

## Running Simulations

Run these commands from the repository root using a terminal with Icarus Verilog installed.

### ALU

```powershell
iverilog -o sim/alu_sim rtl/alu.v tb/alu_tb.v
vvp sim/alu_sim
```

### Register File

```powershell
iverilog -o sim/register_file_sim rtl/register_file.v tb/register_file_tb.v
vvp sim/register_file_sim
```

### Program Counter

```powershell
iverilog -o sim/pc_sim rtl/pc.v tb/pc_tb.v
vvp sim/pc_sim
```

### Instruction Memory

```powershell
iverilog -o sim/instruction_memory_sim rtl/instruction_memory.v tb/instruction_memory_tb.v
vvp sim/instruction_memory_sim
```

To inspect a generated waveform, use GTKWave. For example:

```powershell
gtkwave sim/instruction_memory_waveform.vcd
```

## Verification

The individual testbenches check:

- ALU arithmetic and logical operations.
- Register-file writes, simultaneous reads, and x0 protection.
- Program Counter reset and sequential address updates.
- Instruction Memory reads at aligned addresses.

Full processor-level verification will be added after the modules are integrated.

## Future Work

1. Implement the Immediate Generator and Control Unit.
2. Implement Data Memory and load/store functionality.
3. Connect the modules into a single-cycle CPU.
4. Execute a test program and verify register and memory results.
5. Expand verification and document the final waveforms.
