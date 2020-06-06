ESP8266 - Through Hole /w LCD & Screw Terminal PCB
==================================================

This PCB is designed to allow connecting an ESP8266 to the other hardware necessary to run the BrewPi firmware and control fermentation temperatures for your brewery. This specific board was designed to use a LoLin D1 Mini ESP8266 microcontroller and integrate with a 2-channel relay board and a LCD2004 IIC LCD screen. This PCB supports the use of screw terminal connectors for connecting the relay and IIC LCD which some builders find to be easier to use due to their larger size. This PCB uses a "SparkFun"-style level shifter module for handling the level conversion necessary to drive the LCD display.

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable. 


Order Links
-----------

2 Layer Board - 1.85 x 2.27 in (46.9 x 57.6 mm)

| Vendor/Aggregator                                            | Qty Included | Cost/Board | Total Cost | Est. Lead Time |
| ------------------------------------------------------------ | ------------ | ---------- | ---------- | -------------- |
| [OshPark](https://oshpark.com/shared_projects/OmKNGkVm)      | 3            | $6.97      | $20.90     | < 3 weeks      |
| [DirtyPCBs](https://dirtypcbs.com/store/designer/details/Thorrak/6451/brewpi-esp8266-lcd-th-screws-v1-1) | +/-10        | $1.87      | $18.65*    | > 6 weeks      |

- Dirty PCBs does not include shipping

| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/LCD%20TH%20Screws%20Top.png "Board Top"
[bot]: imgs/LCD%20TH%20Screws%20Bottom.png "Board Bottom"


Bill of Materials
------------------------------

| Part                                                         | Qty  | Build Cost | Order Qty | Order Cost* |
| ------------------------------------------------------------ | ---- | ---------- | --------- | ----------- |
| [PCB](https://oshpark.com/shared_projects/OmKNGkVm)          | 1    | $6.97      | 3         | $20.90      |
| [RJ45 Modular Jack w/no shield](https://www.aliexpress.com/item/32736146888.html) | 1    | $0.13      | 20        | $2.52       |
| [Wago 2-terminal Screw Clamp (KF301-2P)](https://www.aliexpress.com/item/32700056337.html) | 1    | $0.02      | 100       | $1.95       |
| [Wago 4-terminal Screw Clamp (KF301-4P)](https://www.aliexpress.com/item/32828459901.html) | 2    | $0.24      | 10        | $1.20       |
| [SparkFun Logic Level Converter](https://www.sparkfun.com/products/12009) | 1    | $2.51      | 1         | $2.51       |
| [1uF Capacitor](https://www.aliexpress.com/item/4000395699194.html) | 2    | $0.02      | 100       | $1.10       |
| [0.1uF Capacitor](https://www.aliexpress.com/item/4000395699194.html) | 2    | $0.02      | 100       | $0.84       |
| [4.7k Resistor](https://www.aliexpress.com/item/33025939683.html) | 1    | $0.01      | 100       | $0.44       |
| [8-Pin Female Pin Header](https://www.aliexpress.com/item/32993182990.html) | 2    | **         | **        | **          |
| [6-Pin Female Pin Header (Optional)](https://www.aliexpress.com/item/32993182990.html) | 2    | $0.10      | 400*      | $1.95*      |

* Total Build Cost (Individual): $1.95
* Total Build Cost (Min Order): $11.68 (Builds 3)
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping.

- The 2 8-pin Female pin headers noted above are typically included with the D1 Mini, and thus are not included in the price
- The 2 optional 6-Pin Female pin headers can be used in the holes for the SparkFun level shifter, thus allowing it to be replaced at a later date if needed. If omitted, the level shifter's male pins can be soldered directly through the holes in the PCB.
- In addition to the parts list above a complete build requires a set of [Common Components](Common%20Components.md) and the appropriate [Sensor Board](../BrewPi%20Sensor%20Boards/README.md)

There are sellers on AliExpress that sell "SparkFun"-style logic level converters -- If you order from one of these sellers, please be sure that the pinout is the same (HV on one side, LV on the other side, with GND and HV/LV in the middle).



Build Notes
-----------

This board is intended to be used with an additional ["sensor breakout PCB"](../BrewPi%20Sensor%20Boards/README.md) to which the DS18b20 temperature sensors will need to be connected. 

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for the temperature sensors to work, you will need to power them. Create a solder bridge between the center "OW" pad of this header and *either* the 5v or 3v3 pads to select the correct voltage and power the temperatre sensors. Generally 5v is the best choice but there are some sensors that require 3v3 to work.


