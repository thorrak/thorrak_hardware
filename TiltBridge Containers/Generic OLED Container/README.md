# Generic "OLED" Container


The "Generic OLED" container was designed for a specific, previously common generic OLED board where the OLED is not mounted to a plate but is simply "taped" to a blank space on the PCB. These boards generally have different length rows of pin headers, with the longer row having 16 pins and the shorter row 10.


NOTE: Due to the variable build quality of these boards, these are NOT recommended for new builds unless they're all you have available

This container design secures the PCB in place through the use of printed standoffs, and secures the lid to the case base through the use of four screws & square nuts.



## Case Design Files

| Design                                        | Description                       |
| --------------------------------------------- | --------------------------------- |
| [Case Base STL](OLED%20Case%20Base.stl)       | 3D Printable Case File (STL)      |
| [Case Lid STL](OLED%20Case%20Lid.stl)         | 3D Printable Case Lid File (STL)  |
| [Case Base OpenSCAD](OLED%20Case%20Base.scad) | OpenSCAD Design for Box Base      |
| [Case Lid OpenSCAD](OLED%20Case%20Lid.scad)   | OpenSCAD Design for Box Lid       |


### Case Lid Note

Unfortunately, the build quality on this PCB design is *extremely* poor, and virtualy no two PCBs have the OLED screen affixed in the same place. You will almost certainly have to edit the design in order to align the LCD hole to its position on your board. 

To do this, download the Case Lid OpenSCAD design linked above, open this file in OpenSCAD, and adjust the placement of the lid hole on line 4. The current placement is 8.6, but can range anywhere from 3.0 to 13.0.


## Bill of Materials

- 1x Generic OLED Board
- 4x M3 Square Nuts
- 4x M3 x 12mm Bolts


## Assembly Instructions

#. After printing the case, ensure the screw holes and holes for the nuts are clear of obstructions
#. Insert the PCB into the case with the USB port facing the hole on the side
#. Align the case lid with the top of the case, fitting the hole in the lid over the ESP32 casing on the PCB
#. Insert the 4x square nuts into the rectangular holes on the front and back of the case 
#. Insert the 4x screws through the circular holes on the top of the case and screw into the nuts until the screws are fully inserted into the case



