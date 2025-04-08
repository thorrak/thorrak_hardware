# "Discrete Component" US Outlet Case

This is the case design I use for all of my builds that utilize the "discrete component" PCB (where the power supply and relays are separate from the main PCB). It incorporates a standard [US duplex outlet](https://www.homedepot.com/p/Leviton-15-Amp-Residential-Grade-Grounding-Duplex-Outlet-White-R52-05320-00W/202066670) and [IEC-320 C14](https://www.aliexpress.com/item/32815198325.html) power inlet.

The lid you print for this case should be chosen based on the display you plan to use. There are several options available - if none of them work for your specific build, please feel free to reach out.


## Case Base Files

This case base was designed in OpenSCAD and has been rendered to an STL file for printing. The OpenSCAD source is available as well.

- [STL File (Filleted Edges)](Case%20Base%20-%20US%20Outlet%20v2.0.stl)
- [STL File](Case%20Base%20-%20US%20Outlet%20v2.0.stl)
- [OpenSCAD Source](Case%20Base%20-%20US%20Outlet%20v2.0.scad)

There are two STL files available for each component: one which is the direct output from OpenSCAD, and one which has had the edges filleted slightly in Fusion 360. The choice of which to use is up to you, but I recommend choosing the same (filleted or not filleted) for both the case lid and base.


### Ordering

If you do not have a 3D printer and would like to order this case to be printed for you, I make them available on my [Tindie store](https://www.tindie.com/products/26726/). Orders include the screws and heat set inserts necessary for assembly.

### Bill of Materials

In order to assemble this case, you will need the following in addition to the fully assembled "main" controller PCB & common components:

| Part                                                         | Qty Needed |
| ------------------------------------------------------------ | ---------- |
| [M3x6mm Screws](https://www.amazon.com/BNUOK-180pcs-Socket-Threads-Spanner/dp/B0DJQGCS36/)  | 13-15         |
| [M3x4x6mm Heat Set Inserts](https://www.amazon.com/ruthex-M3-Threaded-Inserts-RX-M3x5-7/dp/B08BCRZZS3/)  | 13-15         |
| [M3x12mm Screws](https://www.amazon.com/BNUOK-120pcs-Stainless-Threads-Spanner/dp/B0DJQGMQZM/) (12mm to 18mm lengths recommended) | 4         |
| [M3 Nuts](https://www.amazon.com/Shapenty-100PCS-Stainless-Female-Fastener/dp/B071NLDW56/) | 4         |
| [Rubber Feet](https://www.amazon.com/gp/product/B08118NL2B/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1) (Optional) | 4          |
| [US Duplex Outlet](https://www.homedepot.com/p/Leviton-15-Amp-Residential-Grade-Grounding-Duplex-Outlet-White-R52-05320-00W/202066670) | 1          |
| [IEC-320 C14](https://www.aliexpress.com/item/32815198325.html) | 1          |
| Wire                                                         | *          |
| Wire Nuts/Terminal Blocks                                    | *          |
| [Female "Quick Connectors"](https://www.homedepot.com/p/CURT-Female-Quick-Connectors-16-14-Wire-Gauge-100-Pack-59592/205632800) (Optional) | 3          |

- Also needed (not listed) is one of the two screws that typically comes attached to the top/bottom of the US Duplex Outlet
- The optional wire crimp ends are used to easily connect wires to the IEC-320 C14 power inlet
- For all of these components, please keep in mind that you will be powering devices that can pull several amps of current. Be certain to select the appropriate gauge of wire for your build.



### Assembly Instructions

Unfortunately, I haven't written recent assembly instructions. An old version (using panel-mount jacks which are no longer recommended) can be found here: http://tinybat.ch/2016/11/brewpi-esp8266-enclosure-assembly/

Generally, assembly is pretty simple. Looking at the front of the case, the US Duplex Outlet goes on the left side (it should fit nicely into the holes in the case) and the IEC-320 C14 inlet goes on the right. The modules are organized inside the case as follows:

![Populated Case][populated_case]

[populated_case]:imgs/US%20Outlet%20Populated.jpg "Populated Case"

The M3 Screws/nuts are used to attach all of the components to the case, and the rubber feet are attached to the bottom of the case. Notes on the screws:

- Heat set inserts should be placed in all of the posts on the base of the case, and in the four angled posts along the top of the case
- The power supply can be attached with either 2 or 4 screws, depending on the power supply module used
- The relay boards almost always can only be attached with 2 screws (The middle two screw posts circled in red in the photo above may not be usable)
- The case design has 3 posts for the "main" PCB - Your PCB may only use 2 of the 3. This is expected. (The righthandmost screw post in the photo above)
- The "main" PCB, relay board, and power supply should be secured using the M3x6mm screws to the heat set inserts
- Four of the M3x6mm screws will be used to secure the case lid to the base
- The US outlet is secured at the top & bottom using M3x12mm Screws/Nuts. One of the screws that were attached to the outlet when originally purchased screws through the center of the outlet to additionally secure it to the case 
- The IEC-320 C14 inlet is secured at the top & bottom using the M3x12mm Screws/Nuts


### Revisions

v2.0 - April 2025

This revision makes a number of changes to the case based on feedback over the years:

- Replaces most of the screw & nut combinations for holding components to the case with heat set inserts
- Simplifies the BoM by eliminating the two Philips pan-head screws which were only used to secure the lid to the base
- Removes the "vent holes" on the sides of the case
- Reduces the filament required to print the case by reducing the overall height
- Reduces the wall thickness from 3mm to 2.5mm
