ESP32 BrewPi Controller Boards
==============================

# NOTE - This document is NOT complete/verified yet. 
## Please do not base a build on this doc without consulting Thorrak directly first!


Although the "heart" of a BrewPi controller is the microprocessor running the BrewPi-compatible firmware, without other
connected components that microcontroller cannot sense temperature, control power, or do any of the other things that
make a temperature controller useful. For the ESP32 version of this project, I have designed a single, "all-in-one" PCB
that should work for virtually all builds. 


| Board Design                                              | Tindie Order Link                               | OSHPark Order Link                                     |
|-----------------------------------------------------------|-------------------------------------------------|--------------------------------------------------------|
| [All-in-One D32 / D32 Pro](D32%20Pro%20-%20-TFT%20AIO.md) | [Order](https://www.tindie.com/products/27251/) | [Order](https://oshpark.com/shared_projects/iRLM23Fa)  |


This board supports the following features:
- Supports both [LoLin D32](https://www.wemos.cc/en/latest/d32/d32.html) and [LoLin D32 Pro](https://www.wemos.cc/en/latest/d32/d32_pro.html) controllers
- Supports both IIC and TFT screens
- Supports both the specific [LoLin D32 Pro screen](https://www.aliexpress.com/item/2251832733414978.html), as well as generic TFT screens
- Selectable OneWire voltage
- Optional TH-only configuration for easy assembly


### About Parts Links, Order Links, & Vendors

The BOM links provided are intended to serve as examples of the parts needed and are not the only place to source the 
parts listed.  Generally speaking, AliExpress is less expensive for parts.  The trade-off is that sometimes you are 
buying 100 at a time, and in most cases you are waiting for shipping.  DigiKey, Mouser, or other project part suppliers 
will probably have these parts as well and can generally ship much faster (albeit at much higher cost).

For convenience, order links are provided on each of the PCB's pages. Bare PCBs can be ordered from OshPark using the
link provided, or from your PCB-vendor-of-choice by uploading the Eagle design files (or converting them to gerbers
and uploading those). I also sometimes have PCBs available for sale on Tindie - including in some cases, either fully-
or partially-assembled boards. When you purchase through Tindie you are receiving a board or parts directly from me. 

#### TH Parts required to assemble the PCB

| Part                                                                                                                                       | Qty |
|--------------------------------------------------------------------------------------------------------------------------------------------|-----|
| [PCB](https://www.tindie.com/products/27251/)                                                                                              | 1   |
| [RJ45 Modular Jack w/no shield](https://www.digikey.com/en/products/detail/stewart-connector/SS-90000-001/14548964)                        | 1   |
| [2-terminal Screw Clamp](https://www.digikey.com/en/products/detail/w%C3%BCrth-elektronik/691137710002/6644051)                            | 1   |
| [4-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)                     | 2   |
| [3-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)                     | 1   |
| [2-Pin Male Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PRPC040SAAN-RC/2775214)                     | 1   |
| [16-Pin Female Pin Header](https://www.digikey.com/en/products/detail/sullins-connector-solutions/PPTC161LFBN-RC/810154)                   | 2   |
| [10-Pin (2x5) Box Header](https://www.digikey.com/en/products/detail/amphenol-cs-commercial-products/G821EU210AGM00Y/13683147) (Optional*) | 1   |
| [2.54mm Jumper](https://www.digikey.com/en/products/detail/sullins-connector-solutions/STC02SYAN/76372)**                                  | 1   |

*- The 10-pin box header is optional, but enables the use of a non-Lolin TFT screen attached to an LCD breakout PCB. If using an IIC screen or the [LoLin D32 Pro screen](https://www.aliexpress.com/item/2251832733414978.html) + [cable](https://www.aliexpress.com/item/2251832662518722.html), this can be left off.
**- The 2.54mm jumper is probably included on the 2-channel relay board you will purchase as part of the "common component" set below


### SMD Components required to assemble the PCB

Note - You will not need the following if you purchased the partially-assembled PCB from my [Tindie store](https://www.tindie.com/products/27251/). 

This board supports assembly with both SMD and TH components -- you can choose between the SMD components linked below 
and the TH components in the second table. You will not need both. The SMD components will enable the LCD2004 screen 
option - this screen will not work if you use the TH component set. 

| SMD Parts                                                                                                                     | Qty |
|-------------------------------------------------------------------------------------------------------------------------------|-----|
| [10k 0805 Resistor](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/RNCP0805FTD10K0/2240262)             | 4   |
| [4.7k 0805 Resistor](https://www.digikey.com/en/products/detail/te-connectivity-passive-product/CRGCQ0805J4K7/8576740)        | 1   |
| [0.1uF (100nF) 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B104KACNNNC/3886757)  | 2   |
| [1.0uF 0805 Capacitor](https://www.digikey.com/en/products/detail/samsung-electro-mechanics/CL21B105KAFNNNE/3886724)          | 2   |
| [BSS138 MOSFET](https://www.digikey.com/en/products/detail/onsemi/BSS138/244210)                                              | 2   |


This is the optional, alternative TH part set. You **DO NOT** need these parts if you ordered either the SMD parts above, or the partially-assembled PCB:

| Alternative TH Part                                                                                      | Qty |
|----------------------------------------------------------------------------------------------------------|-----|
| [4.7k Resistor](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT4K70/1741428) | 1   |
| [0.1uF (100nF) Capacitor](https://www.digikey.com/en/products/detail/kemet/C315C104M5U5TA/817927)        | 2   |
| [1.0uF Capacitor](https://www.digikey.com/en/products/detail/kemet/C320C105K5N5TA7301/12701373)          | 2   |


## Other Required Components

Below are the other "required" components for almost every build: 

| Component                                                                            | Qty |
|--------------------------------------------------------------------------------------|-----|
| [LOLIN D32 Pro](https://www.aliexpress.com/item/2251832696801305.html)               | 1   |
| [2-Channel 5V Relay Board](https://www.aliexpress.com/item/32997387727.html)         | 1   |
| [Ethernet cable](https://www.aliexpress.com/item/32694241950.html)                   | 1   |
| [5V 2A Power Supply Module](https://www.aliexpress.com/item/32900418425.html)        | 1   |
| [Dupont Cables (Female-to-Female)](https://www.aliexpress.com/item/33039596089.html) | 13* |

In addition to the above, this PCB is intended to be used in conjunction with a separate "Sensor Breakout Board" which 
is then connected to this PCB via the RJ-45 (ethernet) cable listed above. To complete a full controller, you will need
the components listed on the [Sensor Board](../BrewPi%20Sensor%20Boards/README.md) pages as well.
