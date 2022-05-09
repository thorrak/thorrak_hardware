ESP8266 - Through Hole w/o LCD
==================================================

This PCB is designed to allow connecting an ESP8266 to the other hardware necessary to run the BrewPi firmware and control fermentation temperatures for your brewery. This specific board was designed to use a LoLin D1 Mini ESP8266 microcontroller and integrate with a 2-channel relay board. It does NOT support an LCD screen. This PCB supports the use of dupont connectors for connecting the relay which allows for a much more compact design than if screw terminals were used.

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable. 


Order Links
-----------

2 Layer Board - 1.77 x 1.34 in (45.0mm x 34.1 mm)

| Vendor/Aggregator                                                                                 | Qty Included | Cost/Board | Total Cost | Est. Lead Time |
|---------------------------------------------------------------------------------------------------|--------------|------------|------------|----------------|
| [OshPark](https://oshpark.com/shared_projects/TOON0jUw)                                           | 3            | $3.95      | $11.85     | < 3 weeks      |
| [DirtyPCBs](https://dirtypcbs.com/store/designer/details/Thorrak/6449/brewpi-esp8266-no-lcd-v1-1) | +/-10        | $1.32      | $13.15*    | > 6 weeks      |

- Dirty PCBs does not include shipping

| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/No%20LCD%20Top.png "Board Top"
[bot]: imgs/No%20LCD%20Bottom.png "Board Bottom"


Bill of Materials
------------------------------

| Part                                                                                                                   | Qty | Build Cost | Order Qty  | Order Cost*  |
|------------------------------------------------------------------------------------------------------------------------|-----|------------|------------|--------------|
| [PCB](https://oshpark.com/shared_projects/TOON0jUw)                                                                    | 1   | $3.95      | 3          | $11.85       |
| [RJ45 Modular Jack w/no shield](https://www.digikey.com/en/products/detail/stewart-connector/SS-90000-001/14548964)    | 1   | $0.74      | 1          | $0.74        |
| [2-terminal Screw Clamp](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/691137710002/6644051)        | 1   | $0.39      | 1          | $0.39        |
| [1uF Capacitor](https://www.digikey.com/en/products/detail/tdk-corporation/FG18X7R1E105KRT00/7326658)                  | 2   | $0.76      | 2          | $0.76        |
| [0.1uF Capacitor](https://www.digikey.com/en/products/detail/kemet/C315C104M5U5TA7303/3726116)                         | 2   | $0.46      | 2          | $0.46        |
| [4-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214) | 1   | $0.15*     | 40*        | $0.66*       |
| [3-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214) | 1   | --         | --         | *            |
| [2-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214) | 1   | --         | --         | *            |
| [8-Pin Female Pin Header](https://www.digikey.com/en/products/detail/adam-tech/RS1-08-G/9832056)                       | 2   | **         | **         | **           |
| [2.54mm Jumper](https://www.digikey.com/en/products/detail/sullins-connector-solutions/STC02SYAN/76372)                | 1   | $0.10*     | 1          | $0.10*       |

* Total Build Cost (Individual): $6.55
* Total Build Cost (Min Order): $14.96
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping/tax/tariffs.

- All parts except the PCB can be ordered from DigiKey via [this link](https://www.digikey.com/short/5rqdt4m2), or by uploading the [BoM CSV](D1%20-%20No%20LCD%20DigiKey%20BOM.csv) to their shopping cart page
- Male pin headers typically come in strips of 40 - one strip of which is more than enough for the 9 pins required for this project
- The 2 8-Pin Female pin headers noted above are typically included with the D1 Mini, and thus are not included in the price
- In addition to the parts list above a complete build requires a set of [Common Components](Common%20Components.md) (except for the LCD screen) and the appropriate [Sensor Board](../BrewPi%20Sensor%20Boards/README.md)



Build Notes
-----------

This board is intended to be used with an additional ["sensor breakout PCB"](../BrewPi%20Sensor%20Boards/README.md) to which the DS18b20 temperature sensors will need to be connected. 

This relay is intended to be connected to this board with two sets of dupont connectors: The first set (4 connectors) connect from the "RELAY" header to the 4-pin input-header on the relay. The second set (2 connectors) connects from the "PWR" header on the PCB. The +5v pin connects to the "JD-VCC" pin on the relay, and the GND pin connects to the GND pin next to the "JD-VCC" pin. **NOTE** - Save the jumper that previously connected the "VCC" and "JC-VCC" pins on the relay board (see below).

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for the temperature sensors to work, you will need to power them. Use the jumper you removed from the relay board to connect the "OW" pin to either 5V or 3v3. Generally 5v is the best choice but there are some sensors that require 3v3 to work. The recommendation is to start with 5v and switch to 3v3 if your sensors do not work with 5v. 

In addition to the "ONEWIRE_VSEL" header on the front of the board which allows for this voltage to be selected using a jumper, there is an "OW_VSEL" solder jumper on the back. If you don't have a removable jumper handy (or want to make your choice permanent) bridge the center of the OW_VSEL jumper with *either* the 5V or 3v3 sides to select the OneWire voltage. Do not use both the ONEWIRE_VSEL and OW_VSEL jumpers, and do not create a solder bridge between all three pins. 



