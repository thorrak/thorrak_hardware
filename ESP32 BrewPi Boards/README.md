ESP8266 BrewPi Controller Boards
================================

Although the "heart" of a BrewPi controller is the microprocessor running the BrewPi-compatible firmware, without other
connected components that microcontroller cannot sense temperature, control power, or do any of the other things that
make a temperature controller useful. For the ESP32 version of this project, I have designed a single, "all-in-one" PCB
that should work for virtually all builds. 



| Board Design                                              | Tindie Order Link | OSHPark Order Link                                     |
|-----------------------------------------------------------|-------------------|--------------------------------------------------------|
| [All-in-One D32 / D32 Pro](D32%20Pro%20-%20-TFT%20AIO.md) | [Order]()         | [Order](https://oshpark.com/shared_projects/iRLM23Fa)  |


This board supports the following features:
- Supports both LoLin D32 and LoLin D32 Pro controllers
- Supports both IIC and TFT screens
- Supports both the specific LoLin D32 Pro screen, as well as generic TFT screens
- Selectable OneWire voltage
- 


### About Parts Links, Order Links, & Vendors

The BOM links provided are intended to serve as examples of the parts needed and are not the only place to source the 
parts listed.  Generally speaking, AliExpress is less expensive for parts.  The trade-off is that sometimes you are 
buying 100 at a time, and in most cases you are waiting for shipping.  DigiKey, Mouser, or other project part suppliers 
will probably have these parts as well and can generally ship much faster (albeit at much higher cost).

For convenience, order links are provided on each of the PCB's pages. Bare PCBs can be ordered from OshPark using the
link provided, or from your PCB-vendor-of-choice by uploading the Eagle design files (or converting them to gerbers
and uploading those). I also sometimes have PCBs available for sale on Tindie - including in some cases, either fully-
or partially-assembled boards. When you purchase through Tindie you are receiving a board or parts directly from me. 


## Other Required Components

This PCB is intended to be used in conjunction with a separate "Sensor Breakout Board" which is then connected to this
PCB via an RJ-45 (ethernet) cable. 

Although each individual "controller" PCB has its own unique set of required components, all the PCBs listed above require an additional set of common components and the appropriate sensor board. After choosing the appropriate PCB from the list above please review the [Common Components](Common%20Components.md) and [Sensor Board](../BrewPi%20Sensor%20Boards/README.md) pages to ensure you order everything necessary for a complete build. 


