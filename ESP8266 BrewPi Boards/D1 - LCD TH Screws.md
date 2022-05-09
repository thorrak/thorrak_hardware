ESP8266 - Through Hole /w LCD & Screw Terminal PCB
==================================================

This PCB is designed to allow connecting an ESP8266 to the other hardware necessary to run the BrewPi firmware and 
control fermentation temperatures for your brewery. This specific board was designed to use a LoLin D1 Mini ESP8266 
microcontroller and integrate with a 2-channel relay board and a LCD2004 IIC LCD screen. This PCB supports the use of 
screw terminal connectors for connecting the relay and IIC LCD which some builders find to be easier to use due to their
larger size. This PCB uses a "SparkFun"-style level shifter module for handling the level conversion necessary to drive 
the LCD display.

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack 
soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable. 


Order Links
-----------

2 Layer Board - 1.85 x 2.27 in (46.9 x 57.6 mm)

| Vendor/Aggregator                                                                                        | Qty Included  | Cost/Board  | Total Cost  | Est. Lead Time  |
|----------------------------------------------------------------------------------------------------------|---------------|-------------|-------------|-----------------|
| [OshPark](https://oshpark.com/shared_projects/OmKNGkVm)                                                  | 3             | $6.97       | $20.90      | < 3 weeks       |
| [DirtyPCBs](https://dirtypcbs.com/store/designer/details/Thorrak/6451/brewpi-esp8266-lcd-th-screws-v1-1) | +/-10         | $1.87       | $18.65*     | > 6 weeks       |

- Dirty PCBs does not include shipping

| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/LCD%20TH%20Screws%20Top.png "Board Top"
[bot]: imgs/LCD%20TH%20Screws%20Bottom.png "Board Bottom"


Bill of Materials
------------------------------

| Part                                                                                                                | Qty  | Build Cost  | Order Qty  | Order Cost* |
|---------------------------------------------------------------------------------------------------------------------|------|-------------|------------|-------------|
| [PCB](https://oshpark.com/shared_projects/OmKNGkVm)                                                                 | 1    | $6.97       | 3          | $20.90      |
| [RJ45 Modular Jack w/no shield](https://www.digikey.com/en/products/detail/stewart-connector/SS-90000-001/14548964) | 1    | $0.74       | 1          | $0.74       |
| [2-terminal Screw Clamp](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/691137710002/6644051)     | 1    | $0.39       | 1          | $0.39       |
| [4-terminal Screw Clamp](https://www.digikey.com/en/products/detail/adam-tech/EBBA-04-C-SS-BU/9830523)              | 2    | $1.44       | 10         | $1.44       |
| [SparkFun Logic Level Converter](https://www.digikey.com/en/products/detail/sparkfun-electronics/BOB-12009/5673795) | 1    | $3.50       | 1          | $3.50       |
| [1uF Capacitor](https://www.digikey.com/en/products/detail/tdk-corporation/FG18X7R1E105KRT00/7326658)               | 2    | $0.76       | 2          | $0.76       |
| [0.1uF Capacitor](https://www.digikey.com/en/products/detail/kemet/C315C104M5U5TA7303/3726116)                      | 2    | $0.46       | 2          | $0.46       |
| [4.7k Resistor](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT4K70/1741428)            | 1    | $0.10       | 1          | $0.10       |
| [8-Pin Female Pin Header](https://www.digikey.com/en/products/detail/adam-tech/RS1-08-G/9832056)                    | 2    | **          | **         | **          |

* Total Build Cost (Individual): $14.36
* Total Build Cost (Min Order): $28.29
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping/tax/tariffs.

- All parts except the PCB can be ordered from DigiKey via [this link](https://www.digikey.com/short/nrvvfvpd), or by uploading the [BoM CSV](D1%20-%20LCD%20TH%20Screws%20DigiKey%20BOM.csv) to their shopping cart page
- The 2 8-Pin Female pin headers noted above are typically included with the D1 Mini, and thus are not included in the price
- In addition to the parts list above a complete build requires a set of [Common Components](Common%20Components.md) (except for the RJ-45 cable) and the appropriate [Sensor Board](../BrewPi%20Sensor%20Boards/README.md)

There are other vendors that sell "SparkFun"-style logic level converters -- If you order from one of them, please be sure that the pinout is the same (HV on one side, LV on the other side, with GND and HV/LV in the middle).



Build Notes
-----------

This board is intended to be used with an additional ["sensor breakout PCB"](../BrewPi%20Sensor%20Boards/README.md) to which the DS18b20 temperature sensors will need to be connected. 

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for the temperature sensors to work, you will need to power them. Create a solder bridge between the center "OW" pad of this header and *either* the 5v or 3v3 pads to select the correct voltage and power the temperature sensors. Generally 5v is the best choice but there are some sensors that require 3v3 to work.


