## Objective of Page
This page provides a jumpstart to you on how to use different open-source tools and the Skywater open-source PDK (Process Design Kit) to perform analog IC (Integrated Circuit) design.  My students will have access to the HKUST ECE Cloud Service, in where all the open-source tools and PDKs are installed.  For others without the access to the cloud service, I will come up another page on how to use the VirtualBox to run Ubuntu and the steps of installing the open-source tools and PDK.  Stay tuned !!

## Introduction
To do analog IC design, at least we need four items:
- Device Models
  - Used to describe the electrical behaviour of devices (e.g. resistors, capacitors, transistors, etc.) commonly used in analog IC design
  - Device models from [Skywater open-source PDK](https://github.com/google/skywater-pdk) is used
- Schematic Editor
  - Used to create the schematic of your analog circuit and generate the coressponding netlist for simulation
  - [XSCHEM](https://github.com/StefanSchippers/xschem) is used
- Simulator
  - Used to simulate the electrical behaviour of your analog circuit.  The netlist and device models mentioned above are used by the simulator to calculate the results.
  - [NGSPICE](https://ngspice.sourceforge.io/) is used
- Waveform Viewer
  - Used to view the simulation results such as bode plots for stability analysis or time-domain waveforms (aka transient waveforms)
  - [Modified GAW](https://github.com/StefanSchippers/xschem-gaw) is used

## Setting Up the Tools
1. Once you login to the Ubuntu OS, press "Ctrl"+"Alt"+"t" to launch the Terminal Window.  
2. Copy the following into the Terminal Window, and hit "Enter":
```
git clone https://github.com/eescottie/opensrc_analog.git
```
3. Again, copy the following into the Terminal Window, and hit "Enter":
```
cd opensrc_analog; chmod +x setup.sh; ./setup.sh; cd ../
```
4. The setup of tools is completed.

## Use of Open-Source Tools to Perform Analog Circuit Design
A two-stage miller-compensated Operational Transconductance Amplifier (OTA) is used to illustrate how analog circuit design can be done with the open-source tools mentioned above.

### Simulating DC Operating Point (OP)
First, we need to launch the XSCHEM such that we can view the schematic of the miller-compensated two-stage OTA.
Same as above, press "Ctrl"+"Alt"+"t" to launch the Terminal Window.
Once the Terminal Window is up, copy the following and hit "Enter":
```
cd ExampleAnalogIC
```
Right now you are at the folder containing all three schematics, let's launch the schematic about DC OP by copying the following into the Terminal and hit "Enter"
```
./run_xschem opamp_dc.sch
```
The DC OP schematic window pops up.  There are three important buttons at the top right corner of the schematic window (click the picture if it is too small for you):
- Nelist:     To generate the netlist for later simulation
- Simulate:   Start simulation
- Waves:      Launch waveform viewer

<img src="/images/DC_OP_sch_1.PNG" width="560px" ><br>
At the top left corner of the schematic, there are two elements:
- TT_MODEL: Specifing which device models to use
- DC_SIM:   Specifing which simulations to run and what data to save

In order to check the details, use the mouse to right click the element then it's color is changed from green to grey.  Then press "q" to launch a window where shows you all the details. The figure below shows you the corresponding window of TT_MODEL.

<img src="/images/DC_OP_sch_2.PNG" width="560px" ><br>
Before performing any simulation, netlist must be generated.  To do so, click the top right corner button "Netlist".
Then, simulation is started by clicking the top right corner button "Simulate".  The button turns red when the simulation is undergoing.  Once the simulation is completed, a window pops up.  If no errors, you can dismiss the window.

<img src="/images/DC_OP_sch_3.PNG" width="560px" ><br>
There are two arrows on the schematic:
- Annotate: Shows DC OP (e.g. voltage, current, transconductance) on the schematic 
- View Output File: Shows the simulation output file

Press the "Ctrl" button and right click the arrow to activate the corresponding funtion.  
After the "Annotate" arrow is clicked, the DC OP is printed on the schematic.  This is also called back-annotation.  
When the "View Output File" arrow is clicked, the simulation output file is displayed.  It is configured to show the Vgs, Vth, Vds, Vdsat, gm, gds, of different MOS transistors.  Please see the figure below for details.

<img src="/images/DC_OP_sch_4.PNG" width="560px" ><br>
### Simulating AC Performance (e.g. Stability)
We have to open another schematic.  Press Ctrl"+"Alt"+"t" to launch the Terminal Window, then copy the following and hit "Enter":
```
cd ExampleAnalogIC
```
let's launch the schematic about AC Performance by copying the following into the Terminal and hit "Enter"
```
./run_xschem opamp_ac.sch
```

<img src="/images/AC_sch_1.PNG" width="560px" ><br>
Let's now click the the top right corner "Nelist" button and then the "Simulate" button.
Once the simulation is completed, let's now click the top right corner "Waves" button to launch the wavefrom viewer.
As shown in the below figure, there are two windows.  The left hand side one is for you to select which signal to be plotted.  The right hand side one is to show you the waveform you want.

<img src="/images/AC_sch_2.PNG" width="560px" ><br>
First, we have to click the upper Panel of the right hand side window to tell which Panel we want to show the waveform.
Then, let's select a signal called "db_out" from the left hand side window and click it.  You should see the following:

<img src="/images/AC_sch_3.PNG" width="560px" ><br>
Second, click the lower Panel of the right hand side window.  Then, select a signal called "p_out" from the left hand side window and click it.  You may need to scroll down at the left hand side window to find out the signal "p_out".  You should now see the following:

<img src="/images/AC_sch_4.PNG" width="560px" ><br>
To show a Bode plot, we have to change the x-axis from linear scale to log scale.
Click the pull down menu "Preferences" and click "Log X scale".  You should now see the following:

<img src="/images/AC_sch_5.PNG" width="560px" ><br>
From the cursor, we can estimate the phase margin.  However, it is not accurate enough.
Let's go back to the schematic window, press "Ctrl" and right click the arrow "View Output File".
It is configured to measure both the phase margin and gain margin.  Please see the below figure for details:

<img src="/images/AC_sch_6.PNG" width="560px" ><br>
### Simulating Transient Performance
Press Ctrl"+"Alt"+"t" to launch the Terminal Window, then copy the following and hit "Enter":
```
cd ExampleAnalogIC
```
let's launch the schematic about transient performance by copying the following into the Terminal and hit "Enter"
```
./run_xschem opamp_tran.sch
```

<img src="/images/TRAN_sch_1.PNG" width="560px" ><br>
Let's now click the the top right corner "Nelist" button and then the "Simulate" button.
Transient simulation takes longer time than the above DC and AC simulations.
Once the simulation is completed, let's now click the top right corner "Waves" button to launch the wavefrom viewer.
This time we will use another method to plot the transient waveforms.

Let's go back to the schematic window, and right click the signal we want to plot the waveform.
For example, we right click the "vp" net and then press "k".  This will highlight the "vp" net as shown below:

<img src="/images/TRAN_sch_2.PNG" width="560px" ><br>
