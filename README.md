## Objective of Page
This page provides a jumpstart to you on how to use different open-source tools and the Skywater open-source PDK (Process Design Kit) to perform analog IC (Integrated Circuit) design.  My students will have access to the HKUST ECE Cloud Service, in where all the open-source tools and PDKs are installed.  For others without the access to the HKUST ECE cloud service, I will come up another page on how to use the VirtualBox to run Ubuntu and the steps of installing the open-source tools and PDK.  Stay tuned !!

## Introduction
To do analog IC design, at lease we need four items:
- Device Models
  - Used to describe the electrical behaviour of devices (e.g. resistors, capacitors, transistors, etc.) commonly used in analog IC design
  - Device models from [Skywater open-source PDK](https://github.com/google/skywater-pdk) is used
- Schematic Editor
  - Used to create the schematic of your analog circuit and generate the coressponding netlist for simulation
  - [XSCHEM](https://github.com/StefanSchippers/xschem) is used
- Simulator
  - Used to simulate the electrical behaviour of your analog circuit.  The netlist and device models mentioned above are used by the simulator to generate the results.
  - [NGSPICE](https://ngspice.sourceforge.io/) is used
- Waveform Viewer
  - Used to view the simulation results such as bode plots for stability analysis or time-domain waveform (aka transient waveform)
  - [Modified GAW](https://github.com/StefanSchippers/xschem-gaw) is used

## Setting Up the Tools
1. Once you login into the Ubuntu OS, press "Ctrl"+"Alt"+"t" to launch the Terminal Window.  
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
Right now you are at the folder containing all three different schematics, let's launch the schematic about DC OP by copying the following into the Terminal and hit "Enter"
```
./run_xschem opamp_dc.sch
```
Then, you will see the following window !()
