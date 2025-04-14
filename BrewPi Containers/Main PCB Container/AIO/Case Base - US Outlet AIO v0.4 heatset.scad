wall_thickness = 2.5;
case_depth = 135;
case_width = 140-8;
case_height = 60;

hole_radius = 2;

tab_width = 20; // The width of the tabs on the lid


screw_radius = (2.8 / 2);
screw_length = ((15 - 5) / 2);


/*---------------------Parameters (for wall plate)---------------------*/
 
plate_width             = 114.3/2+6;
plate_height            = 114.3-1.5;
plate_thickness         = wall_thickness+.02;




module iec_320 () {
    {
        // This is the hole
        translate([0,-1, 5.25]) difference() {
            cube([19.4, wall_thickness*2, 29.5]);
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
            rotate([90,0,0]) cylinder(h = (20+wall_thickness), r = 2, center=true);
            translate([0,0,40]) rotate([90,0,0]) cylinder(h = (20+wall_thickness), r = 2, center=true);
        }
    }
}


// Heatset insert & Post options
heatset_insert_height = 6;
heatset_insert_hole_diameter = 4.2;
heatset_insert_screw_diameter = 3;
screw_space_below_heatset = 0.2;
post_height=heatset_insert_height + screw_space_below_heatset;
post_radius = heatset_insert_hole_diameter/2+2.3;


module make_esp_post_array(post_height) {

    esp_universal_x = 0;
    esp_universal_y = 0;

    esp_board_1_x_offset = 0 + esp_universal_x;
    esp_board_1_y_offset = 0 + esp_universal_y;

    esp_board_2_x_offset = 57.15 + esp_universal_x;
    esp_board_2_y_offset = esp_board_1_y_offset;
    
    esp_board_3_x_offset = esp_board_1_x_offset;
    esp_board_3_y_offset = 69.22 + esp_universal_y;
    
    esp_board_4_x_offset = 52.71 + esp_universal_x;
    esp_board_4_y_offset = esp_board_3_y_offset;
    
    
    module make_post(post_height) {
        translate([0,0,post_height/2]) difference() {
            // Outer Post
            cylinder(h=post_height, r=post_radius, center=true, $fn=20);
            // Heatset Insert Hole
            translate([0,0,(post_height-heatset_insert_height)/2]) cylinder(h=heatset_insert_height+0.01, r=heatset_insert_hole_diameter/2, center=true, $fn=20);
            //cylinder(h=post_height+0.01, r=heatset_insert_screw_diameter/2, center=true, $fn=20);
        }
    }


    // These are the actual posts
    translate([esp_board_1_x_offset,esp_board_1_y_offset,0]) make_post(post_height);
    translate([esp_board_2_x_offset,esp_board_2_y_offset,0]) make_post(post_height);
    translate([esp_board_3_x_offset,esp_board_3_y_offset,0]) make_post(post_height);
    translate([esp_board_4_x_offset,esp_board_4_y_offset,0]) make_post(post_height);
}




module angle_base_post(angled_height, width, flat_height) {
    difference() {
        cube([angled_height, width, angled_height]);
        translate([-0.01,-0.01,-0.01]) rotate([0,45,0]) cube([angled_height+0.02, width+0.02, angled_height*2]);
    }
    translate([0,0,angled_height]) cube([angled_height, width, flat_height]);
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


// Front top support "ridge"
translate([case_width-nut_post_width-wall_thickness+0.6, wall_thickness, case_height-2*wall_thickness-1]) rotate([0,0,90]) angle_base_post(wall_thickness, (case_width-(nut_post_width*2)-(wall_thickness*2)+0.6), wall_thickness+1);


top_of_post = case_height;




// Left/Right Walls
// These are the main two walls

translate([0,0,0]) cube([wall_thickness,case_depth,case_height]);

// This is the front post
translate([wall_thickness, wall_thickness+0, 0]) lid_post(top_of_post, wall_thickness, rotation=270);
// This is the back post
translate([wall_thickness, case_depth-wall_thickness-8.5, 0]) lid_post(top_of_post, wall_thickness, rotation=270);

// Wall support posts
translate([wall_thickness, (case_depth/3*1-(wall_thickness/2)), 0]) cube([wall_thickness, wall_thickness, max(0, case_height-10)]);
translate([wall_thickness, (case_depth/3*2-(wall_thickness/2)), 0]) cube([wall_thickness, wall_thickness, max(0, case_height-10)]);


// Right Wall
translate([case_width-wall_thickness,0,0]) cube([wall_thickness,case_depth,case_height]);


// This is the front post
translate([case_width-wall_thickness-8.5, wall_thickness+0, 0]) lid_post(top_of_post, wall_thickness, rotation=90);
// This is the back post
translate([case_width-wall_thickness-8.5, case_depth-wall_thickness-8.0, 0]) lid_post(top_of_post, wall_thickness, rotation=90);

// Wall support posts
translate([case_width-wall_thickness*2, (case_depth/3*1-(wall_thickness/2)), 0]) cube([wall_thickness, wall_thickness, max(0, case_height-10)]);
translate([case_width-wall_thickness*2, (case_depth/3*2-(wall_thickness/2)), 0]) cube([wall_thickness, wall_thickness, max(0, case_height-10)]);





// Now, add the screw triangles
//post_width = (screw_radius * 4) + 1;


// Now for the front of the case
difference() {
    // This is the actual wall on the front
    cube([case_width,wall_thickness,case_height]);
    
    // These are the holes
    {
        iec_offset = wall_thickness + 2 + 4;
        iec_width = 19.4;
        
        translate([iec_offset, 0, wall_thickness+8]) iec_320();
        
        
        translate([iec_offset+iec_width+plate_height/2+0.5-6, plate_thickness/2-.01, plate_width/2+wall_thickness-3]) rotate([0,90,-90]) round_utility_box_cover(plate_width,plate_height,plate_thickness);
        
    }
}


x_shift = -12;

// Now add the mounting posts for the PCB itself
// Post height & heatset insert options are above make_esp_post_array
translate([5.4+wall_thickness+30+x_shift, case_depth-wall_thickness-69.22-5.08-1, wall_thickness]) make_esp_post_array(post_height);


// Back Wall

difference() {
    translate([0,case_depth-wall_thickness,0]) cube([case_width, wall_thickness, case_height]);
    
    // Basically we're just going to carve out the back wall here
    // USB Hole
    translate([5.4+wall_thickness+30+57.8-1+5-1.5+x_shift, case_depth-1-wall_thickness, wall_thickness+post_height-0.2+4+6+1+0.6]) cube([14.5+wall_thickness,2+wall_thickness,8.4]);

    // RJ-45 Jack Hole
    translate([5.4+wall_thickness+30+32.7-1-4-.3+x_shift, case_depth-1-wall_thickness, wall_thickness+post_height+1]) cube([16.2, 2+wall_thickness, 15-0.6]);
}




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
