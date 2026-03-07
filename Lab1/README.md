# Project description

In this project, a series of **Scan D Flip-Flops (SDFF)** (Fig. 1) are connected to form a scan chain that feeds the inputs of a **Circuit under Test (CUT)** (Fig. 2) and receives its responses to produce a **Testable-Ready Circuit under Test (TRCUT)** (Fig. 3).
<br/>
<figure>
    <img src="/Lab1/doc/SDFF_schematic.png" alt="SDFF schematic" width="350" height="250">
    <figcaption>Figure 1. SDFF schematic design</figcaption>
</figure>
<br><br><br>
<figure>
    <img src="/Lab1/doc/CUT_schematic.png" alt="CUT schematic" width="450" height="550">
    <figcaption>Figure 2. CUT schematic design</figcaption>
</figure>
<br></br>

---

## TRCUT Design
<br/>
<figure>
    <img src="/Lab1/doc/TRCUT_schematic.png" alt="TRCUT schematic" width="750" height="850">
    <figcaption>Figure 3. TRCUT schematic design</figcaption>
</figure>
<br><br>

#### TRCUT inputs
- *SI*  : The *Scan_in (SI)* input of the scan chain.
- *SE*  : *Scan_enable (SE)* is a signal that turns the FFs of the **TRCUT** into a shift register.
- *CLK* : The clock that controls all the Flip-Flops in the scan chain.

#### TRCUT outputs
- *SO*  : The *Scan_out (SO)* output of the scan chain.

#### TRCUT components
- *sdff0,...,sdff3*     : The SDFFs that form the scan chain of the **TRCUT**.
- *CUT_instance*        : The **CUT** instance that is turned into a *Testable-Ready* circuit.

---

## Simulation Instructions

1. **Create Project**
<br/>Open your HDL simulator and create a new project.

2. **Add source files**
<br/>Add all .v files from the /Lab1/src/ directory into your project.

3. **Run the simulation**
<br/>If you are using *Modelsim* or *QuestaSim*, you can load the *.do* file found inside **Lab1/sim** by selecting **File > Load > Macro File** and choosing the *trcut_tb_1.do* file, or by typing ```do trcut_tb_1.do``` inside the Transcript console. Run the simulation by typing the command ```run -all``` in the Transcript window or by pressing the *Run -All* button.

---
## Simulation Results
   The wave produced after running a simulation for the *TRCUTtb.v* testbench is the one shown in Figure 4, which you can also find in the **/Lab1/doc** directory along with the other Figures.
<br/>
<figure>
    <img src="/Lab1/doc/TRCUT_tb_sim.png" alt="TRCUT tb wave" width="850" height="950">
    <figcaption>Figure 4. TRCUT testbench waveform</figcaption>
</figure>

### Simulation of the *TRCUTtb* module
   The *TRCUTtb.vhd* testbench first spends four clock cycles to load the test vector *0101* into the **SDFFs**, then spends a cycle to capture the response of outputs _i_ and _j_ in the **SDFFs**, and lastly, it spends another four clock cycles to collect and verify the responses. 
   Then, the process of:<br>
        1. serial load <br>
        2. capture <br>
        3. collection and verification <br>
    is repeated 16 times, using all the vectors from a 4-input truth table as inputs. <br>
    After collecting both responses of _i_ and _j_ for a specific input, from the _SO_ output of the scan chain, the signal *isExpected* is set to HIGH if the the
    responses produced match the expected ones.

---

## Observations 
For M inputs, the TRCUT needs **a**) M cycles for the serial load of the **SDFFs** with the input values, **b**) 1 cycle for the capture, and **c**) M cycles to collect/verify the responses. The number of all possible input combinations is $2^M$. While collecting the responses for one vector, the next vector is loaded through *SI*. In the end, M cycles are needed to collect/verify the response of the last vector inserted.<br>
    In general, for M inputs -> $2^M\cdot(M+1)+Μ$ clock cycles are needed to verify the response of a circuit for all possible combinations of the input values. <br><br>
The **TRCUT** has 4 inputs (*a b c d*) and a clock period = 100ns. To apply all possible input combinations for: <br> M = 4 -> $2^4\cdot(4+1) + 4 = 16\cdot5 + 4 = 84$ clock cycles are needed. That means that the time required for the verification of the CUT for all possible input values is: <br>
    clock\_cycles\_neededxclock\_period = $84\cdot100ns = 8400ns = 8.4μs$ <br>
    The time duration can also be seen in Figure 4 as the difference between the two cursors 
    (the first cursor is placed on the time of the capture of the test vector).<br><br>

It becomes apparent, the for a large number of inputs, it takes too much time to verify the the respones of a circuit, so a different verification method is required. <br>
    For exampe: For M = 40 -> 2<sup>40</sup> $\cdot(40+1) + 40 \approx 45\cdot$ 10<sup>12</sup> clock cycles and about<br>
    $(45\cdot$ 10<sup>12</sup> $)\cdot(100\cdot$ 10<sup>-9</sup> $) = 4.5\cdot10^6 s$ <br> 
    So, for a circuit with 40 inputs, it would take around 1.74 months to verify the responses for each possible input combination.
