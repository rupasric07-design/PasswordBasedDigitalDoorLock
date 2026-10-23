# Static Timing Analysis (STA) – Password-Based Digital Door Lock

<p align="center">
  <img src="https://img.shields.io/badge/Analysis-Static%20Timing-blue?style=for-the-badge" alt="Static Timing Analysis">
  <img src="https://img.shields.io/badge/Technology-SKY130HD-green?style=for-the-badge" alt="SKY130HD">
  <img src="https://img.shields.io/badge/Tool-OpenSTA-purple?style=for-the-badge" alt="OpenSTA">
</p>

<h3 align="center">Password-Based Digital Door Lock</h3>

<p align="center">
  <i>Timing Verification of the Synthesized Digital Circuit</i>
</p>

---

## 1. Overview

Static Timing Analysis (STA) is an important stage in the digital VLSI design flow. It verifies whether a synthesized digital circuit satisfies its timing constraints without requiring functional simulation.

In this project, Static Timing Analysis is performed on the Password-Based Digital Door Lock using OpenSTA and the SKY130 High-Density standard-cell library.

The analysis evaluates signal propagation delays, timing paths, arrival times, required times, and slack to determine whether the design meets its specified timing requirements.

## 2. Objectives

The main objectives of Static Timing Analysis are:

* Verify the timing characteristics of the synthesized netlist.
* Define clock and input/output timing constraints.
* Analyze signal propagation delays.
* Calculate setup slack for timing paths.
* Identify possible timing violations.
* Evaluate the design against its specified clock requirements.
* Generate timing reports for verification.

## 3. Project Description

The Password-Based Digital Door Lock is a digital security system implemented using Verilog HDL.

The top-level module is named `digitalclk`. It receives a clock signal, reset signal, four-bit password input, and password-entry control signal.

The design processes the inputs according to its control logic and generates outputs indicating the lock status and access result.

After synthesis and technology mapping, the generated gate-level netlist is analyzed to evaluate its timing characteristics using OpenSTA.

The SKY130 standard-cell timing library provides the cell timing information required for the analysis.

## 4. Tools and Technologies

| Tool or Technology | Purpose                          |
| ------------------ | -------------------------------- |
| Verilog HDL        | RTL design                       |
| Yosys              | Logic synthesis                  |
| SKY130 HD Library  | Standard-cell timing information |
| OpenSTA            | Static Timing Analysis           |
| SDC                | Timing constraint definition     |
| Ubuntu             | Development environment          |
| Docker             | Running the OpenSTA environment  |

## 5. Static Timing Analysis Flow

The STA process follows these steps:

1. Complete the RTL design using Verilog HDL.
2. Verify the RTL design using a testbench.
3. Synthesize the design using Yosys.
4. Map the design to SKY130 standard cells.
5. Generate the synthesized gate-level netlist.
6. Prepare the timing constraint file.
7. Load the SKY130 timing library.
8. Load the netlist into OpenSTA.
9. Apply the timing constraints.
10. Analyze the timing paths.
11. Calculate arrival times, required times, and slack.
12. Generate and inspect the timing report.

## 6. Project Files

The following files are associated with the STA stage:

```text
Password-Based-Digital-Door-Lock/
├── digitalclk.v
├── digitalclk_sky130.v
├── digitalclk.sdc
├── run_sta.tcl
├── sta_results.txt
└── README.md
```

**Note:** Include only files that exist in your repository. The `sta_results.txt` file can be added after a successful timing analysis.

## 7. Timing Constraints

Timing constraints specify the operating requirements of the digital circuit.

The Synopsys Design Constraints (SDC) file defines the clock and relevant input/output timing requirements.

### 7.1 Clock Constraint

An example clock constraint for a 10 ns clock period is:

```tcl
create_clock -name clk -period 10.0 [get_ports clk]
```

A 10 ns clock period corresponds to a clock frequency of 100 MHz.

### 7.2 Input and Output Delays

Input and output delays describe timing relationships between the circuit and external signals.

Example:

