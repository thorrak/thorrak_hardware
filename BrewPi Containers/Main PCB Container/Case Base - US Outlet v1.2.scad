wall_thickness = 3;
case_depth = 135;
case_width = 140;
case_height = 72;

hole_radius = 2;

lid_height = 5;
tab_width = 20; // The width of the tabs on the lid


screw_radius = (2.8 / 2);
screw_length = ((15 - 5) / 2);


/*---------------------Parameters (for wall plate)---------------------*/
 
plate_width             = 114.3/2+6;
plate_height            = 114.3-1.5;
plate_thickness         = wall_thickness+.02;




module add_vent_holes (panel_width, panel_height, gutter_width, gutter_height, hole_radius, hole_spacing, hole_length) {
    main_row_holes = floor((panel_width - (2 * gutter_width))  / (hole_spacing + (hole_radius * 2)));
    rows = floor((panel_height - (2 * gutter_height)) / (hole_spacing + (hole_radius * 2)));

    for (n = [0:rows]) {
        for (i = [0:main_row_holes]) {
            // If we're on a "main row", then we put holes across the panel
            if (n % 2 == 0)
                translate([-1,(i*(hole_radius*2 + hole_spacing))+gutter_width,(n*(hole_radius*2 + hole_spacing))+gutter_height]) rotate([0,90,0]) cylinder(h=hole_length+2, r=hole_radius);

            // If we're on an "off row" then we offset the holes, and drop one
            if (n % 2 == 1)
                if (i != main_row_holes) // This drops the hole
                    translate([-1,(i*(hole_radius*2 + hole_spacing))+gutter_width+((hole_radius*2 + hole_spacing)/2),(n*(hole_radius*2 + hole_spacing))+gutter_height]) rotate([0,90,0]) cylinder(h=hole_length+2, r=hole_radius);
        }
    }
}

module make_screw_triangle(screw_radius, screw_length) {
    post_width = (2 * 4) + 1;
    length = screw_length;

    difference() {
        difference() {
            cube([post_width*2, post_width*2, length]);
            translate([post_width*2+0.5,-0.5,-1]) rotate([0,0,45]) cube([post_width*3, post_width*3, length*3]);
        }
        translate([post_width/2,post_width/2,length/2]) cylinder(h = (length+2), r = screw_radius, center=true);
    }
}

module make_screw_post(screw_radius, screw_length) {
    post_width = (screw_radius * 4) + 1;
    length = screw_length;

    difference() {
        cube([post_width, post_width, length]);
        translate([post_width/2,post_width/2,length/2]) cylinder(h = (length+2), r1 = screw_radius, r2 = screw_radius, center=true);
    }
}

module iec_320 () {
    {
        // This is the hole
        translate([0,-10,5]) difference() {
            cube([20,20,30]);
            // The notches
            {
                // Bottom notch
                translate([-sqrt(2*6*6)/2,0,0]) rotate([0,45,0]) translate([0,-1,0]) cube([6,22,6]);
                // Top Notch
                translate([-sqrt(2*6*6)/2,0,30]) rotate([0,45,0]) translate([0,-1,0]) cube([6,22,6]);
            }
        }    
        // And these are the screw posts
        translate([10,0,0]) {
            rotate([90,0,0]) cylinder(h = (20), r1 = 2, r2 = 2, center=true);
            translate([0,0,40]) rotate([90,0,0]) cylinder(h = (20), r1 = 2, r2 = 2, center=true);
        }
    }
}


module bx_6b() {
    difference() {
        cube([26,10,24]);
        {
            translate([-1,-1,-1]) cube([9,12,4]);
            translate([18,-1,-1]) cube([9,12,4]);
        }
    }
    translate([-1,2,4]) cube([1.2,2,15]);
    translate([25.8,2,4]) cube([1.4,2,15]); // Some weird clipping thing...
}


module make_relay_post_array(post_height,holes_only=0) {
    relay_post_width = 32.9;
    relay_post_depth = 44.2;

    module make_post(post_height, holes_only) {
        if (holes_only==0) {
            translate([0,0,post_height/2]) difference() {
                cube([5,5,post_height], center=true);
                cylinder(h=post_height+1, r=2, center=true);
            }
        } else {
            translate([0,0,post_height/2]) cylinder(h=post_height+1, r=2, center=true);
        }
    }

    module make_pos_post(post_height, holes_only) {
        if(holes_only==0) {
            translate([0,0,post_height/2]) {
                cube([5,5,post_height], center=true);
                translate([0,0,5/2]) cylinder(h=post_height+5, r=1.1, center=true, $fn=10);
            }
        }
    }


