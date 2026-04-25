# D-Flip-Flop-Optimization
VLSI design with refined setup time, hold time, and propagation delay

# Custom 0.18µm CMOS D Flip-Flop Characterization

## Overview
[cite_start]This repository documents the transistor-level design, simulation, and physical layout of a positive-edge-triggered D Flip-Flop (DFF)[cite: 3, 557]. [cite_start]Originally developed as a core project for the EE323002: Introduction to Integrated Circuit Design course (Fall 2025), this project explores the impact of parasitic elements on digital signal transitions by comparing pre-layout and post-layout simulations[cite: 1, 2, 541, 542, 545, 546].



## Design Specifications & Sizing
[cite_start]The DFF was designed and simulated using a standard 0.18µm process under typical conditions (TT corner, 25°C)[cite: 549]. 

* [cite_start]**Operating Voltage ($V_{DD}$):** 1.8V [cite: 558]
* **Clock Frequency:** 300MHz (with a 50% duty cycle) [cite: 558]
* [cite_start]**Rise/Fall Times ($t_r$, $t_f$):** 0.1ns [cite: 558]
* [cite_start]**Unit Inverter Sizing:** $(W/L)_n = 0.47um/0.18um$ and $(W/L)_p = 1.41um/0.18um$ [cite: 6, 559]
* **NAND Gate Sizing:** Scaled using the method of logical effort to achieve a unit size of $(W/L)_n = 0.94um/0.18um$ and $(W/L)_p = 1.41um/0.18um$[cite: 7].

## Testing Methodology
To accurately determine the setup and hold times, I implemented a progressive resolution sweeping strategy in HSPICE[cite: 14]. 
1. **Coarse Sweep:** An initial transient simulation sweep was performed over a broad time range to find a general failure window[cite: 14].
2. **Fine Resolution Sweeping:** The delay time was repeatedly swept at progressively higher resolutions (down to 0.1ps steps) to pinpoint the most accurate time possible for the DFF[cite: 14, 15, 22].

## Performance Characterization
The following table summarizes the key timing metrics, comparing the idealized pre-layout schematic against the post-layout extracted circuit[cite: 538]:

| Metric | Pre-Sim (Rising Input) | Pre-Sim (Falling Input) | Post-Sim (Rising Input) | Post-Sim (Falling Input) |
| :--- | :--- | :--- | :--- | :--- |
| **Setup Time** | 23.3ps [cite: 62, 538] | 60.3ps [cite: 97, 538] | 23.5ps [cite: 363, 538] | 60.1ps [cite: 396, 538] |
| **Hold Time** | 124.9ps [cite: 145, 538] | 40.4ps [cite: 184, 538] | 146.8ps [cite: 433, 538] | 52.6ps [cite: 475, 538] |
| **CLK-to-Q Delay** | 221ps [cite: 215, 538] | 271ps [cite: 238, 538] | 256ps [cite: 507, 538] | 293ps [cite: 532, 538] |

## Physical Design (Layout)
The custom layout was routed and checked[cite: 245]. 

* [cite_start]**Total Area:** 117.6786 µm² ($9.63 \times 12.22$) [cite: 249]
* [cite_start]**Design Rule Check (DRC):** Passed with 0 violations[cite: 287].
* **Layout Versus Schematic (LVS):** Passed (CORRECT)[cite: 301, 311].



## Key Takeaways
With the exception of the falling input setup time, all post-layout characterizations required more time to execute[cite: 541]. This delay increase is a direct result of the parasitic capacitances and additional resistances introduced by the physical routing, junctions, and interconnects[cite: 542]. These parasitic elements inherently slow down digital signal transitions[cite: 543]. The slight improvement in the falling setup time is likely attributable to specific crosstalk or noise variations modeled in the post-layout extraction[cite: 543].
