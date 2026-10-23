# 🔐 Password-Based Digital Door Lock

This project implements a password-based digital door lock using Verilog HDL. The design uses digital logic to verify an entered password and control the locked and unlocked conditions. It includes RTL design, testbench verification, synthesis using Yosys, and implementation preparation using the Sky130 standard-cell library.

# 🔐 Password-Based Digital Door Lock in Verilog

This project demonstrates a digital security system using a password verification mechanism. The controller accepts a four-bit password and produces outputs according to the verification result.

---
## Table of Contents

- [1. RTL Implementation](#-1-rtl-implementation)
- [2. FSM Implementation](#-2-fsm-implementation)
- [3. Countdown Timer and Display Logic](#-3-countdown-timer-and-display-logic)
- [4. Module Interface](#-4-module-interface)
- [5. Source Files](#-5-source-files)
- [6. RTL Simulation](#-6-rtl-simulation)
- [7. Waveform Generation and Analysis](#-7-waveform-generation-and-analysis)
- [8. Signals Observed](#-8-signals-observed)
- [9. Tools Used](#-9-tools-used)
- [10. Summary](#-10-summary)
---

## 📌 Description

The digital door lock operates according to the following sequence:

* The system initializes in the locked state.
* The user enters a four-bit password.
* The controller checks the password when the entry signal is activated.
* If the password is correct, the unlock output becomes active.
* If the password is incorrect, the error output becomes active.
* The system supports reset and automatic relocking according to the implemented logic.

The password used in the existing simulation is `1011`.

---

## 🧠 Features

* Designed using Verilog HDL.
* Uses sequential digital logic for control.
* Password verification mechanism.
* Locked and unlocked status outputs.
* Error indication for incorrect passwords.
* Clock and reset functionality.
* Automatic relocking logic.
* Includes a separate Verilog testbench.
* Simulation waveform verification using GTKWave.
* Synthesis using Yosys and the Sky130 HD library.
* Static timing analysis using OpenSTA.

---


## 🔧 Module Overview

### `digitalclk.v`

This is the main Verilog RTL module responsible for the digital door-lock operation.

**Inputs**

| Signal          | Description             |
| --------------- | ----------------------- |
| `clk`           | Clock input             |
| `rst`           | Reset input             |
| `enter`         | Password-entry control  |
| `password[3:0]` | Four-bit password input |

**Outputs**

| Signal   | Description                      |
| -------- | -------------------------------- |
| `unlock` | Indicates the unlocked condition |
| `locked` | Indicates the locked condition   |
| `error`  | Indicates an incorrect password  |

### `digitalclk_tb.v`

The testbench verifies the functionality of the RTL design by applying different input conditions.

It includes test scenarios for reset, correct password entry, incorrect password entry, automatic relocking, and recovery after an error.

---

## 📷 RTL Schematic

Upload your actual RTL schematic screenshot to the `images` folder.



## 🧪 Simulation

The design can be simulated using Icarus Verilog. GTKWave can be used to view the generated waveform.

### Simulation Waveform

<img width="1920" height="1060" alt="gtkwave_digitalclk" src="https://github.com/user-attachments/assets/a523e4b6-8a75-4a30-8dbe-a94e2f1209d4" />


The waveform can be used to observe the clock, reset, password input, unlock output, locked output, and error output.

---

## ⚡ Synthesis

The RTL design is synthesized using Yosys with the Sky130 HD standard-cell library.

Synthesis translates the RTL description into a gate-level netlist for subsequent implementation stages.


## 🛠️ Software and Tools

* Verilog HDL
* Icarus Verilog
* GTKWave
* Yosys
* Sky130 HD standard-cell library
* OpenSTA
* OpenROAD

---

## 🚀 Future Work

The following stages can extend the existing synthesis work:

* Static timing analysis and report verification.
* Floorplanning and placement.
* Clock tree synthesis, if required by the selected flow.
* Routing and physical verification.
* Final GDSII generation.

These stages should be marked complete only after their outputs have been generated and verified.

---

## 📝 Conclusion

The Password-Based Digital Door Lock demonstrates the use of Verilog HDL to implement a basic digital access-control system. The project covers RTL development, functional verification, and synthesis, providing a foundation for further timing analysis and physical-design implementation.

<p align="center">
  <b>Designed and Documented by C.Rupa sri</b><br/>
  VLSI Design | RTL Development | Functional Verification
</p>

<p align="center">
  <i>"Reliable hardware begins with well-designed RTL and careful verification."</i>
</p>