    translate([0,0,0]) make_post(post_height, holes_only);
    translate([relay_post_width,0,0]) make_post(post_height, holes_only);
    translate([0,relay_post_depth,0]) make_post(post_height, holes_only);
    translate([relay_post_width,relay_post_depth,0]) make_post(post_height, holes_only);
}

module make_power_post_array(post_height,holes_only=0) {
//    relay_post_width = 55.5;
    relay_post_width = 60;
    relay_post_depth = 23.7;

    module make_post(post_height, holes_only) {
        if (holes_only==0) {
            translate([0,0,post_height/2]) difference() {
                cube([5,5,post_height], center=true);
                cylinder(h=post_height+1, r=2, center=true);
            }
        } else {
            translate([0,0,post_height/2]) cylinder(h=post_height+1, r=2, center=true);
        }
    }

    module make_pos_post(post_height, holes_only) {
        if(holes_only==0) {
            translate([0,0,post_height/2]) {
                cube([5,5,post_height], center=true);
                translate([0,0,5/2]) cylinder(h=post_height+5, r=1.1, center=true, $fn=10);
            }
        }
    }


    translate([0,0,0]) make_post(post_height, holes_only);
    translate([relay_post_width,0,0]) make_post(post_height, holes_only);
    translate([0,relay_post_depth,0]) make_post(post_height, holes_only);
    translate([relay_post_width,relay_post_depth,0]) make_post(post_height, holes_only);
}

module make_esp_post_array(post_height,holes_only=0) {

    esp_board_1_x_offset = 30.7;
    esp_board_1_y_offset = 6;

    esp_board_2_x_offset = 5;
    esp_board_2_y_offset = 41;
    
    esp_board_3_x_offset = esp_board_1_x_offset;
    esp_board_3_y_offset = esp_board_1_y_offset + 40.64;
    
    module make_post(post_height, holes_only) {
        if (holes_only==0) {
            translate([0,0,post_height/2]) difference() {
                cube([5,5,post_height], center=true);
                cylinder(h=post_height+1, r=2, center=true);
            }
        } else {
            translate([0,0,post_height/2]) cylinder(h=post_height+1, r=2, center=true);
        }
    }

    module make_pos_post(post_height, holes_only) {
        if(holes_only==0) {
            translate([0,0,post_height/2]) {
                cube([5,5,post_height], center=true);
                translate([0,0,5/2]) cylinder(h=post_height+5, r=1.1, center=true, $fn=10);
            }
        }
    }


    // These are the actual posts
    translate([esp_board_1_x_offset,esp_board_1_y_offset,0]) make_post(post_height, holes_only);
    translate([esp_board_2_x_offset,esp_board_2_y_offset,0]) make_post(post_height, holes_only);
    translate([esp_board_3_x_offset,esp_board_3_y_offset,0]) make_post(post_height, holes_only);

//    translate([0,relay_post_depth,0]) make_post(post_height, holes_only);
//    translate([relay_post_width,relay_post_depth,0]) make_post(post_height, holes_only);
}





// Left/Right Walls
// These are the main two walls
difference() {
    for (x = [0, case_width-wall_thickness]) {    
        translate([x,0,0]) cube([wall_thickness,case_depth,case_height]);
    }
    add_vent_holes(case_depth, case_height, max(floor(case_depth*.2/2),wall_thickness*6), max(floor(case_height*.2/2),wall_thickness*5), hole_radius, hole_radius * 2, case_width+2);
}




// Now, add the screw triangles
post_width = (screw_radius * 4) + 1;

translate([wall_thickness,case_depth-wall_thickness,case_height-lid_height-screw_length]) mirror([0,1,0]) make_screw_triangle(screw_radius, screw_length);
translate([case_width-wall_thickness,case_depth-wall_thickness,case_height-lid_height-screw_length]) mirror([1,1,0]) make_screw_triangle(screw_radius, screw_length);


// Now for the front of the case
difference() {
difference() {
    // This is the actual wall on the front
    cube([case_width,wall_thickness,case_height]);
    
    // These are the holes
    {
        translate([wall_thickness,0,wall_thickness]) {
            // BX-6B Hole
            // The weird rotate/translate thing is so I can invert the plug
//            translate([0,-1,(50-24)/2-3]) translate([26,0,24]) rotate([0,180,0]) bx_6b();
//            translate([38,-1,(50-24)/2-3]) translate([26,0,24]) rotate([0,180,0]) bx_6b();

            translate([(plate_height),0,8]) iec_320();
        }
        translate([wall_thickness+10,-1,case_height-lid_height]) cube([tab_width,wall_thickness+2,lid_height/2+.2]);
        translate([case_width-wall_thickness-10-tab_width,-1,case_height-lid_height]) cube([tab_width,wall_thickness+2,lid_height/2+.2]);
    }
}
            translate([plate_height/2+plate_thickness,plate_thickness/2-.01,plate_width/2]) rotate([0,90,-90]) round_utility_box_cover(plate_width,plate_height,plate_thickness);
}

