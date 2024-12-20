# Main BrewPi-ESP PCB Container

The "main" BrewPi-ESP PCB container houses all the primary modules associated with a BrewPi build. This includes the 
PCB /w the attached ESP, power supply, relay, AC outlet, and AC inlet.

For builds that use the [ESP32 "all-in-one"](../../ESP32%20BrewPi%20Boards/README.md) PCB design, you will need the
case design specific to that PCB. These are marked with "AIO" in the name.



## Case Design

The case design consists of a base and a lid. The design is such that any of the below case bases will work with any of the below case lids.

If you have an alternative case design for this project that you would like listed here, either submit a pull request to add it or let me know. 



### Case Base Designs

| Design                                      | Description                                                                                                                                                                                                                                                                                               |
|---------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [US Outlet](US%20Outlet.md)                 | Base case design incorporating a standard [US duplex outlet](https://www.homedepot.com/p/Leviton-15-Amp-Residential-Grade-Grounding-Duplex-Outlet-White-R52-05320-00W/202066670) and [IEC-320 C14](https://www.aliexpress.com/item/32815198325.html) power inlet                                          |
| [AIO PCB - US Outlet](AIO%20US%20Outlet.md) | Base case design incorporating a standard [US duplex outlet](https://www.homedepot.com/p/Leviton-15-Amp-Residential-Grade-Grounding-Duplex-Outlet-White-R52-05320-00W/202066670) and [IEC-320 C14](https://www.aliexpress.com/item/32815198325.html) power inlet, designed for the "all-in-one" ESP32 PCB |



### Case Lid Designs

| Design                                                                  | Description                                                                                  |
|-------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| [LCD2004 Case Lid](./LCD2004%20Case%20Lid.md)                           | A case lid designed to attach to an LCD2004 LCD display                                      |
| [LoLin D32 v1.1.0 Case Lid](LoLin%20D32%20v1.1.0%20LCD%20Case%20Lid.md) | A case lid designed to attach to a LoLin D32 v1.1.0 display                                  |
| [AIO PCB - 2.8" TFT Case Lid](AIO%20US%20Outlet.md)                     | A case lid designed to attach a 2.8" generic TFT to one of the "all-in-one" PCB case designs |
