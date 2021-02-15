# Heltec Container


The Heltec style board is becoming increasingly popular, and tends to have a higher build quality than other OLED boards (especially if purchased directly from Heltec). These boards have the OLED screen mounted to a plastic plate on the front of the board, which is secured to the back of the board with four screws. 

This container design secures the PCB in place through the use of printed standoffs, and secures the lid to the case base through the use of four screws & square nuts.



## Case Design Files

| Design                                     | Description                       |
| ------------------------------------------ | --------------------------------- |
| [Box Base STL](LCD%20Box%20Base.stl)       | 3D Printable Case File (STL)      |
| [Box Lid STL](LCD%20Box%20Lid.stl)         | 3D Printable Case Lid File (STL)  |
| [Box Base OpenSCAD](LCD%20Box%20Base.scad) | OpenSCAD Design for Box Base      |
| [Box Lid OpenSCAD](LCD%20Box%20Lid.scad)   | OpenSCAD Design for Box Lid       |


### Case Lid Note

Unfortunately, there are a handful of manufacturers of this PCB with varying degrees of quality control at each. Although the OLED screens tend to be mounted "square" with the sides of the plastic mounting table, they can be shifted up or down on the table causing the lid design linked above to not always perfectly align with the viewing area of the screen.

If you need to adjust the placement of the hole for the OLED to match your screen, download the Box Lid OpenSCAD design linked above, open the file in OpenSCAD, and adjust the placement of the lid hole on line 32. Currently, this line reads `translate([19.2, 3.8, -wall_thickness-0.1]) cube([23.8,13.6,wall_thickness*2]);` where the second parameter of the translate call - `3.8` is the offset for the screen hole. Decrease this offset to raise the hole on the front of the case and increase this offset to lower the hole. 


## Bill of Materials

- 1x Heltec-style OLED Board
- 4x M3 Square Nuts
- 4x M3 x 12mm Bolts


## Assembly Instructions

#. After printing the case, ensure the screw holes and holes for the nuts are clear of obstructions
#. Insert the PCB into the case with the USB port facing the hole on the side
#. Insert the case lid through the top of the case, with the standoffs facing down towards the PCB. Align the hole in the front of the lid with the OLED screen
#. Insert the 4x square nuts into the rectangular holes on the front and back of the case 
#. Insert the 4x screws through the circular holes on the top of the case and screw into the nuts until the screws are fully inserted into the case

