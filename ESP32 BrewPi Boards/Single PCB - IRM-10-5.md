# D32 Pro - True "All-in-One" PCB /w IRM-10-5 Power Supply

This PCB is designed to allow connecting an ESP32 to the other hardware necessary to run the BrewPi firmware and
control fermentation temperatures for your brewery. This specific board was designed to use a LoLin D32 Pro ESP32
microcontroller, but integrates all of the components typically housed on a separate power supply or 2-channel
relay board. This enables a single PCB to serve as a nearly-complete BrewPi-ESP build. This board can connect to
a third-party TFT using the on-board box header, or can connect via the D32 Pro's on-board connector to LoLin's
TFT.

This board does not have terminals for directly connecting temperature sensors - it is intended to have an RJ-45 jack
soldered on, and then be connected to a separate RJ-45 sensor board via an ethernet cable.

**NOTE** - The choice of this board (vs. the [PSK-10D-5](Single%20PCB%20-%20PSK-10D-5.md) design) comes down to which power supply
you can source. The power supply is included with purchases from [Tindie](https://www.tindie.com/products/thorrak/brewpi-esp32-all-in-one-pcb-kit/), and thus you can be agnostic as to the design if you purchase from there.


## Order Links

2 Layer Board - 3.10 x 3.69 in (78.7 x 93.7 mm)

| Vendor/Aggregator                                                    | Qty Included | Cost/Board | Total Cost | Est. Lead Time |
|----------------------------------------------------------------------|--------------|------------|------------|----------------|
| [OshPark](https://oshpark.com/shared_projects/B6Dk3a2B)              | 3            | $19.05     | $57.15     | < 3 weeks      |
| Tindie (Coming Soon) - **Partially Assembled, Includes Components**  | 1            | $47.95     | $47.95     | < 1 week       |

- The PCB from Tindie includes **all parts** listed in the Bill of Materials below
- The PCB from Tindie includes all SMD components pre-soldered to the board, and includes the TH components for solder by the user
- This design **does not** integrate temperature sensors, and is intended for use with a separate [sensor PCB](../BrewPi%20Sensor%20Boards/README.md)



| Top View          | Bottom View          |
| ----------------- |:--------------------:|
| ![Board Top][top] | ![Board Bottom][bot] |

[top]: imgs/Single%20PCB%20-%20IRM-10-5%20Top.png "Board Top"
[bot]: imgs/Single%20PCB%20-%20IRM-10-5%20Bottom.png "Board Bottom"


### Design Files

- [Eagle Schematic](Single%20PCB%20-%20IRM-10-5.sch)
- [Eagle Board](Single%20PCB%20-%20IRM-10-5.brd)
- [JLC BOM](Single%20PCB%20-%20IRM-10-5_bom.csv)
- [JLC CPL](Single%20PCB%20-%20IRM-10-5_cpl.csv)


## Bill of Materials

| Part                                                                                                                           | Qty | Build Cost | Order Qty | Order Cost* |
|--------------------------------------------------------------------------------------------------------------------------------|-----|------------|-----------|-------------|
| [PCB](https://oshpark.com/shared_projects/B6Dk3a2B)                                                                            | 1   | $19.05     | 3         | $57.15      |
| [IRM-10-5 Power Supply](https://www.digikey.com/en/products/detail/mean-well-usa-inc/IRM-10-5/7704657)                         | 1   | $7.20      | 1         | $7.20       |
| [0.1uF (100nF) 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B104KACNNNC/3886757)   | 2   | $0.16      | 2         | $0.16       |
| [1.0uF 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B105KAFNNNE/3886724)           | 2   | $0.16      | 2         | $0.16       |
| [220uF Aluminum Capacitor](https://www.digikey.com/en/products/detail/kemet/A750EK227M1CAAE016/6196322)                        | 1   | $0.58      | 1         | $0.58       |
| [Red 0603 LED](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/150060SS75000/4489903)                         | 3   | $0.42      | 3         | $0.42       |
| [16-Pin Female Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PPTC161LFBN-RC/810154)       | 2   | $1.80      | 2         | $1.80       |
| [3-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)         | 3   | $0.66*     | 40*       | $0.66*      |
| [2.54mm Jumper](https://www.digikey.com/en/products/detail/sullins-connector-solutions/STC02SYAN/76372)                        | 1   | $0.10      | 1         | $0.10       |
| [10-Pin (2x5) Box Header](https://www.digikey.com/en/products/detail/amphenol-cs-commercial-products/G821EU210AGM00Y/13683147) | 1   | $0.83      | 1         | $0.83       |
| [2A Board Mount Fuse](https://www.digikey.com/en/products/detail/eaton-electronics-division/SS-5H-2A-APH/3719658)              | 1   | $0.74      | 1         | $0.74       |
| [8A Board Mount Fuse](https://www.digikey.com/en/products/detail/bel-fuse-inc/0697H8000-01/5208762)                            | 1   | $0.52      | 1         | $0.52       |
| [560V 4.5Ka Varistor](https://www.digikey.com/en/products/detail/yageo/561KD14/13689522)                                       | 1   | $0.46      | 1         | $0.46       |
| [RJ45 Modular Jack w/no shield](https://www.digikey.com/en/products/detail/stewart-connector/SS-90000-001/14548964)            | 1   | $0.64      | 1         | $0.64       |
| [Songle 5v DC 10A Relay](https://www.aliexpress.us/item/2251832637395159.html)                                                 | 2   | $0.91      | 5         | $2.26       |
| [5kv Optoisolator](https://www.digikey.com/en/products/detail/liteon/LTV-817S-TA1/388451)                                      | 2   | $0.50      | 2         | $0.50       |
| [2-terminal Screw Clamp](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/691137710002/6644051)                | 3   | $1.08      | 3         | $1.08       |
| [SMAJ7.0A TVS Diode](https://www.digikey.com/en/products/detail/bourns-inc/SMAJ7-0A/2254658)                                   | 1   | $0.35      | 1         | $0.35       |
| [4.7k 0805 Resistor](https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGCQ0805J4K7/8576740)         | 1   | $0.10      | 1         | $0.10       |
| [680R 0805 Resistor](https://www.digikey.com/en/products/detail/panasonic-electronic-components/ERJ-6GEYJ681V/89778)           | 1   | $0.10      | 1         | $0.10       |
| [1k 0805 Resistor](https://www.digikey.com/en/products/detail/susumu/RR1220P-102-D/432291)                                     | 2   | $0.20      | 2         | $0.20       |
| [NPN Transistor](https://www.digikey.com/en/products/detail/micro-commercial-co/MMBT2222A-TP/717279)                           | 2   | $0.22      | 2         | $0.22       |
| [1kV 1A DO-214AC Diode](https://www.digikey.com/en/products/detail/smc-diode-solutions/S1M/6022596)                            | 2   | $0.26      | 2         | $0.26       |


* **Total Build Cost (Individual):** $37.04
* **Total Build Cost (Min Order):** $76.49
* Order cost is the cost to order the linked item, in its minimum quantity, excluding shipping/tax/tariffs.

- Male pin headers typically come in strips of 40 - one strip of which is more than enough for the 9 pins required for this project
- In addition to the parts list above a complete build requires a subset of the [Common Components](../ESP8266%20BrewPi%20Boards/Common%20Components.md) (see below) and the appropriate [Sensor Board](../BrewPi%20Sensor%20Boards/README.md)


## Common Components (Electronics)

These components are required for a complete build:

| Component                                                                | Qty | Total Cost |
|--------------------------------------------------------------------------|-----|------------|
| [LOLIN D32 Pro](https://www.aliexpress.us/item/2251832696801305.html)    | 1   | $13.54     |
| [Ethernet cable](https://www.aliexpress.com/item/32694241950.html)       | 1   | $1.97      |
| [LOLIN TFT](https://www.aliexpress.us/item/2251832733414978.html)*       | 1   | $16.50     |
| [LOLIN TFT Cable](https://www.aliexpress.us/item/2251832662518722.html)* | 1   | $1.33      |

- Total Common Component (Electronics) Cost: $33.34 (excluding shipping)
- There are many knock-off LOLIN boards sold by various sellers across the internet. Some of these may work, but purchasing directly from LOLIN is recommended.
- The ethernet cable is a standard, straight-through ethernet cable -- the same type as included with most home routers/networking equipment. If you have one already available, use it rather than ordering one.
- The LOLIN TFT & TFT Cable are only required if using the Lolin TFT display type. If using a separate, third-party TFT -- or not using a display at all -- these can be omitted



Build Notes
-----------

This board is intended to be used with an additional ["sensor breakout PCB"](../BrewPi%20Sensor%20Boards/README.md) to
which the DS18b20 temperature sensors will need to be connected.

This board allows for selectable voltage to the DS18b20 temperature sensors via the "ONEWIRE_VSEL" header. In order for
the temperature sensors to work, you will need to power them. Use the jumper to connect
the "OW" pin to either 5V or 3v3. Generally 5v is the best choice but there are some sensors that require 3v3 to work.
The recommendation is to start with 5v and switch to 3v3 if your sensors do not work with 5v.

This board supports two screen types, though it is only recommended that one be used at a time. The board supports:
- The matched D32 Pro LCD screen available through LoLin connected via their cable directly to the controller
- The use of an ILI9341-driven TFT screen connected to the 10 pin box header



Changelog
---------

v0.2 - 2024-12-19

- Initial board design
