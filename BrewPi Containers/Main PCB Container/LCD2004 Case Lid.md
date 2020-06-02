# LCD2004 Case Lid

This case lid design incorporates an LCD2004 display which can be used with the BrewPi-ESP8266 project. 



## Files

This case base was designed in OpenSCAD and has been rendered to an STL file for printing. The OpenSCAD source is available as well.

- [STL File](LCD2004%20Case%20Lid.stl)
- [OpenSCAD Source](LCD2004%20Case%20Lid.scad)



## Bill of Materials

In order to assemble this case, you will need the following in addition to the fully assembled "main" controller PCB & common components:

| Part                                                         | Qty Needed |
| ------------------------------------------------------------ | ---------- |
| [M3 Screws](https://www.amazon.com/Machine-Finish-Phillips-M3-0-5-Threaded/dp/B00F33TR9O/ref=sr_1_1?dchild=1&keywords=m3+pan+philips+12mm&qid=1591136043&sr=8-1) (12mm to 18mm lengths recommended) | 4          |
| [M3 Nuts](https://www.amazon.com/Shapenty-100PCS-Stainless-Female-Fastener/dp/B071NLDW56/ref=sr_1_2?crid=1K1Q8HP9NJHDT&dchild=1&keywords=m3+nuts&qid=1591135900&s=hi&sprefix=m3+nuts%2Ctools%2C158&sr=1-2) | 4          |
| [LCD2004 I2C LCD Display](https://www.aliexpress.com/item/32831845529.html)* | 1          |
| #4-24 Sheet Metal Screws                                     | 2          |

- The LCD2004 display is the same as the one in the ["Common Components"](../../ESP8266%20BrewPi%20Boards/Common%20Components.md) list
- The #4-24 sheet metal screws are used to attach the lid to the case base



## Assembly Instructions

Assembly for the lid is fairly straightforward:

1. Attach the LCD2004 display to the lid itself using the M3 Screws/Nuts
2. Connect the LCD2004 display's I2C module to the "main" PCB using dupont cables (or the appropriate cable type)
3. Insert the lid into the case base. The tabs on the lid insert into the holes in the case base
4. Secure the lid to the case base by screwing the sheet metal screws through the holes in the upper left/right of the lid

**Note** - depending on your display, the LCD may not be flush against the lid. You can either add additional nuts between the lid & display on the side that is closest as spacers in order to help "even" it out, or ignore it. 