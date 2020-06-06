# US Outlet Case Base

This is the case design I use for all of my builds. It incorporates a standard [US duplex outlet](https://www.homedepot.com/p/Leviton-15-Amp-Residential-Grade-Grounding-Duplex-Outlet-White-R52-05320-00W/202066670) and [IEC-320 C14](https://www.aliexpress.com/item/32815198325.html) power inlet.



## Files

This case base was designed in OpenSCAD and has been rendered to an STL file for printing. The OpenSCAD source is available as well.

- [STL File](Case%20Base%20-%20US%20Outlet%20v1.2.stl)
- [OpenSCAD Source](Case%20Base%20-%20US%20Outlet%20v1.2.scad)



## Bill of Materials

In order to assemble this case, you will need the following in addition to the fully assembled "main" controller PCB & common components:

| Part                                                         | Qty Needed |
| ------------------------------------------------------------ | ---------- |
| [M3 Screws](https://www.amazon.com/Machine-Finish-Phillips-M3-0-5-Threaded/dp/B00F33TR9O/ref=sr_1_1?dchild=1&keywords=m3+pan+philips+12mm&qid=1591136043&sr=8-1) (12mm to 18mm lengths recommended) | 13         |
| [M3 Nuts](https://www.amazon.com/Shapenty-100PCS-Stainless-Female-Fastener/dp/B071NLDW56/ref=sr_1_2?crid=1K1Q8HP9NJHDT&dchild=1&keywords=m3+nuts&qid=1591135900&s=hi&sprefix=m3+nuts%2Ctools%2C158&sr=1-2) | 13         |
| [Rubber Feet](https://www.amazon.com/gp/product/B08118NL2B/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1) (Optional) | 4          |
| [US Duplex Outlet](https://www.homedepot.com/p/Leviton-15-Amp-Residential-Grade-Grounding-Duplex-Outlet-White-R52-05320-00W/202066670) | 1          |
| [IEC-320 C14](https://www.aliexpress.com/item/32815198325.html) | 1          |
| Wire                                                         | *          |
| Wire Nuts/Terminal Blocks                                    | *          |
| [Female "Quick Connectors"](https://www.homedepot.com/p/CURT-Female-Quick-Connectors-16-14-Wire-Gauge-100-Pack-59592/205632800) (Optional) | 3          |

- Also needed (not listed) is one of the two screws that typically comes attached to the top/bottom of the US Duplex Outlet
- The rubber feet, while not required, are highly recommended to prevent the screw heads from resting on the ground
- The optional wire crimp ends are used to easily connect wires to the IEC-320 C14 power inlet
- For all of these components, please keep in mind that you will be powering devices that can pull several amps of current. Be certain to select the appropriate gauge of wire for your build. 



## Assembly Instructions

Unfortunately, I haven't written recent assembly instructions. An old version (using panel-mount jacks which are no longer recommended) can be found here: http://tinybat.ch/2016/11/brewpi-esp8266-enclosure-assembly/

Generally, assembly is pretty simple. Looking at the front of the case, the US Duplex Outlet goes on the left side (it should fit nicely into the holes in the case) and the IEC-320 C14 inlet goes on the right. The modules are organized inside the case as follows:

![Populated Case][populated_case]

[populated_case]:imgs/US%20Outlet%20Populated.jpg "Populated Case"

The M3 Screws/nuts are used to attach all of the components to the case, and the rubber feet are attached to the bottom of the case. Notes on the screws:

- The PSU can be attached with either 2 or 4 screws, depending on the PSU used
- The relay boards almost always can only be attached with 2 screws (The middle two screw posts circled in red in the photo above may not be usable)
- The case design has 3 posts for the "main" PCB - Your PCB may only use 2 of the 3. This is expected. (The righthandmost screw post in the photo above)
- The US outlet is secured at the top & bottom using M3 Screws/Nuts. One of the screws that were attached to the outlet when originally purchased screws through the center of the outlet to secure it to the case 

 