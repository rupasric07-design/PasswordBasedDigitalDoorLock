# Password-Based Digital Door Lock — Pre-Layout and Post-Layout STA
### Password-Based Digital Door Lock | SKY130 HD

<p align="center">
  <img src="https://img.shields.io/badge/Technology-SKY130%20HD-blue?style=for-the-badge" alt="Technology"/>
  <img src="https://img.shields.io/badge/Analysis-Pre--Layout%20%26%20Post--Layout%20STA-purple?style=for-the-badge" alt="Analysis"/>
  <img src="https://img.shields.io/badge/PVT%20Corners-16-orange?style=for-the-badge" alt="PVT corners"/>
  <img src="https://img.shields.io/badge/Clock-20%20ns-green?style=for-the-badge" alt="Clock period"/>
</p>

---

## Table of Contents

- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Tools and Technologies](#tools-and-technologies)
- [STA Methodology](#sta-methodology)
- [Understanding Setup and Hold Timing](#understanding-setup-and-hold-timing)
- [Multi-Corner PVT Analysis](#multi-corner-pvt-analysis)
- [Post-Layout STA Results](#post-layout-sta-results)
- [Pre-Layout vs Post-Layout STA](#pre-layout-vs-post-layout-sta)
- [Key Learnings](#key-learnings)
- [Conclusion](#conclusion)

---

## Project Overview

This report documents Static Timing Analysis (STA) for the **Password-Based Digital Door Lock** project using the SKY130 HD standard-cell library.

Post-layout STA evaluates timing using the routed design database and extracted parasitics. Pre-layout STA is used to evaluate the synthesized design before final routing. Comparing both stages helps show the impact of physical implementation and interconnect parasitics on timing.

The configured analysis covers 16 process, voltage, and temperature (PVT) corners.

## Objectives

- Perform STA for the Password-Based Digital Door Lock.
- Review setup and hold timing.
- Evaluate timing across 16 configured PVT corners.
- Review WNS and TNS.
- Compare pre-layout and post-layout timing when both sets of reports are available.
- Identify corners that require further timing investigation.

## Tools and Technologies

| Component | Description |
|---|---|
| Design | Password-Based Digital Door Lock |
| Process technology | SKY130 HD |
| Timing analysis | OpenSTA / configured STA flow |
| Configured clock period | 20 ns |
| PVT analysis | 16 configured corners |
| Post-layout netlist/database | `6_final.odb` |
| Post-layout parasitics | `6_final.spef` |
| Timing constraints | Use the SDC file generated for this design |
| Pre-layout reports | Add the actual synthesis-stage STA reports |

> **Important:** Confirm that `6_final.odb`, `6_final.spef`, and the timing constraints belong to the Password-Based Digital Door Lock run before treating the results below as project results.

## STA Methodology

### Pre-Layout STA

Pre-layout STA is run on the synthesized design before final physical routing. It uses the timing libraries and constraints, together with the interconnect assumptions configured in the flow. Record the actual pre-layout results from the synthesis-stage reports.

### Post-Layout STA

Post-layout STA is run after physical implementation. The final database and extracted parasitics are loaded so that the analysis can account for the modeled physical interconnect effects.

- `6_final.odb` — final physical design database.
- `6_final.spef` — extracted parasitic data.
- SDC file — clock and input/output timing constraints.
- Liberty files — cell timing models for the selected PVT corners.
<img width="1536" height="1024" alt="STA Timing Across Library Corners" src="https://github.com/user-attachments/assets/f85f3bdc-b5ad-47e3-8882-1baaad53bae2" />
<img width="1536" height="1024" alt="STA Comparison Across 16 Library Corners" src="https://github.com/user-attachments/assets/e1f3cc60-c8f1-4377-befb-ed9fecd1b9f3" />

## Understanding Setup and Hold Timing

- **Setup slack:** Measures whether data arrives early enough before the capturing clock edge.
- **Hold slack:** Measures whether data remains stable long enough after the capturing clock edge.
- **WNS (Worst Negative Slack):** The worst reported setup or hold slack, depending on the report and command used.
- **TNS (Total Negative Slack):** The sum of negative slack across violating paths for the relevant timing check.

Positive slack generally indicates that the corresponding path meets its timing requirement. Negative slack indicates a timing violation. A successful tool run does not by itself mean every timing requirement passed.

## Multi-Corner PVT Analysis

The following 16 corners were included in the supplied report:

| No. | PVT corner |
|---:|---|
| 1 | `ff_100C_1v65` |
| 2 | `ff_100C_1v95` |
| 3 | `ff_n40C_1v56` |
| 4 | `ff_n40C_1v65` |
| 5 | `ff_n40C_1v76` |
| 6 | `ff_n40C_1v95` |
| 7 | `ss_100C_1v40` |
| 8 | `ss_100C_1v60` |
| 9 | `ss_n40C_1v28` |
| 10 | `ss_n40C_1v35` |
| 11 | `ss_n40C_1v40` |
| 12 | `ss_n40C_1v44` |
| 13 | `ss_n40C_1v60` |
| 14 | `ss_n40C_1v76` |
| 15 | `tt_025C_1v80` |
| 16 | `tt_100C_1v80` |

- **FF:** Fast-process corner.
- **SS:** Slow-process corner.
- **TT:** Typical-process corner.

## Post-Layout STA Results

**Clock period:** 20 ns  
**Netlist/database:** `6_final.odb`  
**Parasitics:** `6_final.spef`

| PVT corner | Worst setup slack (ns) | Worst hold slack (ns) | WNS (ns) | TNS (ns) |
|---|---:|---:|---:|---:|
| `ff_100C_1v65` | 15.27 | 0.41 | 0.00 | 0.00 |
| `ff_100C_1v95` | 15.86 | 0.33 | 0.00 | 0.00 |
| `ff_n40C_1v56` | 14.60 | 0.48 | 0.00 | 0.00 |
| `ff_n40C_1v65` | 15.04 | 0.43 | 0.00 | 0.00 |
| `ff_n40C_1v76` | 15.43 | 0.38 | 0.00 | 0.00 |
| `ff_n40C_1v95` | 15.88 | 0.32 | 0.00 | 0.00 |
| `ss_100C_1v40` | 8.79 | 1.07 | 0.00 | 0.00 |
| `ss_100C_1v60` | 11.70 | 0.99 | 0.00 | 0.00 |
| `ss_n40C_1v28` | -6.33 | 1.43 | -6.33 | -52.66 |
| `ss_n40C_1v35` | 1.47 | 0.89 | 0.00 | 0.00 |
| `ss_n40C_1v40` | 4.68 | 0.90 | 0.00 | 0.00 |
| `ss_n40C_1v44` | 6.43 | 1.06 | 0.00 | 0.00 |
| `ss_n40C_1v60` | 10.79 | 0.99 | 0.00 | 0.00 |
| `ss_n40C_1v76` | 12.78 | 0.77 | 0.00 | 0.00 |
| `tt_025C_1v80` | 14.64 | 0.50 | 0.00 | 0.00 |
| `tt_100C_1v80` | 14.66 | 0.50 | 0.00 | 0.00 |

### Post-Layout Summary

- Requested corners: 16
- Failed corner runs: 0
- All 16 corner runs completed successfully.
- The supplied report shows a setup timing violation at `ss_n40C_1v28`, with worst setup slack of `-6.33 ns` and TNS of `-52.66 ns`.
- The reported worst hold slack is positive at every listed corner.
- Investigate the critical setup paths at `ss_n40C_1v28` before claiming timing closure across all corners.

> The table preserves the numerical values supplied in the conversation. Confirm the reports were generated from the Password-Based Digital Door Lock design before publishing them as verified results.

## Pre-Layout vs Post-Layout STA

| Aspect | Pre-Layout STA | Post-Layout STA |
|---|---|---|
| Design stage | After synthesis, before completed routing | After physical implementation and routing |
| Interconnect model | Ideal or estimated, depending on flow setup | Extracted parasitics when SPEF is loaded correctly |
| Main purpose | Evaluate timing early in the design flow | Evaluate timing with physical implementation effects |
| Data needed | Synthesis-stage netlist, SDC, libraries, and pre-layout reports | Final database, SDC, libraries, SPEF, and post-layout reports |

### Pre-Layout Results — Illustrative Estimates

**Note:** The following values are illustrative estimates created to demonstrate the pre-layout versus post-layout comparison format. They are not measured STA results and must not be represented as tool-generated results. Replace them with actual synthesis-stage reports when available.

| PVT corner | Estimated pre-layout setup slack (ns) | Illustrative hold slack (ns) | Illustrative WNS (ns) | Illustrative TNS (ns) |
|---|---:|---:|---:|---:|
| `ff_100C_1v65` | 16.10 | 0.18 | 0.00 | 0.00 |
| `ff_100C_1v95` | 16.55 | 0.12 | 0.00 | 0.00 |
| `ff_n40C_1v56` | 15.35 | 0.22 | 0.00 | 0.00 |
| `ff_n40C_1v65` | 15.80 | 0.19 | 0.00 | 0.00 |
| `ff_n40C_1v76` | 16.20 | 0.16 | 0.00 | 0.00 |
| `ff_n40C_1v95` | 16.60 | 0.11 | 0.00 | 0.00 |
| `ss_100C_1v40` | 9.60 | 0.62 | 0.00 | 0.00 |
| `ss_100C_1v60` | 12.40 | 0.58 | 0.00 | 0.00 |
| `ss_n40C_1v28` | -3.90 | 0.95 | -3.90 | -28.40 |
| `ss_n40C_1v35` | 2.20 | 0.55 | 0.00 | 0.00 |
| `ss_n40C_1v40` | 5.35 | 0.57 | 0.00 | 0.00 |
| `ss_n40C_1v44` | 7.10 | 0.64 | 0.00 | 0.00 |
| `ss_n40C_1v60` | 11.45 | 0.59 | 0.00 | 0.00 |
| `ss_n40C_1v76` | 13.35 | 0.48 | 0.00 | 0.00 |
| `tt_025C_1v80` | 15.20 | 0.25 | 0.00 | 0.00 |
| `tt_100C_1v80` | 15.25 | 0.25 | 0.00 | 0.00 |

These example values assume pre-layout setup estimates are generally somewhat better than the corresponding post-layout results, while the slow-slow, low-voltage corner remains the most challenging. Actual pre-layout results can differ significantly depending on constraints, estimated parasitics, clock modeling, and the STA flow. Use the same constraints and corner definitions when making a real comparison.

## Key Learnings

- How to organize STA results across multiple PVT corners.
- How setup and hold slack indicate timing margin.
- How WNS and TNS help identify timing violations.
- Why extracted parasitics matter for post-layout timing.
- Why successful corner execution does not necessarily mean all timing constraints pass.
- Why pre-layout and post-layout comparisons must use corresponding constraints and corners.

## Conclusion

The supplied post-route summary covers 16 configured PVT corners and reports no failed analysis runs. The `ss_n40C_1v28` corner has negative setup slack and requires further investigation. Pre-layout values must be taken from the actual synthesis-stage STA reports before a numerical pre-layout versus post-layout comparison can be completed.

---

**Project:** Password-Based Digital Door Lock  
**Technology:** SKY130 HD  
**Analysis:** Pre-Layout and Post-Layout Static Timing Analysis
