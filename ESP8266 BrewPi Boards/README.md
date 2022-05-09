ESP8266 BrewPi Controller Boards
================================

Although the "heart" of a BrewPi controller is the microprocessor running the BrewPi-compatible firmware, without other connected components that microcontroller cannot sense temperature, control power, or do any of the other things that make a temperature controller useful. Several PCBs have been designed to help simplify the wiring of the microcontroller to those other components.

Six different versions of the main "controller" PCB are listed here.  Each provide different functionality and/or form factors:

*   No LCD Support with DuPont connectors and through-hole components
*   LCD Support with DuPont connectors and surface-mount level converter components
*   LCD Support with DuPont connectors, through-hole components, and a SparkFun-based level converter sub-board
*   LCD Support with screw connectors, through-hole components, and a SparkFun-based level converter sub-board
*   LCD Support with DuPont connectors, through-hole components, and an integrated level converter
*   LCD Support with DuPont connectors, through-hole components, a SparkFun-based level converter sub-board, and direct connections for temperature sensors


| Board Design                                                                                                             | Order Link                                             | Through Hole        | Surface Mount       | I2C LCD             | Connector Type   | Integrated Level Shifter  | Selectable OneWire Voltage  |
|--------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|---------------------|---------------------|---------------------|------------------|---------------------------|-----------------------------|
| [Surface Mount](D1%20-%20SMD.md)                                                                                         | [Order](https://oshpark.com/shared_projects/1slCGU7M)  |                     | :heavy_check_mark:  | :heavy_check_mark:  | Dupont           | :heavy_check_mark:        | :heavy_check_mark:          |
| [TH - Sparkfun /w Dupont Cables](D1%20-%20LCD%20TH%20Dupont.md)                                                          | [Order](https://oshpark.com/shared_projects/ZyUfectQ)  | :heavy_check_mark:  |                     | :heavy_check_mark:  | Dupont           |                           | :heavy_check_mark:          |
| [TH - MOSFETs](https://github.com/brewpi-remix/brewpi-pcb-rmx/tree/master/ESP8266%20Boards/WeMos%20D1%20Mini%20Breakout) | [Order](https://oshpark.com/shared_projects/YLXZEzde)  | :heavy_check_mark:  |                     | :heavy_check_mark:  | Dupont           | :heavy_check_mark:        |                             |
| [TH - Sparkfun /w Screw Terminals](D1%20-%20LCD%20TH%20Screws.md)                                                        | [Order](https://oshpark.com/shared_projects/OmKNGkVm)  | :heavy_check_mark:  |                     | :heavy_check_mark:  | Screw Terminals  |                           | :heavy_check_mark:          |
| [TH - No LCD](D1%20-%20No%20LCD.md)                                                                                      | [Order](https://oshpark.com/shared_projects/TOON0jUw)  | :heavy_check_mark:  |                     |                     | Dupont           |                           | :heavy_check_mark:          |
| [TH - Sparkfun /w Dupont Cables NoRJ](D1%20-%20LCD%20TH%20Dupont%20NoRJ.md)                                              | [Order](https://oshpark.com/shared_projects/hdqCEBHe)  | :heavy_check_mark:  |                     | :heavy_check_mark:  | Dupont           |                           | :heavy_check_mark:          |



### About Parts Links, Order Links, & Vendors

The BOM links provided are intended to serve as examples of the parts needed and are not the only place to source the parts listed.  Generally speaking, AliExpress is less expensive for parts.  The trade-off is that sometimes you are buying 100 at a time, and in most cases you are waiting for shipping.  DigiKey, Mouser, or other project part suppliers will probably have these parts as well and can generally ship much faster (albeit at much higher cost).

For convenience, order links are provided on each of the PCB's pages to a handful of PCB vendors. OshPark tends to be one of the more expensive board aggregators, but also happens to be one of the faster/more reliable ones. DirtyPCBs tends to be cheaper (especially when ordering in bulk) but ship from China and can take awhile to arrive. When I have PCBs either available or left over, I sometimes offer them for sale on Tindie - when you purchase through Tindie you are receiving a board or parts directly from me. 

The direct links to DirtyPCBs include a small premium (10%) which is credited into my DirtyPCBs account. That credit is used in the development of these and other projects. Anyone who has done development like this can tell you how many boards we go through, and the cost is not insignificant. If you prefer to avoid this markup you may absolutely take these files from GitHub and upload them yourself. In the spirit of transparency, If you do purchase through these links it's only fair I tell you about it and what I will do with the credits.



Features Explained
------------------

### Through Hole vs. Surface Mount

Through Hole components generally have a wire or pin that goes through a hole on the PCB, enabling easy soldering on the back-side of the circuit board. By contrast, Surface Mount components are attached directly to the surface of a PCB with small dots of solder. The overwhelming majority of PCBs use primarily surface mount components - but as these are more difficult to solder by hand, many hobbyists prefer hand-soldering through hole components. 

Choose "surface mount" if you want a compact board and are comfortable learning to solder surface mount components. Choose "through hole" if you are not comfortable soldering and would prefer the easiest option.


### I2C LCD

The ESP8266 port of the BrewPi firmware supports the utilization of an LCD screen connected via an "I2C" interface. Due to the nature of these LCD screens this requires additional hardware which increases the size & complexity of the board - but the slight amount of additional pain when building the controller pays off in the increased utility of having an LCD.

Choose this option if you want an LCD screen. Ignore this option if you prefer the cheapest board available (and are OK with not having an LCD).


### Connector Type - Dupont vs. Screw Terminals

"Dupont" cables are a type of cable that has a single female header at each end. This allows for connecting two devices with "pin header" interfaces through the use of a compact "ribbon"-type cable. 

Boards that are "dupont" style have compact pin-headers on them, and can only be used with Dupont cables. By contrast, "screw terminal" style boards are designed to have screw terminals soldered on which makes attaching/detaching cables easier. Screw-terminal boards are larger but can be optionally used with pin headers as well, however "dupont" style boards are not compatible with screw terminals.

Choose "dupont" if you want a cheaper, smaller board. Choose "screw terminals" if you prefer much larger soldering pads. 


### Integrated Level Shifter

I2C LCDs require that the 3.3 volt logic from the ESP8266 be "translated" to the 5 volt logic required by the LCD. This is done through the use of a "level shifter". Level shifters are relatively simple components, but require soldering a number of things by hand which some hobbyists would prefer not to do. The boards with integrated level shifters have these additional components as part of the PCB, while those boards without an integrated level shifter use a "sparkfun"-style level shifter which is attached to the board using pin headers. 

Choose this option if you want a smaller, more compact board.


### Selectable OneWire Voltage

The OneWire temperature sensors require power in order to work. Due to their design they can be powered via either 5V or 3v3. Most sensors tend to work better when powered with 5V, however some sensors do not respond when powered with 5V and require 3v3. Boards wih selectable OneWire voltage can be configured when built to provide either 5v or 3v3 to the OneWire sensors. 


## Other Required Components

Although each individual "controller" PCB has its own unique set of required components, all the PCBs listed above require an additional set of common components and the appropriate sensor board. After choosing the appropriate PCB from the list above please review the [Common Components](Common%20Components.md) and [Sensor Board](../BrewPi%20Sensor%20Boards/README.md) pages to ensure you order everything necessary for a complete build. 


