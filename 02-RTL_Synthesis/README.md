# ⚙️ RTL Synthesis Using Yosys and Sky130 HD
<p align="center">
  <img src="https://img.shields.io/badge/HDL-Verilog-blue?style=for-the-badge" alt="Verilog">
  <img src="https://img.shields.io/badge/Synthesis-Yosys-purple?style=for-the-badge" alt="Yosys">
  <img src="https://img.shields.io/badge/Technology-SKY130HD-green?style=for-the-badge" alt="SKY130HD">
</p>
<h3 align="center">Password Based Digital Door Lock</h3>

<p align="center">
  <i>From RTL Description to Standard-Cell Implementation</i>
</p>

---
## Table of Contents

- [1. Introduction](#-1-introduction)
- [2. Objectives](#-2-objectives)
- [3. Synthesis Flow](#-3-synthesis-flow)
- [4. Tools and Technology](#-4-tools-and-technology)
- [5. Generic RTL Synthesis](#-5-generic-rtl-synthesis)
- [6. SKY130HD Technology Mapping](#-6-sky130hd-technology-mapping)
- [7. Yosys Synthesis Schematic](#-7-yosys-synthesis-schematic)
- [8. Generated Artifacts](#-8-generated-artifacts)
- [9. Synthesis Results and Verification](#-9-synthesis-results-and-verification)
- [10. Summary](#-10-summary)

## 📌 Overview

RTL synthesis is an important stage in the digital VLSI design flow. It converts the Register Transfer Level (RTL) description written in Verilog HDL into a gate-level representation using standard-cell logic.

In this project, the Password-Based Digital Door Lock is synthesized using Yosys with the Sky130 HD standard-cell library.

The synthesis process translates the password-verification and lock-control logic into a netlist that can be used for subsequent static timing analysis and physical design.

## 🎯 Objectives

* Convert the Verilog RTL into a gate-level netlist.
* Check the hierarchy of the digital door-lock design.
* Perform logic optimization.
* Map sequential elements to available standard cells.
* Map combinational logic to the Sky130 HD library.
* Generate a synthesized Verilog netlist.
* Obtain synthesis statistics.
* Prepare the design for further implementation stages.
## 3. Synthesis Flow

```text
       Verilog RTL Design
               |
               v
       Read RTL Source
               |
               v
     Hierarchy and Checks
               |
               v
      Logic Optimization
               |
               v
        Generic Synthesis
               |
               v
    Generic Gate-Level Netlist
               |
               v
     SKY130HD Technology Mapping
               |
               v
      Mapped Gate-Level Netlist
               |
               v
    Schematic and Report Analysis
               |
               v
       Gate-Level Simulation
```
## 🛠️ Tools and Technologies

| Tool or Technology | Purpose                                   |
| ------------------ | ----------------------------------------- |
| Verilog HDL        | RTL design description                    |
| Yosys              | Logic synthesis                           |
| Sky130 HD          | Standard-cell technology library          |
| Liberty (`.lib`)   | Cell functionality and timing information |
| Verilog netlist    | Output of synthesis                       |

## 📂 Input Files

### `digitalclk.v`

This is the main RTL source file for the Password-Based Digital Door Lock.

It describes the control logic used to process the password input and generate the lock-status outputs.

### Sky130 HD Liberty File

The Liberty file describes the available standard cells and their electrical and timing characteristics.

The selected library must be compatible with the technology-mapping configuration used by Yosys.

## ⚙️ Synthesis Flow

The synthesis process consists of the following steps.

### 1. RTL Reading

Yosys reads the Verilog source file and converts it into an internal representation of the design.

### 2. Hierarchy Checking

The design hierarchy is checked to ensure that the specified top-level module exists and that the referenced modules can be resolved.

The top-level module for this project is `digitalclk`.

### 3. Logic Synthesis

Yosys performs synthesis transformations and logic optimization to prepare the RTL design for implementation using standard cells.

### 4. Sequential Cell Mapping

The sequential elements in the design are mapped to compatible flip-flop cells available in the selected Sky130 library.

### 5. Combinational Logic Mapping

The combinational logic is mapped to standard cells using the ABC technology-mapping engine.

### 6. Netlist Generation

After technology mapping, Yosys generates a Verilog netlist representing the synthesized design.

### 7. Statistics

The synthesis statistics summarize the resulting design structure and the cells used.

Depending on the synthesis configuration, these statistics can include cell counts and other implementation details.

## 📊 Synthesis Output

The main output is a synthesized Verilog netlist.

Example filename:

`digitalclk_synth.v`

This file represents the synthesized implementation and can be used as an input to subsequent implementation stages when the required libraries and configuration are available.

## 📈 Results and Reports

The following results can be included after successfully completing synthesis:

* Yosys synthesis log.
* Number and types of mapped cells.
* Synthesized Verilog netlist.
* Technology-mapping results.
* Synthesis statistics screenshot.

Actual cell counts and other numerical results should be taken from the generated synthesis report.

## 📷 Synthesis Screenshot
<img width="1920" height="1060" alt="synthofdclk" src="https://github.com/user-attachments/assets/f4d21f8a-79ca-4db3-80fd-7f5d899e6a19" />

## 🔗 Connection to Other Stages

The synthesized netlist provides a starting point for subsequent implementation stages.

The next stages may include:

1. Static timing analysis.
2. Floorplanning.
3. Placement.
4. Clock tree synthesis, if required by the selected flow.
5. Routing.
6. Final layout generation.

The exact sequence depends on the configured physical-design flow.

## 📝 Conclusion

RTL synthesis converts the Password-Based Digital Door Lock from a behavioural Verilog description into a gate-level representation using the Sky130 HD standard-cell library.

This stage connects the RTL design to the implementation flow and provides the synthesized netlist required for further timing analysis and physical-design work.
<p align="center">
  <b>Designed and Documented by C. Rupa sri </b><br/>
  VLSI Design | RTL Synthesis | Technology Mapping
</p>

<p align="center">
  <i>"Every optimized netlist begins with precise logic design and a reliable synthesis flow."</i>
</p>
