# Physical Design Implementation Using OpenROAD

<p align="center">
  <img src="https://img.shields.io/badge/Physical%20Design-OpenROAD-7C3AED?style=for-the-badge" alt="OpenROAD Physical Design"/>
  <img src="https://img.shields.io/badge/PDK-SKY130HD-4F46E5?style=for-the-badge" alt="SKY130HD"/>
  <img src="https://img.shields.io/badge/Flow-RTL%20to%20Layout-0891B2?style=for-the-badge" alt="RTL to Layout"/>
  <img src="https://img.shields.io/badge/Design-Digital%20Door%20Lock-16A34A?style=for-the-badge" alt="Digital Door Lock"/>
</p>

<p align="center">
  <i>Implementation of a password-based digital door lock using RTL design, synthesis, timing analysis, and ASIC physical-design concepts.</i>
</p>

---

## Overview

This project implements a **Password-Based Digital Door Lock** using Verilog HDL and explores its implementation using the **OpenROAD physical-design flow** and the **SkyWater SKY130HD standard-cell platform**.

The design uses a finite-state-machine-based control mechanism to compare an entered password with a predefined password. When the correct password is entered, the lock generates an unlock signal. Incorrect password entries generate an error indication, while reset and automatic relocking support the control sequence.

The RTL design is represented by the top-level module `digitalclk`. Functional simulation, synthesis, and static timing analysis form the foundation of the implementation workflow.

The physical-design stage explores how synthesized logic can be transformed into a physically placed-and-routed circuit.

## Design Objectives

* Implement a password-based digital door lock using Verilog HDL.
* Verify the design using a testbench and functional simulation.
* Synthesize the RTL using the SKY130HD standard-cell library.
* Analyze timing using static timing analysis (STA).
* Explore floorplanning and power-distribution preparation.
* Understand global and detailed placement.
* Examine clock tree synthesis (CTS).
* Explore global and detailed routing.
* Inspect final timing reports and physical-design artifacts.
* Document the design and implementation workflow in GitHub.

## Design Environment

| Parameter                     | Configuration                    |
| :---------------------------- | :------------------------------- |
| Project Name                  | Password-Based Digital Door Lock |
| Top Module                    | `digitalclk`                     |
| Hardware Description Language | Verilog HDL                      |
| Physical-Design Flow          | OpenROAD Flow Scripts            |
| Standard-Cell Platform        | SKY130HD                         |
| Synthesis Tool                | Yosys                            |
| Static Timing Analysis        | OpenSTA                          |
| Functional Simulation         | Icarus Verilog                   |
| Waveform Viewer               | GTKWave                          |
| Clock Period                  | 10 ns                            |
| Timing Constraints            | `digitalclk.sdc`                 |

## Design Functionality

The door-lock controller uses the following signals:

| Signal     | Description                            |
| :--------- | :------------------------------------- |
| `clk`      | Clock input                            |
| `rst`      | Reset input                            |
| `enter`    | Password submission control            |
| `password` | Four-bit password input                |
| `unlock`   | Indicates that the lock is unlocked    |
| `locked`   | Indicates that the door remains locked |
| `error`    | Indicates an incorrect password        |

The predefined password used in the functional simulation is `1011`.

### Expected Operation

1. The controller starts in its reset or locked state.
2. The user enters a four-bit password.
3. The controller checks the password when the enter signal is activated.
4. If the password is correct, the unlock output is activated.
5. If the password is incorrect, the error output indicates the failed attempt.
6. The controller returns to the locked state according to its implemented relocking logic.

The exact state transitions and timing depend on the RTL implementation in `digitalclk.v`.

## RTL-to-Physical Design Flow

### 1. RTL Design

The controller is implemented in Verilog HDL.

**Main activities:**

* Define the input and output signals.
* Implement password comparison logic.
* Design the control-state transitions.
* Implement reset, unlock, error, and relocking behavior.

**Main file:** `digitalclk.v`

### 2. Functional Verification

The RTL is verified using a Verilog testbench and Icarus Verilog.

