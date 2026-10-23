# 🔐 Password-Based Digital Door Lock Using Verilog HDL

<p align="center">
  <b>RTL Design | FSM | Sky130 | Yosys | OpenSTA | OpenROAD</b>
</p>

## 📌 Overview

This project implements a password-based digital door lock using Verilog HDL. The design uses a finite state machine (FSM) to control the locking and unlocking operation based on password verification.

When the correct password is entered, the system activates the unlock output. When an incorrect password is entered, the error output is activated.

The project explores RTL design, functional simulation, synthesis, static timing analysis, and physical design.

## 🎯 Objectives

* Design a digital door lock using Verilog HDL.
* Implement password verification.
* Control the lock using an FSM.
* Verify correct and incorrect password conditions.
* Perform RTL simulation and synthesis.
* Analyze timing using OpenSTA.
* Explore the Sky130 physical design flow.

## 🛠️ Tools and Technologies

| Tool           | Purpose                |
| -------------- | ---------------------- |
| Verilog HDL    | RTL design             |
| Icarus Verilog | Functional simulation  |
| GTKWave        | Waveform visualization |
| Yosys          | Logic synthesis        |
| Sky130 HD      | Standard-cell library  |
| OpenSTA        | Static timing analysis |
| OpenROAD       | Physical design        |

## ⚙️ Design Features

* Password-based access control
* Locked and unlocked states
* Incorrect-password indication
* Reset functionality
* Automatic relocking
* Testbench-based verification

## 🔄 Design Flow

```text
       RTL Design
           |
           v
    Testbench Simulation
           |
           v
        Synthesis
           |
           v
   Static Timing Analysis
           |
           v
      Floorplanning
           |
           v
        Placement
           |
           v
   Clock Tree Synthesis
           |
           v
         Routing
           |
           v
      Final GDS Layout
```

*The diagram represents the intended workflow. Completion of each stage must be confirmed using its actual outputs.*

## 📂 Repository Structure

```text
Password-Based-Digital-Door-Lock/
│
├── README.md
├── rtl/
│   └── digitalclk.v
├── testbench/
│   └── digitalclk_tb.v
├── constraints/
│   └── digitalclk.sdc
├── synthesis/
│   └── synth_sky130.ys
├── timing_analysis/
│   └── run_sta.tcl
├── simulation/
│   └── door_lock.vcd
├── physical_design/
│   └── README.md
└── images/
    ├── simulation.png
    ├── synthesis.png
    ├── timing_analysis.png
    └── final_layout.png
```

*Adjust the tree to match the files actually present in your repository.*

## 🧪 Functional Verification

The testbench verifies the behaviour of the digital door lock.

| Test Case           | Expected Behaviour                     |
| ------------------- | -------------------------------------- |
| Reset               | System initializes in the locked state |
| Correct password    | Unlock output activates                |
| Incorrect password  | Error output activates                 |
| Automatic relocking | System returns to the locked state     |
| Reset after error   | System returns to its initial state    |

The password used in the existing simulation is `1011`.

## 🔬 RTL Simulation

Simulation is performed using Icarus Verilog. GTKWave can be used to inspect the clock, reset, password input, and output signals.

### Simulation Waveform

Add your actual waveform screenshot here.

## ⚡ Synthesis

The RTL design is synthesized using Yosys with the Sky130 HD standard-cell library.

The synthesis process converts the RTL description into a gate-level netlist.

### Synthesis Results

Add your actual synthesis report or screenshot here.

## 📈 Static Timing Analysis

OpenSTA is used to analyze the timing characteristics of the synthesized design using the Sky130 timing library and SDC constraints.

The analysis includes timing paths, arrival times, required times, slack, and other timing metrics.

### Timing Results

Add your actual timing report screenshot here.

## 🏗️ Physical Design

The next implementation stages are documented below.

* **Floorplanning:** Define the core and die regions.
* **Placement:** Position standard cells.
* **Clock Tree Synthesis:** Build the clock distribution network if required by the selected flow.
* **Routing:** Connect the design using available routing layers.
* **Final Layout:** Generate and verify the final layout database and GDSII output.

Add screenshots only after the corresponding stages have successfully completed.

## 📚 Learning Outcomes

* RTL design using Verilog HDL
* FSM-based control logic
* Functional verification using testbenches
* Standard-cell synthesis
* Static timing analysis
* Digital physical design
* GitHub project documentation
* <img width="492" height="408" alt="Screenshot 2026-10-23 185233" src="https://github.com/user-attachments/assets/4b8e0989-5d17-4ca5-be9b-cc3d2b314493" />


## 🏁 Conclusion

The Password-Based Digital Door Lock demonstrates the implementation and verification of a basic digital access-control system using Verilog HDL.

The project provides practical exposure to RTL development and the digital VLSI implementation workflow.

---

**Project:** Password-Based Digital Door Lock

**HDL:** Verilog

**Technology:** Sky130 HD

**Focus:** Digital Design and VLSI Implementation
