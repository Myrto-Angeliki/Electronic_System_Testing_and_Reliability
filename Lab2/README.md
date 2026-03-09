# Project description

This project uses the output of the 4th DFF of an 8-bit **Linear-Feedback Shifth Register (LFSR)** (with 1 XOR tap between the first and second DFFs -> 63 different sequences produced) to produce 32 input vectors (some are repeated) that are serially loaded in the DFFs of the **TRCUT** described in **Lab1** (Fig. 1). Additionally, a 16-bit **Multiple-input Signature Register (MISR)** is designed with an XOR tap between its first and second DFF. The *SO* output of the **TRCUT** is fed to the **MISR** to create a signature that verifies the correct operation of the circuit (Fig. 2). A control signal *CTRL* decides wether the value of *SO* should be ingored. *CTRL* is set to High while the first vector is being loaded into **TRCUT** and when it is time to collect the bits of the signature.
<br/>

---

## TRCUTwithLFSR Design
<br/>
<figure>
    <img src="/Lab2/doc/TRCUTwithLFSR_schematic.png" alt="TRCUTLFSR schematic" width="650" height="750">
    <figcaption>Figure 1. TRCUT with LFSR schematic design</figcaption>
</figure>
<br><br><br>

#### TRCUTwithLFSR inputs
- *SE*   : *Scan_enable (SE)* is a signal that turns the FFs of the **TRCUT** into a shift register.
- *CLK*  : The clock that synchronizes all the memory modules. 

#### TRCUTwithLFSR outputs
- *SO*  : The *Scan_out (SO)* output of the scan chain of **TRCUT**.

#### TRCUTwithLFSR components
- *TRCUTinst*    : An instance of the *Testable-Ready* circuit descibed in **Lab1**.
- *LFSRinst*     : The 8-bit **LFSR** whose 4th DFF output is used to feed the **TRCUT**.

---

## TRCUTwithMISR Design
<br/>
<figure>
    <img src="/Lab2/doc/TRCUTwithMISR_schematic.png" alt="TRCUTMISR schematic" width=650" height="750">
    <figcaption>Figure 2. TRCUT with MISR schematic design</figcaption>
</figure>
<br><br>

#### TRCUTwithMISR inputs
- *SE*   : *Scan_enable (SE)* is a signal that turns the FFs of the **TRCUT** into a shift register.
- *CLK*  : The clock that synchronizes all the memory modules.
- *CTRL* : Control signal that decides wether the *SO* input should influence the values of the **MISR**  

#### TRCUTwithMISR outputs
- sign   : The output of the 8th DFF of the **MISR**

#### TRCUTwithMISR components
- *TRCUTinst*    : An instance of the *Testable-Ready* circuit descibed in **Lab1**.
- *LFSRinst*     : The 8-bit **LFSR** whose 4th DFF output is used to feed the **TRCUT**.
- *MISRinst*     : The 16-bit **MISR** that receives the *SO* output of the **TRCUT** to produce signature bits from the output of its 8th DFF.


---

## Simulation Instructions

1. **Create Project**
<br/>Open your HDL simulator and create a new project.

2. **Add source files**
<br/>Add all .v files from the **/Lab1/src/** (besides *TRCUTtb.v*) and **/Lab2/src/** directory into your project.

3. **Run the simulation**
<br/> Start a simulation for either *TRCUTwithLFSRtb.v* or *TRCUTwithMISRtb.v*.
<br/>If you are using *Modelsim* or *QuestaSim*, you can load the *.do* files found inside **/Lab2/sim** by selecting **File > Load > Macro File** and choosing the *.do* file, or by typing ```do file_name.do``` inside the Transcript console. Run the simulation by typing the command ```run -all``` in the Transcript window or by pressing the *Run -All* button.

---
## Simulation Results
   The waves produced after running a simulation for *TRCUTwithLFSRtb.v* and *TRCUTwithMISRtb.v* testbenches are the ones shown in Figure 3 and 4, which you can also find in the **/Lab2/doc** directory along with the other Figures.
<br/>
<figure>
    <img src="/Lab2/doc/TRCUTwithLFSRtb_wave1.png" alt="TRCUT with LFSR wave" width="850" height="950">
    <figcaption>Figure 3. TRCUTwithLFSR testbench waveform</figcaption>
</figure>
<br/> <br/> <br/>
<figure>
    <img src="/Lab2/doc/TRCUTwithMISRtb_wave1.png" alt="TRCUT with MISR wave" width="850" height="950">
    <figcaption>Figure 4. TRCUTwithMISR testbench waveform</figcaption>
</figure>

### Desription of *TRCUTwithLFSRtb*  and *TRCUTwithMISRtb*
- In *TRCUTwithLFSRtb.v*: 32 input vectors are fed to the **TRCUT**. The responses collected are compared with the expected ones and if they match, signal *isExpected* is set to 1.<br>

- In *TRCUTwithMISRtb.v*: 32 input vectors are fed to the **TRCUT**. After collecting the responses of the circuit for the last input vector, 16 cycles are spent to collect the signature from the **MISR** through the *sign* output. The *CTRL* input is set to 1 for the first 4 cycles of the simulation (while *SO* of **TRCUT** is undefined) and when the signature bits are being collected (all 32 vectors have been applied and collected).
   

---

## Observations 

From Fig. 4, it can be observed that the correct signature is 14300. By injecting some faults such as: <br>

- causing the *a* input of the **CUT** to be stuck at 0 (Fig. 5)
- causing the *b* input of the **CUT** to be stuck at 1 (Fig. 6)

signatures 1286 and 21785 are produced respectively. These signatures differ from the correct signature, meaning that the faults have been detected.

<br/>
<figure>
    <img src="/Lab2/doc/a_st0_wave.png" alt="a Stuck-at-0" width="850" height="950">
    <figcaption>Figure 5. Signature produced while the "a" signal is stuck at 0</figcaption>
</figure>
<br/> <br/> <br/>
<figure>
    <img src="/Lab2/doc/b_st1_wave.png" alt="b Stuck-at-1" width="850" height="950">
    <figcaption>Figure 6. Signature produced while the "b" signal is stuck at 1</figcaption>
</figure>
<br/> <br/> <br/>

On the other hand, there are cases where an error in the circuit doesn't get detected because a correct signature is produced despite its presence (aliasing error). To showcase this, the *g* signal of the **CUT** has been set to 1 from 0.22ns to 0.26ns (it is equal to 0 during normal operation). The signature produced in the presence of the error and in the normal operation is the same (14300), meaning the error was not detected (Fig. 7, Fig. 8). 

<br/>
<figure>
    <img src="/Lab2/doc/g_err_sign_wave.png" alt="Error injection in g signature" width="850" height="950">
    <figcaption>Figure 7. Error injection in g between 0.22ns and 0.26ns produces correct signature</figcaption>
</figure>
<br/><br/>
<figure>
    <img src="/Lab2/doc/g_normal_sign_wave.png" alt="No error in g signature" width="850" height="950">
    <figcaption>Figure 8. Signature after removing the previous error forced on g</figcaption>
</figure>

<br/><br/>

The aliasing error happens beacause signal *h* is already equal to 1 during the time period of the error injection, meaning the output *j* = *g* OR *h* of the **CUT** is equal to 1 for that time frame, regardless of the value of *g*.