```tcl
set_input_delay 1.0 -clock clk [get_ports {enter}]
set_output_delay 1.0 -clock clk [get_ports {unlock}]
```

These are illustrative examples. The actual constraints used for this project are defined in `digitalclk.sdc`.

## 8. Static Timing Analysis Using OpenSTA

OpenSTA is used to evaluate the timing characteristics of the synthesized gate-level design.

The analysis uses:

* Synthesized Verilog netlist.
* SKY130 HD timing library.
* SDC timing constraints.
* OpenSTA Tcl script.

The tool analyzes timing paths and reports information such as startpoints, endpoints, cell delays, data arrival times, required times, and slack.

## 9. Important Timing Parameters

### 9.1 Clock Period

The clock period specifies the time available for a synchronous operation.

For example, a 10 ns clock period corresponds to 100 MHz.

### 9.2 Data Arrival Time

Data arrival time is the time taken for a signal to propagate from the startpoint to the endpoint of a timing path.

### 9.3 Data Required Time

Data required time is the deadline by which data must arrive to satisfy the applicable timing constraint.

### 9.4 Slack

Slack represents the difference between the required arrival time and the actual arrival time, according to the timing check being reported.

For setup analysis:

* **Positive slack:** The analyzed path meets its setup timing requirement.
* **Zero slack:** The analyzed path is at its timing limit.
* **Negative slack:** The analyzed path violates its setup timing requirement.

### 9.5 Worst Negative Slack (WNS)

Worst Negative Slack is the worst slack among the applicable analyzed setup paths.

A negative WNS indicates that at least one analyzed path violates its setup timing requirement.

## 10. Timing Analysis Results

Record the values from your actual OpenSTA timing report.

| Parameter           | Result                               |
| ------------------- | ------------------------------------ |
| Top Module          | `digitalclk`                         |
| Technology Library  | SKY130 HD                            |
| Clock Period        | 10 ns, if specified in the final SDC |
| Data Arrival Time   | Add measured value                   |
| Worst Setup Slack   | Add measured value                   |
| Setup Timing Status | MET or VIOLATED                      |
| Analysis Tool       | OpenSTA                              |

**Important:** Replace the placeholder values with the actual measurements from your final timing report.

## 11. Screenshots

### 11.1 OpenSTA Execution
<img width="1920" height="1060" alt="dclkslack" src="https://github.com/user-attachments/assets/4e6e6ecc-dbc7-4a17-babe-5980ad96da70" />

### 11.3 Timing Summary
<img width="1536" height="1024" alt="STA Timing Across Library Corners" src="https://github.com/user-attachments/assets/d04ea617-d733-47d2-b201-ba1d7361c645" />


## 12. Current Status

**Stage:** Static Timing Analysis

**Tool:** OpenSTA

**Technology:** SKY130 HD standard-cell library

**Status:** Update after verifying the final timing report.

The STA stage is considered complete when the correct netlist and timing constraints are loaded, the analysis executes successfully, and the timing report is checked.

## 13. Applications of Static Timing Analysis

Static Timing Analysis is useful for:

* Verifying timing constraints in digital circuits.
* Identifying critical timing paths.
* Checking setup timing requirements.
* Evaluating standard-cell propagation delays.
* Detecting timing violations.
* Supporting timing optimization during VLSI design.

## 14. Conclusion

Static Timing Analysis is an essential verification step in the digital VLSI design flow. It evaluates whether the synthesized Password-Based Digital Door Lock satisfies its specified timing requirements.

Using OpenSTA and the SKY130 HD standard-cell library, the design can be analyzed for propagation delays, arrival times, required times, and timing slack.

The resulting timing report provides evidence of the design's timing behavior and helps identify whether further optimization is required.

---

<p align="center">
  <b>Designed and Documented by C. Rupa Sri</b><br>
  VLSI Design | Static Timing Analysis | Timing Verification
</p>

<p align="center">
  <i>Reliable hardware is built by verifying timing at every stage of the VLSI design flow.</i>
</p>
