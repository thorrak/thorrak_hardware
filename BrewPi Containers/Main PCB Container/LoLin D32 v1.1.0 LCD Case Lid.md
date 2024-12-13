# LoLin D32 v1.1.0 Case Lid

This case lid design incorporates an LoLin D32 v1.1.0 display which can be used with the BrewPi-ESP project. This lid is designed
for use with one of the [Main PCB Containers](README.md) available for the BrewPi-ESP project.

The LoLin D32 v1.1.0 is a display/touchscreen module available from LoLin 


## Files

This case base was designed in OpenSCAD and has been rendered to an STL file for printing. The OpenSCAD source is available as well.

- [STL File](LoLin%20D32%20v1.1.0%20LCD%20Case%20Lid.stl)
- [OpenSCAD Source](LoLin%20D32%20v1.1.0%20LCD%20Case%20Lid.scad)



## Bill of Materials

In order to assemble this case, you will need the following in addition to the fully assembled "main" controller PCB & common components:

| Part                                                                                                               | Qty Needed |
|--------------------------------------------------------------------------------------------------------------------|------------|
| [M2 Screws/Nuts](https://www.amazon.com/4mm-6mm-10mm-12mm-16mm/dp/B0B93G1H9L/) (12mm to 18mm lengths recommended)  | 4 of each  |
| [LoLin TFT-2.4 v1.1.0](https://www.aliexpress.us/item/2251832733414978.html) (See note below about screen version) | 1          |
| [LoLin TFT Cable](https://www.aliexpress.us/item/2251832662518722.html) (See note below)                           | 1          |
| #4-24 Sheet Metal Screws                                                                                           | 2          |

- Although the link above reads "v1.0.0", LoLin has been shipping the v1.1.0 screen since at least 2020. The difference in the screens is that the v1.1.0 screen is rotated 180 degrees from the v1.0.0 screen. The v1.1.0 screen is the one you want for this case lid.
- The LoLin TFT-2.4 display replaces the LCD2004 screen in the ["Common Components"](../../ESP8266%20BrewPi%20Boards/Common%20Components.md) list
- The LoLin TFT cable should be used to connect the LoLin TFT-2.4 display to a LoLin D32 Pro Controller. The cable is not required for this case lid, but is the easiest way to connect the LCD to a compatible controller.
- The #4-24 sheet metal screws are used to attach the lid to the case base



## Assembly Instructions

Assembly for the lid is fairly straightforward:

1. Attach the TFT cable to the LoLin TFT-2.4 display
2. Attach the display to the lid itself using the M2 Screws/Nuts
3. Connect the TFT cable to the socket on the D32 Pro Controller PCB
4. Insert the lid into the case base. The tabs on the lid insert into the holes in the case base
5. Secure the lid to the case base by screwing the sheet metal screws through the holes in the upper left/right of the lid
