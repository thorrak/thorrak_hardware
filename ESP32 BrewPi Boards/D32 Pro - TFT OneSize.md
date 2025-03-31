D32 Pro - "Discrete Components" PCB
===================================

This PCB is designed to allow connecting an ESP32 to the other hardware necessary to run the BrewPi firmware and 
control fermentation temperatures for your brewery. This specific board was designed to use a LoLin D32 Pro ESP32 
microcontroller, connect to a 2-channel relay board, connect to an I2C LCD or TFT screen, and has selectable voltage
for the OneWire temperature sensors. This PCB supports the use of dupont connectors for connecting the relay which 
allows for a much more compact design than if screw terminals were used.

This board contrasts with my "all-in-one" design in that it is intended to be paired with a separate (discrete) relay PCB and power supply. The advantage to this design is that it simplifies replacing the relays/power supply if they happen to burn out. The disadvantage to this design is that the assembly is more complicated than the all-in-one design. 

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack 
soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable. 


Order Links
-----------

2 Layer Board - 1.73 x 3.03 in (43.8 x 77.0 mm)

| Vendor/Aggregator                                                                                                                      | Qty Included | Cost/Board | Total Cost | Est. Lead Time |
|----------------------------------------------------------------------------------------------------------------------------------------|--------------|------------|------------|----------------|
| [OshPark](https://oshpark.com/shared_projects/iRLM23Fa)                                                                                | 3            | $8.70      | $26.10     | < 3 weeks      |
| [Tindie](https://www.tindie.com/products/27251/) - **Partially Assembled, Includes Components** | 1            | $16.95     | $16.95     | < 1 week       |

- The Tindie link above **includes** all SMD components pre-soldered to the board
- The Tindie link above also **includes** all TH components from the "Bill of Materials" below _except_ the 2.54mm jumper (which comes with the 2-channel relay board, purchased separately)



| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/D32%20Pro%20-%20TFT%20OneSize%20Top.png "Board Top"
[bot]: imgs/D32%20Pro%20-%20TFT%20OneSize%20Bottom.png "Board Bottom"


Bill of Materials
------------------------------

| Part                                                                                                                           | Qty | Build Cost | Order Qty | Order Cost* |
|--------------------------------------------------------------------------------------------------------------------------------|-----|------------|-----------|-------------|
| [PCB](https://oshpark.com/shared_projects/iRLM23Fa)                                                                            | 1   | $8.70      | 3         | $26.10      |
| [10k 0805 Resistor](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/RNCP0805FTD10K0/2240262)              | 4   | $0.40      | 4         | $0.40       |
| [4.7k 0805 Resistor](https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGCQ0805J4K7/8576740)         | 1   | $0.10      | 1         | $0.10       |
| [0.1uF (100nF) 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B104KACNNNC/3886757)   | 2   | $0.20      | 2         | $0.20       |
| [1.0uF 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B105KAFNNNE/3886724)           | 2   | $0.20      | 2         | $0.20       |
| [BSS138 MOSFET](https://www.digikey.com/en/products/detail/onsemi/BSS138/244210)                                               | 2   | $0.70      | 2         | $0.70       |
| [RJ45 Modular Jack w/no shield](https://www.digikey.com/en/products/detail/stewart-connector/SS-90000-001/14548964)            | 1   | $0.74      | 1         | $0.74       |
| [2-terminal Screw Clamp](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/691137710002/6644051)                | 1   | $0.39      | 1         | $0.39       |
| [4-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)         | 2   | $0.22*     | 40*       | $0.66*      |
| [3-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)         | 1   | --         | --        | *           |
| [2-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)         | 1   | --         | --        | *           |
| [16-Pin Female Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PPTC161LFBN-RC/810154)       | 2   | $1.96      | 2         | $1.96       |
| [10-Pin (2x5) Box Header](https://www.digikey.com/en/products/detail/amphenol-cs-commercial-products/G821EU210AGM00Y/13683147) | 1   | $0.75      | 1         | $0.75       |
| [2.54mm Jumper](https://www.digikey.com/en/products/detail/sullins-connector-solutions/STC02SYAN/76372)                        | 1   | $0.10*     | 1         | $0.10*      |

* Total Build Cost (Individual): $x.xx
* Total Build Cost (Min Order): $x.xx
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping/tax/tariffs.

- Male pin headers typically come in strips of 40 - one strip of which is more than enough for the 9 pins required for this project
- The 2.54mm Jumper generally comes attached to the 5v 2-channel relay board included in the list of Common Components
- In addition to the parts list above a complete build requires a set of [Common Components](../ESP8266%20BrewPi%20Boards/Common%20Components.md) and the appropriate [Sensor Board](../BrewPi%20Sensor%20Boards/README.md)



Build Notes
-----------

This board is intended to be used with an additional ["sensor breakout PCB"](../BrewPi%20Sensor%20Boards/README.md) to 
which the DS18b20 temperature sensors will need to be connected. 

The relay is intended to be connected to this board with two sets of dupont connectors: The first set (4 connectors) 
connect from the "RELAY" header to the 4-pin input-header on the relay. The second set (2 connectors) connects from the 
"PWR" header on the PCB. The +5v pin connects to the "JD-VCC" pin on the relay, and the GND pin connects to the GND pin 
next to the "JD-VCC" pin. **NOTE** - Save the jumper that previously connected the "VCC" and "JC-VCC" pins on the relay 
board (see below).

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for 
the temperature sensors to work, you will need to power them. Use the jumper you removed from the relay board to connect
the "OW" pin to either 5V or 3v3. Generally 5v is the best choice but there are some sensors that require 3v3 to work. 
The recommendation is to start with 5v and switch to 3v3 if your sensors do not work with 5v.

This board supports three screen types, though it is only recommended that one be used at a time. The board supports:
- LCD2004 screens connected via IIC to the 4-pin "LCD" header
- The matched D32 Pro LCD screen available through LoLin connected via their cable directly to the controller
- The use of an ILI9341-driven 240x320 TFT screen connected to the 10 pin box header



Changelog
---------

v0.1 - 2022-04-15

- Initial board design


