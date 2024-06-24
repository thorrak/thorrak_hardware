D32 Pro - TFT AIO
==================================================

This PCB is designed to allow connecting an ESP32 to the other hardware necessary to run the BrewPi firmware and control fermentation temperatures for your brewery. This specific board was designed to use a LoLin D32 Pro ESP32 microcontroller, integrate with a 2-channel relay board, connect to an I2C LCD or TFT screen, and has selectable voltage for the OneWire temperature sensors. This PCB supports the use of dupont connectors for connecting the relay which allows for a much more compact design than if screw terminals were used.

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable. 


Order Links
-----------

2 Layer Board - 1.73 x 3.03 in (43.8 x 77.0 mm)

| Vendor/Aggregator                                                            | Qty Included | Cost/Board | Total Cost | Est. Lead Time |
|------------------------------------------------------------------------------|--------------|------------|------------|----------------|
| [OshPark](https://oshpark.com/)                      | 3            | $8.70      | $26.10     | < 3 weeks      |
| [Tindie](https://oshpark.com/shared_projects/1slCGU7M) - Partially Assembled | 1            | $11.95     | $11.95     | < 1 week       |



| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/SMD%20Top.png "Board Top"
[bot]: imgs/SMD%20Bottom.png "Board Bottom"

Gerbers (in a `.zip` file), BOM, and CPL (component placement list) files are included in the `production` folder.  You can upload the Gerbers to any PCB fab you like to have boards made.  The BOM includes part numbers from JLCPCB for the surface-mount components, so you can easily have these boards assembled by them.

Bill of Materials
------------------------------

| Part                                                                                                                            | Qty | Build Cost | Order Qty | Order Cost* |
|---------------------------------------------------------------------------------------------------------------------------------|-----|------------|-----------|-------------|
| [PCB](https://oshpark.com/)                                                                             | 1   | $8.70      | 3         | $26.10      |
| [10k 0805 Resistor](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/RNCP0805FTD10K0/2240262)               | 4   | $0.40      | 4         | $0.40       |
| [4.7k 0805 Resistor](https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGCQ0805J4K7/8576740)          | 1   | $0.10      | 1         | $0.10       |
| [0.1uF (100nF) 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B104KACNNNC/3886757)    | 2   | $0.20      | 2         | $0.20       |
| [1.0uF 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B105KAFNNNE/3886724)            | 2   | $0.20      | 2         | $0.20       |
| [BSS138 MOSFET](https://www.digikey.com/en/products/detail/onsemi/BSS138/244210)                                                | 2   | $0.70      | 2         | $0.70       |
| [RJ45 Modular Jack w/no shield](https://www.digikey.com/en/products/detail/stewart-connector/SS-90000-001/14548964)             | 1   | $0.74      | 1         | $0.74       |
| [2-terminal Screw Clamp](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/691137710002/6644051)                 | 1   | $0.39      | 1         | $0.39       |
| [4-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)          | 2   | $0.22*     | 40*       | $0.66*      |
| [3-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)          | 1   | --         | --        | *           |
| [2-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)          | 1   | --         | --        | *           |
| [16-Pin Female Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PPTC161LFBN-RC/810154)        | 2   | $1.96      | 2         | $1.96       |
| [10-Pin (2x5) Box Header](https://www.digikey.com/en/products/detail/amphenol-cs-commercial-products/G821EU210AGM00Y/13683147)  | 1   | $0.75      | 1         | $0.75       |
| [2.54mm Jumper](https://www.digikey.com/en/products/detail/sullins-connector-solutions/STC02SYAN/76372)                         | 1   | $0.10*     | 1         | $0.10*      |
| [EL817S1(TU)-G Optocoupler](https://www.digikey.com/en/products/detail/everlight-electronics-co-ltd/EL8171S1-TU-G/9446028)      | 1   | $0.62      | 1         | $0.62       |
| [100R 0805 Resistor](https://www.digikey.com/en/products/detail/yageo/RC0805FR-07100RL/727543)                                  | 1   | $0.10      | 1         | $0.10       |
| [8.2k 0805 Resistor](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/RMCF0805JT8K20/1757870)               | 1   | $0.10      | 1         | $0.10       |
| [27k 0805 Resistor](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/RMCF0805JT27K0/1757886)                | 1   | $0.10      | 1         | $0.10       |


* Total Build Cost (Individual): $x.xx
* Total Build Cost (Min Order): $x.xx
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping/tax/tariffs.

- Male pin headers typically come in strips of 40 - one strip of which is more than enough for the 9 pins required for this project
- The 2.54mm Jumper generally comes attached to the 5v 2-channel relay board included in the list of Common Components
- In addition to the parts list above a complete build requires a set of [Common Components](Common%20Components.md) and the appropriate [Sensor Board](../../BrewPi%20Sensor%20Boards/README.md)



Build Notes
-----------

This board is intended to be used with an additional ["sensor breakout PCB"](../../BrewPi%20Sensor%20Boards/README.md) to which the DS18b20 temperature sensors will need to be connected. 

This relay is intended to be connected to this board with two sets of dupont connectors: The first set (4 connectors) connect from the "RELAY" header to the 4-pin input-header on the relay. The second set (2 connectors) connects from the "PWR" header on the PCB. The +5v pin connects to the "JD-VCC" pin on the relay, and the GND pin connects to the GND pin next to the "JD-VCC" pin. **NOTE** - Save the jumper that previously connected the "VCC" and "JC-VCC" pins on the relay board (see below).

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for the temperature sensors to work, you will need to power them. Use the jumper you removed from the relay board to connect the "OW" pin to either 5V or 3v3. Generally 5v is the best choice but there are some sensors that require 3v3 to work.  The recommendation is to start with 5v and switch to 3v3 if your sensors do not work with 5v.

This board supports three screen types, though it is only recommended that one be used at a time. The board supports:
- LCD2004 screens connected via IIC to the 4-pin "LCD" header
- The matched D32 Pro LCD screen available through LoLin connected via their cable directly to the controller
- The use of an ILI9341-driven TFT screen connected to the 10 pin box header

This board supports emulating a NTC10k temperature sensor to allow control of certain glycol chillers (the Icemaster Max2/Max4 and possibly others).  To use this feature, connect two wires from the `GLYCOL` pins in the lower-left corner of the board to a [5521 male connector](https://www.amazon.com/Power-Pigtails-Supply-Replacement-Repair/dp/B0BH4BPBX3/), or other connector if your chiller uses something different--polarity isn't important here.  Then plug that connector into your chiller's temperature controller in place of its temperature probe.  When the `COOL` pin is energized, the controller will read about 95°F; when that pin is deenergized, the controller will read about 25°F.  If you set the temperature controller midway between these two points, this will mean that the glycol pump will turn on when the `COOL` pin is energized, and off when it isn't.

Changelog
---------

v0.2 - 2023-10-30

- Migrate schematic and PCB layout to KiCAD 7.0
- Add circuitry to simulate NTC10k temp sensor, to allow control of some glycol chillers without modification

v0.1 - 2022-04-15

- Initial board design


