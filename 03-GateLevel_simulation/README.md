# Gate-Level Simulation – Password-Based Digital Door Lock
<p align="center">
  <img src="https://img.shields.io/badge/Simulation-Gate--Level-blue?style=for-the-badge" alt="Gate-Level Simulation">
  <img src="https://img.shields.io/badge/Netlist-SKY130HD-green?style=for-the-badge" alt="SKY130HD">
  <img src="https://img.shields.io/badge/Tools-Icarus%20Verilog%20%7C%20GTKWave-purple?style=for-the-badge" alt="Simulation Tools">
</p>
<h3 align="center">Password based digital door lock</h3>

<p align="center">
  <i>Verifying the Synthesized Design Through Gate-Level Simulation</i>
</p>

---

## 1. Overview

Gate-Level Simulation is an important stage in the digital VLSI design flow. After completing RTL synthesis, the Verilog RTL design is converted into a gate-level netlist containing logic gates and standard-cell instances.

In this project, the synthesized netlist of the Password-Based Digital Door Lock is verified to check whether the synthesized circuit maintains the intended functionality of the original RTL design.

The simulation uses the synthesized Verilog netlist and a gate-level testbench to apply input signals and observe the output responses.

## 2. Objective

The main objectives of gate-level simulation are:

* Verify the synthesized netlist.
* Check the functionality of the digital door lock.
* Verify correct password detection.
* Check the response to an incorrect password.
* Observe the `unlock`, `locked`, and `error` output signals.
* Compare gate-level simulation results with RTL simulation results.

## 3. Project Description

The Password-Based Digital Door Lock is a digital security system that controls access using a predefined password.

The design is implemented in Verilog HDL. The main module is named `digitalclk`.

The circuit receives a clock signal, reset signal, password input, and password-entry control signal. Based on the implemented control logic, it generates output signals indicating the lock status and access result.

The correct password used in the project test scenarios is `1011`.

## 4. Input and Output Signals

| Signal          | Direction | Description                     |
| --------------- | --------- | ------------------------------- |
| `clk`           | Input     | Clock signal                    |
| `rst`           | Input     | Reset signal                    |
| `enter`         | Input     | Password-entry control          |
| `password[3:0]` | Input     | Four-bit password input         |
| `unlock`        | Output    | Indicates unlocked status       |
| `locked`        | Output    | Indicates locked status         |
| `error`         | Output    | Indicates an incorrect password |

## 5. Gate-Level Simulation Flow

The gate-level simulation process follows these steps:

1. Complete RTL design using Verilog HDL.
2. Verify the RTL functionality using a testbench.
3. Synthesize the RTL design using Yosys.
4. Map the design to the SKY130 standard-cell library.
5. Generate the synthesized gate-level netlist.
6. Prepare a gate-level simulation testbench.
7. Compile the netlist and testbench using Icarus Verilog.
8. Execute the simulation.
9. Observe the output signals and waveform.
10. Compare the results with the expected RTL behavior.

**Note:** The files listed above should be included only if they exist in your repository. The `.vcd` waveform file is generated after a successful simulation.

## 7. Simulation Test Cases

### Test Case 1: Reset Operation

The reset input is applied to initialize the design.

**Expected result:** The circuit enters its reset state according to the RTL implementation.

### Test Case 2: Correct Password

The password input is set to `1011`, and the password-entry signal is activated.

**Expected result:** The circuit should respond according to the correct-password logic implemented in the RTL.

### Test Case 3: Incorrect Password

An incorrect password, such as `0101`, is applied.

**Expected result:** The circuit should follow the incorrect-password handling logic implemented in the design.

### Test Case 4: Output Verification

The `unlock`, `locked`, and `error` signals are monitored throughout the simulation.

**Expected result:** The output signals should behave consistently with the design specification and the RTL simulation results.

## 8. Tools Used

* Verilog HDL
* Yosys – RTL synthesis
* SKY130 standard-cell library
* Icarus Verilog – simulation
* GTKWave – waveform visualization
* VSD Workshop environment

## 9. Expected Results

The gate-level simulation is intended to verify that the synthesized circuit preserves the intended behavior of the original RTL design.

The output signals are observed to check password recognition, lock status, and error handling.

Actual simulation results should be recorded after successfully compiling and running the gate-level netlist with the required standard-cell simulation models.

## 10. Screenshots

Add screenshots of your actual project results in this section.

### Synthesized Netlist
<img width="1920" height="1060" alt="gatelevelcode" src="https://github.com/user-attachments/assets/1f1276a6-9392-4ec7-8622-d6b3537e6b4a" />


### Gate-Level Simulation Output

<img width="1920" height="1060" alt="didgitalclk1" src="https://github.com/user-attachments/assets/effa2769-a7d6-48bb-abc3-7d37298d505a" />

### Waveform
<img width="1920" height="1060" alt="rtldclk" src="https://github.com/user-attachments/assets/e0b7c18a-19d5-4e0a-b90a-0e0a69d00e75" />

## 11. Current Status

**Stage:** Gate-Level Simulation

**Status:** Pending successful simulation and waveform verification.

The next step is to validate the synthesized netlist using the appropriate SKY130 simulation models and compare its behavior with the RTL simulation results.

## 12. Conclusion

Gate-Level Simulation is used to verify the functionality of the synthesized Password-Based Digital Door Lock circuit. It helps establish whether the synthesized standard-cell netlist behaves consistently with the original RTL design.

Successful completion of this stage provides a basis for proceeding to further implementation and physical-design verification stages.
<p align="center">
  <b>Designed and Documented by C. Rupa sri</b><br/>
  VLSI Design | Gate-Level Simulation | Functional Verification
</p>

<p align="center">
  <i>"Reliable hardware is built by verifying every stage, from RTL to the gate-level implementation."</i>
</p>
