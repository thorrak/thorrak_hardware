# D32 Pro Benchtop Test Board

This PCB is a test rig designed to help ensure that D32 Pro-based BrewPi-ESP builds function as intended. This design incorporates three (toggleable) OneWire temperature sensors, a toggleable door switch, LEDs to show power, heat, and cool status, and relays that toggle on/off an LED showing heat/cool output status. This board can work with an external "sensor board" PCB, or can work independently. This design supports I2C LCD2004 screens, D32 Pro TFT screens, or third-party TFT screens via a box header. 

This PCB is primarily designed for use with a D32 Pro but can be used with a regular D32 as well. 



| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/D32%20Pro%20Benchtop%20Test%20Board%20Top.png "Board Top"
[bot]: imgs/D32%20Pro%20Benchtop%20Test%20Board%20Bottom.png "Board Bottom"




## Build Notes

This build is designed to incorporate all of the hardware required for a full BrewPi-ESP build, including the hardware for a relay board. There are a number of unique components which complicates the build of one of these, but results in a board that is fit for purpose. The components include:

- **C1, C3** - 1uF 0805 Capacitor
- **C2, C4** - 0.1uF 0805 Capacitor
- **COOL, COOL_OUT, HEAT, HEAT_OUT, PWR** - 0603 LED
- **COOL_RELAY, HEAT_RELAY** - Songle 05VDC-SL-C Relay
- **D3, D4** - 1A 1kV SMA DO-214AC Diode
- **OW1, OW2, OW3** - SOIC-8 DS18b20 Temperature Sensor
- **OW_TOG** - 2-pin SPST DIP Switch
- **OW_VSEL** - 3 Position Male 2.54mm Pin Header
- **Q1, Q2** - SOT23 NPN Transistor
- **Q5, Q6** - BSS123 N-channel SOT23 MOSFET
- **R1, R2, R6** - 680R 0805 Resistor
- **R3** - 4.7k 0805 Resistor
- **R4, R5** - 1k 0805 Resistor
- **R11, R12, R13, R14** - 10k 0805 Resistor
- **SV1** - 4 Position Male 2.54mm Pin Header
- **Controller Pins** - 2x 16 Position Female 2.54mm Pin Headers
- **U1, U2** - SOIC-12 Optoisolator
- **X4** - RJ-45 Jack


## Files

- [Eagle Schematic](D32%20Pro%20Benchtop%20Test%20Board.sch)
- [Eagle Board](D32%20Pro%20Benchtop%20Test%20Board.brd)
- [JLC BOM](D32%20Pro%20Benchtop%20Test%20Board_bom.csv)
- [JLC CPL](D32%20Pro%20Benchtop%20Test%20Board_cpl.csv)

