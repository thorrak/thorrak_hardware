ESP8266 / ESP32-S2 - SMD
==================================================

This PCB was originally designed to allow connecting an ESP8266 to the other hardware necessary to run the BrewPi 
firmware and control fermentation temperatures for your brewery. This specific board was originally designed to use a 
LoLin D1 Mini ESP8266 microcontroller, but with the release of LoLin's S2 Mini can also be used with an ESP32-S2. It 
integrates with a 2-channel relay board, connect to an I2C LCD screen, and has selectable voltage for 
the OneWire temperature sensors. This PCB supports the use of dupont connectors for connecting the relay which allows 
for a much more compact design than if screw terminals were used.

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack 
soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable.

**NOTE** - For new builds, use of an ESP8266 is no longer recommended. Use an ESP32-S2 instead. 


Order Links
-----------

2 Layer Board - 1.72 x 1.73 in (43.6 x 43.9 mm)

| Vendor/Aggregator                                                       | Qty Included | Cost/Board | Total Cost | Est. Lead Time |
|-------------------------------------------------------------------------|--------------|------------|------------|----------------|
| [OshPark](https://oshpark.com/shared_projects/1slCGU7M)                 | 3            | $4.94      | $14.80     | < 3 weeks      |
| [Tindie](https://www.tindie.com/products/26725/) - Partially Assembled  | 1            | $10.95     | $10.95     | < 1 week       |


| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/SMD%20Top.png "Board Top"
[bot]: imgs/SMD%20Bottom.png "Board Bottom"


Bill of Materials
------------------------------

| Part                                                                                                                         | Qty   | Build Cost | Order Qty | Order Cost* |
|------------------------------------------------------------------------------------------------------------------------------|-------|------------|-----------|-------------|
| [PCB](https://oshpark.com/shared_projects/sZcIGxXP)                                                                          | 1     | $4.94      | 3         | $14.80      |
| [10k 0805 Resistor](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/RNCP0805FTD10K0/2240262)            | 4     | $0.40      | 4         | $0.40       |
| [4.7k 0805 Resistor](https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGCQ0805J4K7/8576740)       | 1     | $0.10      | 1         | $0.10       |
| [0.1uF (100nF) 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B104KACNNNC/3886757) | 2     | $0.20      | 2         | $0.20       |
| [1.0uF 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B105KAFNNNE/3886724)         | 2     | $0.20      | 2         | $0.20       |
| [BSS138 MOSFET](https://www.digikey.com/en/products/detail/onsemi/BSS138/244210)                                             | 2     | $0.70      | 2         | $0.70       |
| [RJ45 Modular Jack w/no shield](https://www.digikey.com/en/products/detail/stewart-connector/SS-90000-001/14548964)          | 1     | $0.74      | 1         | $0.74       |
| [2-terminal Screw Clamp](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/691137710002/6644051)              | 1     | $0.39      | 1         | $0.39       |
| [4-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)       | 2     | $0.22*     | 40*       | $0.66*      |
| [3-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)       | 1     | --         | --        | *           |
| [2-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)       | 1     | --         | --        | *           |
| [8-Pin Female Pin Header](https://www.digikey.com/en/products/detail/adam-tech/RS1-08-G/9832056)                             | 2     | **         | **        | **          |
| [2.54mm Jumper](https://www.digikey.com/en/products/detail/sullins-connector-solutions/STC02SYAN/76372)                      | 1     | $0.10*     | 1         | $0.10*      |

* Total Build Cost (Individual): $7.99
* Total Build Cost (Min Order): $18.29
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping/tax/tariffs.

- All parts except the PCB can be ordered from DigiKey via [this link](https://www.digikey.com/short/ww8cvhrh), or by uploading the [BoM CSV](D1%20-%20SMD%20DigiKey%20BOM.csv) to their shopping cart page
- Male pin headers typically come in strips of 40 - one strip of which is more than enough for the 9 pins required for this project
- The 2 8-Pin Female pin headers noted above are typically included with a D1 Mini, but are **typically not** included with an ESP32-S2 Mini
- In addition to the parts list above a complete build requires a set of [Common Components](Common%20Components.md) and the appropriate [Sensor Board](../BrewPi%20Sensor%20Boards/README.md)




Board Assembly
--------------

This board requires the assemebly of both surface mount and through hole components. If your board already has the 
surface mount components installed, you can skip to step 6 as you will only need to install the through hole components.

1. Solder the 4 10k resistors (marked 103) in the locations marked R2, R3, R4, and R5
2. Solder the 4.7k resistor (marked 472) in the location marked R1
3. Solder the 2 0.1uF capacitors (marked 104) in the locations marked C1 and C3
4. Solder the 2 1.0uF capacitors (marked 105) in the locations marked C2 and C4
5. Solder the BSS138 MOSFETs in the locations marked Q1 and Q2
6. Solder the 2 8-pin female headers on the left and right side of the controller footprint, over the white silkscreened outline.
7. Solder the 3-pin male pin header to the pins marked "ONEWIRE_VSEL"
8. Solder the 2 4-pin male pin headers to the pins marked "RELAY" and "LCD"
9. Solder the 2-pin male pin header to eh pins marked "PWR"
10. Solder the 2-terminal screw clamp to the pins marked "GND In" and "+5V In"
11. Snap the RJ-45 jack into place, and solder the 8 pins to finish the connection

To complete your BrewPi-ESP build, you will also need a set of [Common Components](Common%20Components.md) and the appropriate [Sensor Board](../BrewPi%20Sensor%20Boards/README.md). Remember to retain the 


Build Notes
-----------

This board is intended to be used with an additional ["sensor breakout PCB"](../BrewPi%20Sensor%20Boards/README.md) to which the DS18b20 temperature sensors will need to be connected. 

This relay is intended to be connected to this board with two sets of dupont connectors: The first set (4 connectors) connect from the "RELAY" header to the 4-pin input-header on the relay. The second set (2 connectors) connects from the "PWR" header on the PCB. The +5v pin connects to the "JD-VCC" pin on the relay, and the GND pin connects to the GND pin next to the "JD-VCC" pin. **NOTE** - Save the jumper that previously connected the "VCC" and "JC-VCC" pins on the relay board (see below).

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for the temperature sensors to work, you will need to power them. Use the jumper you removed from the relay board to connect the "OW" pin to either 5V or 3v3. Generally 5v is the best choice but there are some sensors that require 3v3 to work. The recommendation is to start with 5v and switch to 3v3 if your sensors do not work with 5v.

If you do not have a relay board with a jumper that you can use to select the OneWire voltage (or would prefer to permanently select a voltage) you can use solder to bridge *either* the 5V or 3v3 pad on the back of the PCB to the center "OW" pad. **DO NOT** bridge all three pads, as this will damage the controller.




Changelog
---------

v1.2 - 2021-03-11

- Added "OW_VSEL" solder jumper to back of PCB for (optional) permanent selection of OneWire voltage 
- Tweaked routing slightly to reduce chance of trace damage during soldering



