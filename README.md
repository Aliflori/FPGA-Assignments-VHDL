# 🛠️ VHDL Projects for Digital Systems Design
![Language](https://img.shields.io/badge/Language-VHDL-DB5A21?style=for-the-badge&logo=VHDL&logoColor=white)
![FPGA](https://img.shields.io/badge/Target-FPGA-5A4294?style=for-the-badge)

This repository contains a series of VHDL projects developed for a course in **Digital Systems Design (FPGA/ASIC)**. The projects cover a wide spectrum of digital logic design, from basic combinational and sequential circuits to complex memory systems, structural designs, and communication protocols implemented as finite state machines.

Each project is designed to be **synthesizable** for implementation on an FPGA.

## 💻 Technology Stack
* **Hardware Description Language**: **VHDL**
* **Target Technology**: **FPGA**
* **Verification**: Each design is accompanied by a **VHDL Testbench** for simulation and verification of functionality.

---

## 📂 Assignment Summaries

<details>
<summary>
  <strong>Assignment 1: Combinational and Sequential Logic</strong>
</summary>

This assignment focuses on designing fundamental digital circuits.
* **Parity-Based Arithmetic Unit**: A combinational circuit that takes an 8-bit input and checks its parity (whether the count of '1's is even or odd). It then performs one of two different arithmetic operations based on the result.
* **Digital Stopwatch**: A sequential circuit that functions as a stopwatch, capable of measuring time with outputs for minutes, seconds, and hundredths of a second. It includes asynchronous reset and start/stop controls.
* **Variable Duty Cycle Frequency Divider**: A circuit that divides an input clock frequency by a factor of 100. A 4-bit control input allows the duty cycle of the output clock to be adjusted from 0% to 100% in 10% increments.
</details>

<details>
<summary>
  <strong>Assignment 2: Structural VHDL Design</strong>
</summary>

This assignment emphasizes hierarchical and modular design using a **structural** VHDL coding style.
* **Convolution Circuit**: A hardware implementation of a 10-tap convolution sum ($y = \sum_{i=1}^{10} a_i x_i$). The design is built by creating and connecting separate, reusable VHDL components, including:
    * 8-bit Registers
    * An 8x8 Multiplier
    * An 8-bit Adder
    * A counter to track the 10 inputs.
</details>

<details>
<summary>
  <strong>Assignment 3: Memory Systems</strong>
</summary>

This assignment covers the design of different types of on-chip memory.
* **Dual-Port RAM**: A 256-byte Random Access Memory (RAM) that can be accessed from two independent ports simultaneously, allowing for concurrent read and write operations.
* **Variable-Size LIFO Stack**: A configurable **LIFO (Last-In, First-Out) memory**, also known as a stack. The depth of the stack is determined by a `constant` value. The design includes `full` and `empty` status flags to manage stack operations.
</details>

<details>
<summary>
  <strong>Assignment 4: Finite State Machines (FSM) & Protocols</strong>
</summary>

This assignment focuses on using FSMs to implement a standard communication protocol.
* **SPI Protocol Controller**: A **Finite State Machine (FSM)** that implements the Serial Peripheral Interface (SPI) communication protocol. The FSM controls the data flow and signaling (`SCK`, `MOSI`, `CS`, `MISO`). It manages the system through three primary states:
    * `idle`
    * `send`
    * `tranceive` (transceive/receive)
</details>

## 🚀 How to Use
Each assignment folder contains the synthesizable VHDL (`.vhd`) files for the design and its corresponding testbench.
1.  Use a VHDL simulator (like ModelSim, QuestaSim, or the one integrated into Vivado/Quartus) to run the testbench file and verify the design's behavior.
2.  Use an FPGA synthesis tool (like Xilinx Vivado or Intel Quartus) to synthesize the main design file and view resource utilization reports.

## ✍️ Author
* **Ali Naghiloo**

---
*This collection of projects is for educational and portfolio purposes.*
