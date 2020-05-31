ESP8266 - Through Hole /w LCD & Dupont PCB
==========================================

This PCB is designed to allow connecting an ESP8266 to the other hardware necessary to run the BrewPi firmware and control fermentation temperatures for your brewery. This specific board was designed to use a LoLin D1 Mini ESP8266 microcontroller and integrate with a 2-channel relay board and a LCD2004 IIC LCD screen. This PCB supports the use of dupont connectors for connecting the relay and IIC LCD which allows for a much more compact design than if screw terminals were used. This PCB uses a "SparkFun"-style level shifter module for handling the level conversion necessary to drive the LCD display.

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable. 


Order Links
-----------

[Order from OshPark](https://oshpark.com/shared_projects/UGNmCb2S):

- 2 Layer Board - 1.86 x 2.09 in (47.2 x 53.0 mm)
- $19.35 per set of 3

| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/LCD%20TH%20Dupont%20Top.png "Board Top"
[bot]: imgs/LCD%20TH%20Dupont%20Bottom.png "Board Bottom"


Bill of Materials (Incomplete)
------------------------------

| Part                                                         | Qty  | Build Cost | Order Qty | Order Cost* |
| ------------------------------------------------------------ | ---- | ---------- | --------- | ----------- |
| [PCB](https://oshpark.com/shared_projects/UGNmCb2S)          | 1    | $6.45      | 3         | $19.35      |
| [RJ45 Modular Jack w/no shield](https://www.aliexpress.com/item/32736146888.html) | 1    | $0.13      | 20        | $2.52       |
| [Wago 2-terminal Screw Clamp (KF301-2P)](https://www.aliexpress.com/item/32700056337.html) | 1    | $0.02      | 100       | $1.95       |
| [SparkFun Logic Level Converter](https://www.sparkfun.com/products/12009) | 1    | $2.51      | 1         | $2.51       |
| [1uF Capacitor](https://www.aliexpress.com/item/4000395699194.html) | 2    | $0.02      | 100       | $1.10       |
| [0.1uF Capacitor](https://www.aliexpress.com/item/4000395699194.html) | 2    | $0.02      | 100       | $0.84       |
| [4.7k Resistor](https://www.aliexpress.com/item/33025939683.html) | 1    | $0.01      | 100       | $0.44       |
| [4-Pin Male Pin Header](https://www.aliexpress.com/item/32993182990.html) | 2    | $0.10*     | 400*      | $0.97*      |
| [3-Pin Male Pin Header](https://www.aliexpress.com/item/32993182990.html) | 1    | --         | --        | *           |
| [2-Pin Male Pin Header](https://www.aliexpress.com/item/32993182990.html) | 1    | --         | --        | *           |
| [8-Pin Female Pin Header](https://www.aliexpress.com/item/32993182990.html) | 2    | **         | **        | **          |
| [6-Pin Female Pin Header (Optional)](https://www.aliexpress.com/item/32993182990.html) | 2    | $0.10      | 400*      | $1.95*      |

* Total Build Cost (Individual): $9.26
* Total Build Cost (Min Order): $29.68 (Builds 3)
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping.

- Male pin headers typically come in strips of 40 - Price listed above is for an order of 10 strips of 40 (one strip of which is more than enough for the 13 pins required for this project)
- The 2 8-Pin Female pin headers noted above are typically included with the D1 Mini, and thus are not included in the price
- The 2 optional 6-Pin Female pin headers can be used in the holes for the SparkFun level shifter, thus allowing it to be replaced at a later date if needed. If omitted, the level shifter's male pins can be soldered directly through the holes in the PCB.
- This part list does not include wire, dupont cables, the D1 Mini, the relay board, or the cable required to connect to the sensor board

There are sellers on AliExpress that sell "SparkFun"-style logic level converters -- If you order from one of these sellers, please be sure that the pinout is the same (HV on one side, LV on the other side, with GND and HV/LV in the middle).




Build Notes
-----------

This board is intended to be used with an additional "sensor breakout" PCB to which the DS18b20 temperature sensors will need to be connected. 

This relay is intended to be connected to this board with two sets of dupont connectors: The first set (4 connectors) connect from the "RELAY" header to the 4-pin input-header on the relay. The second set (2 connectors) connects from the "PWR" header on the PCB. The +5v pin connects to the "JD-VCC" pin on the relay, and the GND pin connects to the GND pin next to the "JD-VCC" pin. **NOTE** - Save the jumper that previously connected the "VCC" and "JC-VCC" pins on the relay board (see below).

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for the temperature sensors to work, you will need to power them. Use the jumper you removed from the relay board to connect the "OW" pin to either 5V or 3v3. Generally 5v is the best choice but there are some sensors that require 3v3 to work. The recommendation is to start with 5v and switch to 3v3 if your sensors do not work with 5v.