**Verification scenarios include:**

* Reset behavior.
* Correct password entry.
* Unlock operation.
* Automatic relocking.
* Incorrect password entry.
* Reset after an error.
* Repeated incorrect password attempts.

The testbench is maintained in `digitalclk_tb.v`.

Waveforms can be examined using GTKWave.

### 3. Logic Synthesis

Yosys converts the RTL into a gate-level representation using cells from the SKY130HD standard-cell library.

**Main activities:**

* RTL synthesis.
* Technology mapping.
* Standard-cell selection.
* Cell statistics and area estimation.
* Structural checks of the synthesized design.

The technology-mapped netlist is maintained as `digitalclk_sky130.v`.

### 4. Static Timing Analysis

OpenSTA is used to examine timing behavior using the mapped netlist, timing library, and SDC constraints.

**Main activities:**

* Define the clock period.
* Apply input and output timing constraints.
* Analyze setup and hold timing.
* Identify critical timing paths.
* Examine arrival times and slack.
* Compare timing results across supported library corners.

The timing constraints are defined in `digitalclk.sdc`.

### 5. Floorplanning

Floorplanning establishes the initial physical organization of the synthesized design.

**Main activities:**

* Initialize the floorplan.
* Define the core and die dimensions.
* Prepare the design for placement.
* Examine the floorplan database.
* Prepare the power-distribution network where supported by the flow.

### 6. Placement and Optimization

Placement assigns physical locations to the standard cells.

**Main activities:**

* Global placement.
* Detailed placement.
* Placement optimization.
* Cell resizing and buffering where required.
* Placement and congestion inspection.

### 7. Clock Tree Synthesis (CTS)

Clock tree synthesis builds the clock distribution network for sequential elements.

**Main activities:**

* Construct the clock tree.
* Insert clock buffers.
* Analyze clock latency and skew.
* Optimize timing after clock-tree generation.

### 8. Routing

Routing creates the physical interconnections between the placed standard cells.

**Main activities:**

* Global routing.
* Detailed routing.
* Routing optimization.
* Routing design-rule checks.
* Inspection of congestion and connectivity.

### 9. Finalization

The final stages produce implementation databases, routed netlists, timing reports, and parasitic information, depending on the flow configuration.

**Main activities:**

* Final design database generation.
* Routed netlist generation.
* Parasitic extraction.
* Final timing analysis.
* Physical-design checks.
* Generation of the final layout when supported by the configured flow.

A completed OpenROAD flow may generate GDSII layout data. A GDS file should only be described as successfully generated after its existence has been verified.

## Timing Analysis

Static timing analysis helps determine whether the digital door-lock controller satisfies its timing constraints.

The project uses a 10 ns clock-period constraint for the timing analysis.

The typical-corner STA results previously obtained for this project included:

| Metric              |        Observed Result |
| :------------------ | ---------------------: |
| Clock Period        |                  10 ns |
| Maximum-Delay Slack | Approximately +8.05 ns |
| Maximum-Delay TNS   |                   0 ns |
| Minimum-Delay Slack | Approximately +0.45 ns |
| Minimum-Delay TNS   |                   0 ns |

These values describe the previously performed STA analysis. They are **not final post-route timing results** and should not be presented as results from a completed OpenROAD physical-design run.

Timing results can differ after placement, clock tree synthesis, routing, and parasitic extraction.

## Physical-Design Configuration

The OpenROAD Flow Scripts configuration should identify the password door-lock design and its technology platform.

Example configuration parameters:

```makefile
# Password-Based Digital Door Lock
# Top module: digitalclk
# Platform: SKY130HD

export DESIGN_NAME = digitalclk
export PLATFORM = sky130hd
export CLOCK_PORT = clk
export CLOCK_PERIOD = 10.0
```

These are the core design parameters, not a complete configuration for every OpenROAD Flow Scripts version. Source-file paths, timing constraints, and other required variables must match the installed flow's configuration conventions.

## Example Directory Structure

