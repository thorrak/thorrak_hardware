ESP8266 - SMD
==================================================

This PCB is designed to allow connecting an ESP8266 to the other hardware necessary to run the BrewPi firmware and control fermentation temperatures for your brewery. This specific board was designed to use a LoLin D1 Mini ESP8266 microcontroller, integrate with a 2-channel relay board, connect to an I2C LCD screen, and has selectable voltage for the OneWire temperature sensors. This PCB supports the use of dupont connectors for connecting the relay which allows for a much more compact design than if screw terminals were used.

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable. 


Order Links
-----------

[Order from OshPark](https://oshpark.com/shared_projects/sZcIGxXP):

- 2 Layer Board - 1.72 x 1.73 in (43.6 x 43.9 mm)
- $14.80 per set of 3

| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/SMD%20Top.png "Board Top"
[bot]: imgs/SMD%20Bottom.png "Board Bottom"


Bill of Materials
------------------------------

| Part                                                         | Qty  | Build Cost | Order Qty | Order Cost* |
| ------------------------------------------------------------ | ---- | ---------- | --------- | ----------- |
| [PCB](https://oshpark.com/shared_projects/sZcIGxXP)          | 1    | $4.94      | 3         | $14.80      |
| [RJ45 Modular Jack w/no shield](https://www.aliexpress.com/item/32736146888.html) | 1    | $0.13      | 20        | $2.52       |
| [Wago 2-terminal Screw Clamp (KF301-2P)](https://www.aliexpress.com/item/32700056337.html) | 1    | $0.02      | 100       | $1.95       |
| [10k 0805 Resistor](https://www.aliexpress.com/item/32865947306.html) | 4    | $0.03      | 100       | $0.60       |
| [4.7k 0805 Resistor](https://www.aliexpress.com/item/32865947306.html) | 1    | $0.01      | 100       | $0.60       |
| [0.1uF (100nF) 0805 Capacitor](https://www.aliexpress.com/item/32964553793.html) | 2    | $0.02      | 100       | $0.96       |
| [1.0uF 0805 Capacitor](https://www.aliexpress.com/item/32964553793.html) | 2    | $0.03      | 100       | $1.35       |
| [BSS138 MOSFET](https://www.aliexpress.com/item/32844184380.html) | 2    | $0.02      | 100       | $0.97       |
| [4-Pin Male Pin Header](https://www.aliexpress.com/item/32993182990.html) | 2    | $0.10*     | 400*      | $0.97*      |
| [3-Pin Male Pin Header](https://www.aliexpress.com/item/32993182990.html) | 1    | --         | --        | *           |
| [2-Pin Male Pin Header](https://www.aliexpress.com/item/32993182990.html) | 1    | --         | --        | *           |
| [8-Pin Female Pin Header](https://www.aliexpress.com/item/32993182990.html) | 2    | **         | **        | **          |

* Total Build Cost (Individual): $5.30
* Total Build Cost (Min Order): $24.72 (Builds 3)
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping.
* Male pin headers typically come in strips of 40 - Price listed above is for an order of 10 strips of 40 (one strip of which is more than enough for the 13 pins required for this project)
* The 2 Female pin headers noted above are typically included with the D1 Mini, and thus are not included in the price
* In addition to the parts list above a complete build requires a set of [Common Components](Common%20Components.md) and the appropriate [Sensor Board](../BrewPi%20Sensor%20Boards/README.md)



Build Notes
-----------

This board is intended to be used with an additional ["sensor breakout PCB"](../BrewPi%20Sensor%20Boards/README.md) to which the DS18b20 temperature sensors will need to be connected. 

This relay is intended to be connected to this board with two sets of dupont connectors: The first set (4 connectors) connect from the "RELAY" header to the 4-pin input-header on the relay. The second set (2 connectors) connects from the "PWR" header on the PCB. The +5v pin connects to the "JD-VCC" pin on the relay, and the GND pin connects to the GND pin next to the "JD-VCC" pin. **NOTE** - Save the jumper that previously connected the "VCC" and "JC-VCC" pins on the relay board (see below).

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for the temperature sensors to work, you will need to power them. Use the jumper you removed from the relay board to connect the "OW" pin to either 5V or 3v3. Generally 5v is the best choice but there are some sensors that require 3v3 to work. The recommendation is to start with 5v and switch to 3v3 if your sensors do not work with 5v.