// Now add the mounting posts for the relay board itself
post_height=6;
translate([35+wall_thickness + 10,40+33+5,wall_thickness]) make_relay_post_array(post_height);
translate([10+wall_thickness,40+33+3+5+32,wall_thickness]) rotate([0,0,-90]) make_power_post_array(post_height);
translate([case_width-48, case_depth-41-wall_thickness, wall_thickness]) translate([42,41,0]) rotate([0,0,180]) make_esp_post_array(post_height);


// Back Wall

difference() {
    translate([0,case_depth-wall_thickness,0]) cube([case_width, wall_thickness, case_height-lid_height]);
    // Basically we're just going to carve out the back wall here
    translate([case_width-42-wall_thickness*2-1,case_depth-1-wall_thickness,wall_thickness+post_height-0.2+4+6]) cube([18+wall_thickness,2+wall_thickness,9.5]);
    #translate([case_width-18-wall_thickness*2-1,case_depth-1-wall_thickness,wall_thickness+post_height-0.2]) cube([17+wall_thickness,2+wall_thickness,15.5]);
}




// Base
difference () {
    cube([case_width, case_depth, wall_thickness]);
    {
        translate([35+wall_thickness + 10,40+33+5,-1]) make_relay_post_array(post_height=post_height*2, holes_only=1);;
        translate([10+wall_thickness,40+33+3+5+32,-1]) rotate([0,0,-90]) make_power_post_array(post_height=post_height*2,holes_only=1);
        translate([case_width-48, case_depth-41-wall_thickness, -1]) translate([42,41,0]) rotate([0,0,180]) make_esp_post_array(post_height=post_height*2,holes_only=1);
    }
}





// Credit - http://openscad.diy3dtech.com/tag/3d-printed-outlet-cover/
/* 
*  Open SCAD Name.: Rounded Cover
*  Copyright (c)..: 2016 www.DIY3DTech.com
*
*  Creation Date..:04/15/2016
*  Discription....: Dual utility box cover
*
*  Rev 1: Developed Model
*  Rev 2:
*
*  This program is free software; you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation; either version 2 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  If used commercially attribution is required (OpenSCAD.DIY3DTech.com)
*
*/ 
 
/*------------------Customizer View-------------------*/
 
// None
 
 
/*-----------------------Execute----------------------*/

//translate([plate_height/2+plate_thickness,plate_thickness/2+plate_thickness-.01,plate_width/2]) rotate([0,90,-90]) round_utility_box_cover(plate_width,plate_height,plate_thickness);
/*-----------------------Modules----------------------*/
 
module round_utility_box_cover(plate_width,plate_height,plate_thickness, negative=1){
    module round_outlet(plate_thickness){
        
        difference(){
        // To create the offset to clip top and bottom of the circle
        // the offset has to include half of the clip itself or
        // in other words  (3.175/2)
            
        //create circle (34.2mm dia) for main body of socket  
            translate ([0,0,0]) cylinder(plate_thickness+2,(34.95/2),(34.95/2),$fn=60,center=true);
        //nip off top corner to create outlet shape
            translate ([0,(28.8/2)+(3.175/2),0]) cube([34.925,3.4,plate_thickness+2],center=true);
        //nip off bottom corner to create outlet shape
            translate ([0,-(28.8/2)-(3.175/2),0]) cube([34.925,3.4,plate_thickness+2],center=true);
        }//end differance
        
    }//end module round_outlet()

//

    if(negative == 0) {
        difference(){
            cube([plate_width,plate_height,plate_thickness],center=true);
            
        // socket assembly
            //top left socket
            translate([0,-19.25,0]) round_outlet(plate_thickness);
            //left outlet screw hole
            translate ([0,0,0]) cylinder(plate_thickness+2,1.6,3.3,$fn=60,center=true);
            //bottom left socket
            translate([0,19.25,0]) round_outlet(plate_thickness);
        }//end difference
    } else {
        //top left socket
        translate([0,-19.25,0]) round_outlet(plate_thickness);
        //center screw hole
        translate ([0,0,0]) cylinder(plate_thickness+2,1.6,3.3,$fn=60,center=true);
        //bottom left socket
        translate([0,19.25,0]) round_outlet(plate_thickness);
        
        // left & right screw holes
        translate ([0,-83.38/2,0]) cylinder(plate_thickness+2,1.6,3.3,$fn=60,center=true);
        translate ([0,83.38/2,0]) cylinder(plate_thickness+2,1.6,3.3,$fn=60,center=true);

        
    }
}//end module round_utility_box_cover()
 
/*----------------------End Code----------------------*/