```text
PasswordBasedDigitalDoorLock/
├── digitalclk.v
├── digitalclk_tb.v
├── digitalclk.sdc
├── digitalclk_sky130.v
├── run_sta.tcl
├── run_sta_multicorner.tcl
├── README.md
│
├── verification/
│   ├── rtl/
│   └── gls/
│
├── physical_design/
│   ├── config/
│   ├── floorplan/
│   ├── placement/
│   ├── cts/
│   ├── routing/
│   └── gds/
│
└── reports/
    ├── synthesis/
    ├── sta/
    └── physical_design/
```

This is a suggested organization. Include only files and results that actually exist in the repository.

## Important Implementation Artifacts

| File or Artifact          | Purpose                           |
| :------------------------ | :-------------------------------- |
| `digitalclk.v`            | RTL implementation                |
| `digitalclk_tb.v`         | Functional verification testbench |
| `digitalclk.sdc`          | Timing constraints                |
| `digitalclk_sky130.v`     | Technology-mapped Verilog netlist |
| `run_sta.tcl`             | STA execution script              |
| `run_sta_multicorner.tcl` | Multi-corner STA script           |
| `.odb`                    | OpenROAD implementation database  |
| `.def`                    | Physical-design description       |
| `.spef`                   | Extracted parasitic information   |
| `.gds`                    | Physical layout data              |

The `.odb`, `.def`, `
.spef`, and `.gds` files are generated by relevant implementation stages. They should be added when the corresponding files have actually been produced.
### Config.mk File

The OpenROAD configuration for the Password-Based Digital Door Lock
is located in the `password_door_lock` directory under the SKY130HD platform.

<img width="1917" height="1131" alt="Screenshot 2026-10-23 225446" src="https://github.com/user-attachments/assets/67513915-468f-40d3-949a-e3c000b90832" />
<img width="1248" height="548" alt="Screenshot 2026-10-24 102649" src="https://github.com/user-attachments/assets/692c5a7a-ce22-4e7b-ba11-d613b4061126" />
##placement
<img width="917" height="203" alt="Screenshot 2026-10-24 103741" src="https://github.com/user-attachments/assets/e2af4846-d558-4221-9426-b530cca431e6" />

## Reports and Analysis

The following report categories are useful when documenting a completed physical-design run.

| Report Category             | Purpose                                          |
| :-------------------------- | :----------------------------------------------- |
| Synthesis statistics        | Cell counts and area estimates                   |
| Synthesis structural checks | Structural warnings and errors                   |
| Floorplan reports           | Initial physical-design information              |
| Placement reports           | Placement and optimization results               |
| CTS reports                 | Clock-tree and timing information                |
| Routing reports             | Routing status and design-rule information       |
| Final timing reports        | Final setup and hold analysis                    |
| Power reports               | Power estimates based on the configured analysis |

Actual report filenames depend on the OpenROAD Flow Scripts version and design configuration.

## Key Learnings

This project connects digital logic design with ASIC implementation concepts.

Key learning outcomes include:

* Designing a password-based controller using Verilog HDL.
* Verifying correct and incorrect password scenarios.
* Understanding RTL synthesis and technology mapping.
* Applying clock and I/O constraints for STA.
* Interpreting setup slack, hold slack, and timing violations.
* Understanding floorplanning, placement, CTS, and routing.
* Examining the relationship between physical implementation and timing.
* Understanding the purpose of implementation databases and layout files.

## Project Progression

The Password-Based Digital Door Lock project follows the progression:

**RTL Design → Functional Verification → Synthesis → Static Timing Analysis → Physical Design → Final Layout**

The RTL, synthesis, and STA stages establish the foundation for the physical-design workflow. The remaining implementation stages should be documented using their actual generated outputs and reports.

---

<p align="center">
  <b>Password-Based Digital Door Lock</b><br/>
  Verilog HDL | SKY130HD | Yosys | OpenSTA | OpenROAD
</p>

<p align="center">
  <i>From password-controlled digital logic to ASIC physical-design implementation.</i>
</p>
