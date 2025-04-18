# RJ-45 Sensor Breakout

This board is intended to allow for the DS18b20 temperature sensors (and optionally, door switch) to be connected to a PCB that is away from your main BrewPi controller, thereby allowing for the use of shorter temperature sensor cables - or for the placement of the sensor breakout inside your fermentation chamber if necessary. This breakout board is intended to be connected to the BrewPi controller via an RJ-45 straight-through cable (i.e. Ethernet).

Temperature sensors are intended to be connected directly to the board, and the door sensor can either be connected directly to the board or can be connected via an optional screw terminal.

## Order Links

2 Layer Board - 1.24 x 1.55 in (31.5 x 39.4 mm)

| Vendor/Aggregator                                                                                                                        | Qty Included | Cost/Board | Total Cost | Est. Lead Time |
|------------------------------------------------------------------------------------------------------------------------------------------| ------------ |------------|------------| -------------- |
| [Tindie (me)](https://www.tindie.com/products/thorrak/brewpi-esp-rj45-sensor-breakout-board-v11-pcb/) (Includes RJ-45 & Screw Terminals) | 1            | $4.95      | $4.95      | < 1 week       |
| [OshPark](https://oshpark.com/shared_projects/5gqoDyRn)                                                                                  | 3            | $3.20      | $9.60      | < 3 weeks      |
| [DirtyPCBs](https://dirtypcbs.com/store/designer/details/Thorrak/6454/brewpi-esp-rj45-sensor-breakout-board-v1-1)                        | +/-10        | $1.32      | $13.15*    | > 6 weeks      |

- Dirty PCBs does not include shipping
- The board listed on [Tindie](https://www.tindie.com/products/thorrak/brewpi-esp-rj45-sensor-breakout-board-v11-pcb/) **includes** the RJ-45 jack and screw terminal for the door sensor

| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/RJ-45%20Top.png "Board Top"
[bot]: imgs/RJ-45%20Bottom.png "Board Bottom"


## Bill of Materials


| Part                                                                                                           | Qty  | Build Cost | Order Qty | Order Cost* |
|----------------------------------------------------------------------------------------------------------------| ---- |------------|-----------|-------------|
| [PCB](https://www.tindie.com/products/thorrak/brewpi-esp-rj45-sensor-breakout-board-v11-pcb/)                  | 1    | $4.95*     | 1         | $4.95       |
| [RJ45 Modular Jack w/no shield](https://www.aliexpress.com/item/32736146888.html) (J1)                         | 1    | $0.22      | 20        | $4.33       |
| [2-pin Screw Terminal](https://www.aliexpress.us/item/3256806456550715.html) (X1) (Optional) | 1    | $0.08      | 20        | $1.66       |

* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping.
* The Tindie PCB link includes the RJ-45 jack and 2 terminal screw clamp

- Total Build Cost (Individual): $4.95 (excluding temp sensors)
- Total Build Cost (Min Order): $4.95 (excluding temp sensors)
- This board requires a "straight-through" ethernet cable to connect to the main controller PCB
- You will also need 1-3 temperature sensors (see below)

### Temperature Sensors

In addition to the above, you will need 1-3 DS18b20 temperature sensors. 

- **One sensor** - Allows for "fridge constant" mode (similar to a typical thermostat). Will also allow for glycol mode, once released.
- **Two sensors** - **Recommended**. Additionally allows for "beer constant" and "beer profile" modes. This enables all temperature control functionality for your BrewPi build.
- **Three Sensors** - Additionally allows one sensor to measure the "room" temperature. This is informational only, and has no impact on your fermentation temperature control. 

This project recommends the use of waterproof "temperature probes" rather than bare DS18b20 sensors - though you are welcome to build your own "probe" if necessary. The pre-built probes typically come in 1m and 2m lengths - choose the length(s) necessary to go from where your sensor board will be placed to your chamber/fermenter. 

Below are some example sources for these sensors (Note that none of these sources have been tete/are guaranteed to work):

| Source                                                       | Length      | Qty  | Cost/Sensor | Total Cost |
| ------------------------------------------------------------ | ----------- | ---- | ----------- | ---------- |
| [Amazon.com](https://www.amazon.com/HiLetgo-DS18B20-Temperature-Stainless-Waterproof/dp/B00M1PM55K/ref=sr_1_3?dchild=1&keywords=ds18b20+1m&qid=1591113228&sr=8-3) | 1M          | 5    | $2.20       | $10.99     |
| [Amazon.com](https://www.amazon.com/Vktech-Waterproof-Digital-Temperature-DS18b20/dp/B00EU70ZL8/ref=sr_1_3?dchild=1&keywords=ds18b20+2m&qid=1591113387&sr=8-3) | 2M          | 5    | $3.10       | $15.49     |
| [AliExpress](https://www.aliexpress.com/item/32827810300.html) | 1M          | 10   | $0.99       | $9.87      |
| [AliExpress](https://www.aliexpress.com/item/32827810300.html) | 2M          | 10   | $1.46       | $14.57     |
| [AliExpress](https://www.aliexpress.com/item/32827810300.html) | 3M          | 10   | $1.87       | $18.71     |
| [Mouser]([https://www.mouser.com/ProductDetail/Maxim-Integrated/DS18B20%2b?qs=7H2Jq%252ByxpJKegCKabDbglA%3D%3D](https://www.mouser.com/ProductDetail/Maxim-Integrated/DS18B20%2b?qs=7H2Jq%2ByxpJKegCKabDbglA%3D%3D)) | Bare Sensor | 1    | $3.85       | $3.85      |
| [AliExpress](https://www.aliexpress.com/item/32827810300.html) | Bare Sensor | 10   | $0.37       | $3.74      |

**Note** - When selecting a temperature sensor, be certain not to get any that run in "parasitic" or "two-wire" mode. These will not work with any of the BrewPi projects.





## Build Notes

The DS18b20 temperature sensors are intended to be soldered directly to the PCB. This helps keep them secure, but can make them difficult to remove. Testing your temperature sensors before permanently attaching them is highly recommended.

The use of the door sensor is optional. If the door sensor is used, only the screw terminal OR direct solder points should be used. Attaching multiple door sensors will have unintended effects.

This board is easiest to use when inside an optional case. A 3D-printable case design is available on [Printables](https://www.printables.com/model/141682-brewpi-sensor-breakout-box). Alternative case designs/ideas are welcomed.


## Design Files

The raw Eagle design files are available within this repo.

* Board - [RJ-45 v1.1.brd](RJ-45%20v1.1.brd)
* Schematic - [RJ-45 v1.1.sch](RJ-45%20v1.1.sch)

