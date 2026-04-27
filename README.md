# Custom 0.18µm CMOS D Flip-Flop Characterization
VLSI design with refined setup time, hold time, and propagation delay

## Overview
This repository documents the transistor-level design, simulation, and physical layout of a positive-edge-triggered D Flip-Flop (DFF). Originally developed as a core project for the EE323002: Introduction to Integrated Circuit Design course (Fall 2025), this project explores the impact of parasitic elements on digital signal transitions by comparing pre-layout and post-layout simulations.



## Design Specifications & Sizing
The DFF was designed and simulated using a standard 0.18µm process under typical conditions (TT corner, 25°C). 

* **Operating Voltage ($V_{DD}$):** 1.8V 
* **Clock Frequency:** 300MHz (with a 50% duty cycle) 
* **Rise/Fall Times ($t_r$, $t_f$):** 0.1ns 
* **Unit Inverter Sizing:** $(W/L)_n = 0.47um/0.18um$ and $(W/L)_p = 1.41um/0.18um$ 
* **NAND Gate Sizing:** Scaled using the method of logical effort to achieve a unit size of $(W/L)_n = 0.94um/0.18um$ and $(W/L)_p = 1.41um/0.18um$.

## Testing Methodology
To accurately determine the setup and hold times, I implemented a progressive resolution sweeping strategy in HSPICE. 
1. **Coarse Sweep:** An initial transient simulation sweep was performed over a broad time range to find a general failure window.
2. **Fine Resolution Sweeping:** The delay time was repeatedly swept at progressively higher resolutions (down to 0.1ps steps) to pinpoint the most accurate time possible for the DFF.

## Performance Characterization
The following table summarizes the key timing metrics, comparing the idealized pre-layout schematic against the post-layout extracted circuit:

| Metric | Pre-Sim (Rising Input) | Pre-Sim (Falling Input) | Post-Sim (Rising Input) | Post-Sim (Falling Input) |
| :--- | :--- | :--- | :--- | :--- |
| **Setup Time** | 23.3ps | 60.3ps | 23.5ps | 60.1ps |
| **Hold Time** | 124.9ps | 40.4ps | 146.8ps | 52.6ps |
| **CLK-to-Q Delay** | 221ps | 271ps | 256ps | 293ps |

## Physical Design (Layout)
The custom layout was routed and checked. 
<img width="1143" height="1183" alt="DFF" src="https://github.com/user-attachments/assets/3ed68c03-bd05-4b1b-9aea-a1968c5f795c" />
* **Total Area:** 117.6786 µm² ($9.63 \times 12.22$) 
* **Design Rule Check (DRC):** Passed with 0 violations.
* **Layout Versus Schematic (LVS):** Passed (CORRECT).



## Key Takeaways
With the exception of the falling input setup time, all post-layout characterizations required more time to execute. This delay increase is a direct result of the parasitic capacitances and additional resistances introduced by the physical routing, junctions, and interconnects. These parasitic elements inherently slow down digital signal transitions. The slight improvement in the falling setup time is likely attributable to specific crosstalk or noise variations modeled in the post-layout extraction.
