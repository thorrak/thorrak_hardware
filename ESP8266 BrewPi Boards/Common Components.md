# Required Components for all BrewPi-ESP8266 Builds

Every BrewPi-ESP8266 build requires three groups of components:

- The [main "controller" PCB](README.md) and the components necessary to populate it
- The [Sensor Board PCB](../BrewPi%20Sensor%20Boards/README.md) and the components necessary to populate it
- The components listed below that are common across all builds

Before finalizing the component order for your build, ensure that you are ordering all the components required in each of these three groups. 


## Common Components List

In addition to the main controller PCB, all BrewPi-ESP8266 builds will also require a LOLIN D1 Mini microcontroller, a 2-channel relay board, and an ethernet cable to connect the "controller" PCB to the [Sensor Board](../BrewPi%20Sensor%20Boards/README.md) PCB. Most builds will also require dupont connectors and an LCD2004 LCD display. The D1 Mini will require a 5V power source - this can either be via a separate power supply unit that will connect to the mains voltage (recommended) or via a USB cable connected to the USB port on the D1 mini itself.

Separate from the electronics, a complete build will also require everything necessary to connect and contain the mains voltage that your temperature controller will be managing. This means that in addition to the above, you will generally require some type of AC inlet, AC outlet, wire, wire nuts, and a container to house the build. The AC outlet, wire, and wire nuts can generally be obtained at your local hardware store. The container is generally a matter of personal preference - and will generally dictate the appropriate form of AC inlet.



### Common Components (Electronics)

| Component                                                                            | Qty | Total Cost |
|--------------------------------------------------------------------------------------|-----|------------|
| [LOLIN D1 Mini](https://www.aliexpress.com/item/32529101036.html)                    | 1   | $3.70      |
| [2-Channel 5V Relay Board](https://www.aliexpress.com/item/32997387727.html)         | 1   | $1.48      |
| [Ethernet cable](https://www.aliexpress.com/item/32694241950.html)                   | 1   | $2.69      |
| [5V 2A Power Supply Module](https://www.aliexpress.com/item/32900418425.html)        | 1   | $1.73      |
| [LCD2004 I2C LCD Display](https://www.aliexpress.com/item/1005001679675215.html)     | 1   | $4.78      |
| [Dupont Cables (Female-to-Female)](https://www.aliexpress.com/item/33039596089.html) | 13* | $1.48      |

- Total Common Component (Electronics) Cost: $14.93 (excluding shipping)
- There are many knock-off LOLIN D1 Mini boards sold by various sellers across the internet. Some of these may work, but purchasing directly from LOLIN is recommended.
- The ethernet cable is a standard, straight-through ethernet cable -- the same type as included with most home routers/networking equipment. If you have one already available, use it rather than ordering one.
- The 5V 2A power supply I've had the most success with is the "bare PCB" type linked above. I've had an extremely high failure rate with ["shielded"](https://www.aliexpress.com/item/4000860428016.html) power supplies. Bad or undersized power supplies are the #1 cause of failure in these builds.
- Be certain to buy an "I2C" LCD2004 LCD Display. 
- The "No-LCD" controller PCB does not require an LCD2004 LCD display
- Dupont cables are typically sold in multi-packs. The link/price shown above is more than enough for several complete builds. I recommend either the 20 or 30cm ones to provide enough room for your build. 
- The "Screw Terminal" controller PCB does not require the use of female-to-female Dupont cables, but it is highly recommended that you pick up some male-to-female dupont cables as they will make connecting the LCD and Relay modules *much* easier.



### Other Common Components

Other common components which are typically needed for a build include the following - many of which can be obtained at your local hardware store:

- **Container** - For both safety and aesthetics, your controller needs to be enclosed in a container of some type. Containers can range from prefabricated project boxes to custom 3D-printed solutions. I have several recommended, 3D-printable designs [available in this repo](../BrewPi%20Containers/README.md). 
- **Wire** - You will need wire for connecting the mains voltage between the AC inlet, AC outlet, relay, and power supply.
- **AC Outlet** - Most builds incorporate an AC outlet of some type to prevent having to splice into the wiring of your fridge/heater/pump directly. The choice of outlet is often dictated by the container you use to house your build. Two common choices are a traditional [wall receptacle](https://www.homedepot.com/p/Leviton-15-Amp-Residential-Grade-Grounding-Duplex-Outlet-White-R52-05320-00W/202066670) or an extension cord which has been cut in half.
- **AC Inlet** -  The choice of inlet is similarly dictated by the container you use to house your build. Two common choices are an [IEC-320 C14](https://www.aliexpress.com/item/32804170262.html) male plug or an extension cord which has been cut in half. Caution is recommended before using an [outlet with an integrated switch](https://www.aliexpress.com/item/32639960373.html), as the switches are oftentimes rated for lower amperage than the outlet/fuse and thus risk catching fire.
- **Wire Nuts/Terminal Blocks** - You will need to connect many wires together to complete your build, and the use of wire nuts or [terminal blocks](https://www.homedepot.com/p/Tyco-Electronics-Double-Row-Terminal-Block-4-Position-1-Clam-CA7323-000/202204313) are recommended.

For all of these components, please keep in mind that you will be powering devices that can pull several amps of current. Be certain to select the appropriate gauge of wire for your build. 

