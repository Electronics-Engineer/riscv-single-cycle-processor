# 32-bit Single-Cycle RISC-V Processor
## Project Overview

This project implements a simplified 32-bit single-cycle processor based on the RISC-V instruction set architecture (ISA). The processor is designed using Verilog HDL and verified through simulation and waveform analysis.

The objective of this project is to understand and implement the fundamental components of a processor, including the datapath, control unit, arithmetic logic unit, register file, instruction memory, and data memory.

## Project Objectives

The processor will:

* Fetch instructions from instruction memory.
* Decode the instruction and determine the required operation.
* Read source operands from the register file.
* Perform arithmetic or logical operations using the ALU.
* Access data memory for load and store instructions.
* Write results back to the register file.
* Update the Program Counter (PC).
* Execute a selected subset of 32-bit RISC-V instructions.

## Processor Architecture

The processor follows a single-cycle architecture.
Each instruction completes its execution within one clock cycle.

The main stages of instruction execution are:

1. Instruction Fetch (IF)
2. Instruction Decode (ID)
3. Execute (EX)
4. Memory Access (MEM)
5. Write Back (WB)

Although these stages exist logically, they are completed within a single clock cycle in this design.

## Supported Instruction Set

The initial processor implementation will support the following instructions.

### R-Type Instructions

| Instruction | Operation   |
| ----------- | ----------- |
| ADD         | Addition    |
| SUB         | Subtraction |
| AND         | Bitwise AND |
| OR          | Bitwise OR  |
| XOR         | Bitwise XOR |

### I-Type Instructions

| Instruction | Operation     |
| ----------- | ------------- |
| ADDI        | Add Immediate |

### Load and Store Instructions

| Instruction | Operation  |
| ----------- | ---------- |
| LW          | Load Word  |
| SW          | Store Word |

### Branch Instructions

| Instruction | Operation       |
| ----------- | --------------- |
| BEQ         | Branch if Equal |

## Major Hardware Modules

The processor will be divided into the following RTL modules:

### 1. Program Counter

Stores the address of the current instruction and updates the address for the next instruction.

### 2. Instruction Memory

Stores the instructions executed by the processor.

### 3. Control Unit

Decodes the instruction opcode and generates control signals required by the datapath.

### 4. Register File

Contains 32 general-purpose registers, each 32 bits wide.

The register file provides:

* Two read ports
* One write port
* Register x0 permanently set to zero

### 5. Immediate Generator

Extracts and sign-extends immediate values from RISC-V instructions.

### 6. Arithmetic Logic Unit

Performs arithmetic and logical operations including:

* Addition
* Subtraction
* AND
* OR
* XOR

### 7. Data Memory

Stores data used by load and store instructions.

### 8. CPU Top Module

Integrates all processor modules and implements the complete single-cycle datapath.

## Development Plan

The processor will be developed and verified in the following order:

1. Set up simulation environment.
2. Design and verify the ALU.
3. Design and verify the register file.
4. Design the Program Counter.
5. Design instruction memory.
6. Design the immediate generator.
7. Design the control unit.
8. Design data memory.
9. Integrate the complete CPU datapath.
10. Perform CPU-level verification.

## Verification Strategy

Each RTL module will be verified individually using a dedicated testbench.

The verification process will include:

1. Applying input test cases.
2. Running simulations.
3. Checking expected outputs.
4. Viewing waveforms.
5. Debugging and correcting RTL errors.

After individual modules are verified, the complete processor will be tested using a small RISC-V program.

## Future Improvements

Possible future improvements include:

* Additional RISC-V instructions.
* JAL and jump instructions.
* Shift operations.
* Multi-cycle architecture.
* Five-stage pipelined architecture.
* Hazard detection and forwarding.
* FPGA implementation.
