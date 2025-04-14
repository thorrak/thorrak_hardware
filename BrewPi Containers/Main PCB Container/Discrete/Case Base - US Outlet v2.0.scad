wall_thickness = 2.5;
case_depth = 135;
case_width = 140;
case_height = 66;

hole_radius = 2;

lid_height = 5;
tab_width = 20; // The width of the tabs on the lid


screw_radius = (2.8 / 2);
screw_length = ((15 - 5) / 2);


/*---------------------Parameters (for wall plate)---------------------*/
 
plate_width             = 114.3/2+6;
plate_height            = 114.3-1.5;
plate_thickness         = wall_thickness+.02;


// Heatset insert & Post options
heatset_insert_height = 6;
heatset_insert_hole_diameter = 4.2;
heatset_insert_screw_diameter = 3;
screw_space_below_heatset = 0.2;
post_height=heatset_insert_height + screw_space_below_heatset;
post_radius = heatset_insert_hole_diameter/2+2.3;
peg_height = 3;
peg_diameter = heatset_insert_screw_diameter-0.6;



module make_hs_post(post_height, hole_not_peg=true) {
    translate([0,0,post_height/2]) difference() {
        // Outer Post
        cylinder(h=post_height, r=post_radius, center=true, $fn=30);
        // Heatset Insert Hole
        if(hole_not_peg)
            translate([0,0,(post_height-heatset_insert_height)/2]) cylinder(h=heatset_insert_height+0.01, r=heatset_insert_hole_diameter/2, center=true, $fn=30);
        //cylinder(h=post_height+0.01, r=heatset_insert_screw_diameter/2, center=true, $fn=20);
    }
    
    // If we're making a peg (not a hole) then add the peg here. Note that the radius is different
    if(!hole_not_peg) translate([0,0,heatset_insert_height-0.01+(peg_height/2)]) cylinder(h=peg_height+0.01, r=peg_diameter/2, center=true, $fn=30);
}


// Define this here as we need to know it for the support ridge
nut_post_width = 5.5 + 3.6;

module lid_post(post_top_at, attached_wall_thickness, rotation=0) {
    screw_radius = 1.6;
    screw_hole_length = 7;

    nut_post_height = screw_hole_length + nut_post_width + 1;

    module make_nut_post_holes() {
        // The screw hole
        translate([nut_post_width/2,nut_post_width/2,screw_hole_length]) cylinder(r=screw_radius, h=nut_post_height+2, $fn=30);
        
        // Heat set insert hole
        translate([nut_post_width/2,nut_post_width/2,nut_post_height-heatset_insert_height+0.01]) cylinder(h=heatset_insert_height+0.01, r=heatset_insert_hole_diameter/2, $fn=30);

    }

    module make_post() {
        // This makes the rotateable post/holes
        difference() {
            // The post itself
            cube([nut_post_width, nut_post_width, nut_post_height]);
            // The nut post holes (nut hole, screw hole)
            make_nut_post_holes();
            // The cut to make the post 45 degrees
            rotate([-45,0,0]) translate([-0.05,-0.05,0]) cube([nut_post_width+.1, nut_post_width+.1, nut_post_height]);
        }
        
    }

    translate([nut_post_width/2, nut_post_width/2, (post_top_at-nut_post_height)]) rotate([0, 0, rotation]) translate([-nut_post_width/2, -nut_post_width/2, 0]) make_post();
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


module make_relay_post_array(post_height) {
    relay_post_width = 32.9;
    relay_post_depth = 44.2;

    translate([0,0,0]) make_hs_post(post_height);
    translate([relay_post_width,0,0]) make_hs_post(post_height);
    translate([0,relay_post_depth,0]) make_hs_post(post_height);
    translate([relay_post_width,relay_post_depth,0]) make_hs_post(post_height);
}

module make_power_post_array(post_height,holes_only=0) {
//    relay_post_width = 55.5;
    relay_post_width = 60;
    relay_post_depth = 23.7;

    translate([0,0,0]) make_hs_post(post_height);
    translate([relay_post_width,0,0]) make_hs_post(post_height);
    translate([0,relay_post_depth,0]) make_hs_post(post_height);
    translate([relay_post_width,relay_post_depth,0]) make_hs_post(post_height);
}

module make_esp_post_array(post_height) {
    esp_board_1_x_offset = 30.7;
    esp_board_1_y_offset = 6;

    esp_board_2_x_offset = 5;
    esp_board_2_y_offset = 41;
    
    esp_board_3_x_offset = esp_board_1_x_offset;
    esp_board_3_y_offset = esp_board_1_y_offset + 40.64;
    

    // These are the actual posts
    translate([esp_board_1_x_offset,esp_board_1_y_offset,0]) make_hs_post(post_height, true);
    translate([esp_board_2_x_offset,esp_board_2_y_offset,0]) make_hs_post(post_height, true);
    translate([esp_board_3_x_offset,esp_board_3_y_offset,0]) make_hs_post(post_height, true);
}




// Left/Right Walls
// These are the main two walls
for (x = [0, case_width-wall_thickness]) {    
    translate([x,0,0]) cube([wall_thickness,case_depth,case_height]);
}


// Now for the front of the case
difference() {
difference() {
    // This is the actual wall on the front
    cube([case_width,wall_thickness,case_height]);
    
    // BX-6B Hole
    translate([wall_thickness,0,wall_thickness]) translate([(plate_height),0,8]) iec_320();
}
            translate([plate_height/2+plate_thickness,plate_thickness/2-.01,plate_width/2]) rotate([0,90,-90]) round_utility_box_cover(plate_width,plate_height,plate_thickness);
}

// Now add the mounting posts for the relay board itself
//post_height=6;
translate([35+wall_thickness + 10,40+33+5,wall_thickness]) make_relay_post_array(post_height);
translate([10+wall_thickness,40+33+3+5+32,wall_thickness]) rotate([0,0,-90]) make_power_post_array(post_height);
translate([case_width-48, case_depth-41-wall_thickness, wall_thickness]) translate([42,41,0]) rotate([0,0,180]) make_esp_post_array(post_height);


// Back Wall

difference() {
    translate([0,case_depth-wall_thickness,0]) cube([case_width, wall_thickness, case_height]);
    // Basically we're just going to carve out the back wall here
    translate([case_width-42-wall_thickness*2-1,case_depth-1-wall_thickness,wall_thickness+post_height-0.2+4+6]) cube([18+wall_thickness,2+wall_thickness,9.5]);
    translate([case_width-18-wall_thickness*2-1,case_depth-1-wall_thickness,wall_thickness+post_height-0.2]) cube([17+wall_thickness,2+wall_thickness,15.5]);
}

top_of_post = case_height;


// This is the front post
translate([wall_thickness, wall_thickness+0, 0]) lid_post(top_of_post, wall_thickness, rotation=270);
// This is the back post
translate([wall_thickness, case_depth-wall_thickness-8.5, 0]) lid_post(top_of_post, wall_thickness, rotation=270);


// This is the front post
translate([case_width-wall_thickness-8.5, wall_thickness+0, 0]) lid_post(top_of_post, wall_thickness, rotation=90);
// This is the back post
translate([case_width-wall_thickness-8.5, case_depth-wall_thickness-8.0, 0]) lid_post(top_of_post, wall_thickness, rotation=90);


// Base
cube([case_width, case_depth, wall_thickness]);




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
