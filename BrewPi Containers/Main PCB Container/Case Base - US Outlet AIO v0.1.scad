wall_thickness = 1.6;
case_depth = 135;
case_width = 140;
case_height = 60;

hole_radius = 2;

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



module make_esp_post_array(post_height,holes_only=0) {

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
    
    module make_post(post_height, holes_only) {
        if (holes_only==0) {
            translate([0,0,post_height/2]) difference() {
                //cube([5,5,post_height], center=true);
                cylinder(h=post_height, r=4.2, center=true);
                cylinder(h=post_height+1, r=2, center=true);
            }
        } else {
            translate([0,0,post_height/2]) cylinder(h=post_height+1, r=2, center=true);
            translate([0,0,-(wall_thickness+3)/2+3.5]) cylinder(h=wall_thickness+3, r=3.7, center=true);
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
    translate([esp_board_4_x_offset,esp_board_4_y_offset,0]) make_post(post_height, holes_only);

//    translate([0,relay_post_depth,0]) make_post(post_height, holes_only);
//    translate([relay_post_width,relay_post_depth,0]) make_post(post_height, holes_only);
}







module captive_square_nut_post(post_top_at, attached_wall_thickness, rotation=0, holes_only=0) {
    nut_width = 5.5;
    nut_height = 2.5;

    nut_post_width = nut_width + 3.6;

    nut_hole_height = nut_height + 0.8;
    nut_hole_width = nut_width + 1;
    nut_hole_depth = (nut_post_width-nut_width)/2 + nut_width + 0.6;

    nut_hole_from_top_of_post = 2;

    screw_radius = 2;
    captive_screw_length = 12;


    nut_post_height = nut_hole_from_top_of_post*2 + nut_hole_height + (nut_post_width) + max(0, captive_screw_length - (nut_hole_from_top_of_post*2 + nut_hole_height ));  // This needs to change


    module make_nut_post_holes() {
        // The nut hole        
        translate([(nut_post_width-nut_hole_width)/2,-0.1-attached_wall_thickness,(nut_post_height-nut_hole_from_top_of_post-nut_hole_height )]) cube([nut_hole_width, nut_hole_depth+attached_wall_thickness+0.1, nut_hole_height]);
        
        // The screw hole
        translate([nut_post_width/2,nut_post_width/2,7]) cylinder(r=screw_radius, h=nut_post_height+2, $fn=30);
    }


    module make_post(holes_only=0) {
        // This makes the rotateable post/holes
        if(holes_only == 0) {        
            difference() {
                // The post itself
                cube([nut_post_width, nut_post_width, nut_post_height]);
                // The nut post holes (nut hole, screw hole)
                make_nut_post_holes();
                // The cut to make the post 45 degrees
                rotate([-45,0,0]) translate([-0.05,-0.05,0]) cube([nut_post_width+.1, nut_post_width+.1, nut_post_height]);
            }
        } else {
            // JUST The nut post holes (nut hole, screw hole), but on the same orientation as the post
            make_nut_post_holes();        
        }    
    }




    translate([nut_post_width/2, nut_post_width/2, (post_top_at-nut_post_height)]) rotate([0, 0, rotation]) translate([-nut_post_width/2, -nut_post_width/2, 0]) make_post(holes_only);
}




top_of_post = case_height;



//difference() {
    // This is the "wall" - should be deleted when in use
  //  translate([-4,0,0]) cube([16.6, wall_thickness, 25]);
    // This is the nut hole
    //translate([0, wall_thickness, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=0, holes_only=1);
//}



// Left/Right Walls
// These are the main two walls
difference() {
    translate([0,0,0]) cube([wall_thickness,case_depth,case_height]);
    // Front nut hole
    translate([wall_thickness, wall_thickness+4, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=270, holes_only=1);
    // Back nut hole    
    translate([wall_thickness, case_depth-wall_thickness-8.5, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=270, holes_only=1);


}
// This is the front post
translate([wall_thickness, wall_thickness+4, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=270);
// This is the back post
translate([wall_thickness, case_depth-wall_thickness-8.5, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=270);



difference() {
    
    translate([case_width-wall_thickness,0,0]) cube([wall_thickness,case_depth,case_height]);
    // Front nut hole
    translate([case_width-wall_thickness-8.5, wall_thickness+4, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=90, holes_only=1);
    // Back nut hole    
    translate([case_width-wall_thickness-8.5, case_depth-wall_thickness-8.5, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=90, holes_only=1);
}
// This is the front post
translate([case_width-wall_thickness-8.5, wall_thickness+4, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=90);
// This is the back post
translate([case_width-wall_thickness-8.5, case_depth-wall_thickness-8.0, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=90);




// Now, add the screw triangles
//post_width = (screw_radius * 4) + 1;


// Now for the front of the case
difference() {
    // This is the actual wall on the front
    cube([case_width,wall_thickness,case_height]);
    
    // These are the holes
    {
        iec_offset = wall_thickness + 2;
        iec_width = 19.4;
        
        translate([iec_offset, 0, wall_thickness+8]) iec_320();
        translate([iec_offset+iec_width+plate_height/2+0.5, plate_thickness/2-.01, plate_width/2+wall_thickness-3]) rotate([0,90,-90]) round_utility_box_cover(plate_width,plate_height,plate_thickness);
        
    }
}

// Now add the mounting posts for the PCB itself
post_height=6;

translate([5.4+wall_thickness+30, case_depth-wall_thickness-69.22-5.08-1, wall_thickness]) make_esp_post_array(post_height);


// Back Wall

difference() {
    translate([0,case_depth-wall_thickness,0]) cube([case_width, wall_thickness, case_height]);
    
    // Basically we're just going to carve out the back wall here
    // USB Hole
    #translate([5.4+wall_thickness+30+57.8-1+5-1.5, case_depth-1-wall_thickness, wall_thickness+post_height-0.2+4+6+1+0.6]) cube([14.5+wall_thickness,2+wall_thickness,8.4]);

    // RJ-45 Jack Hole
    translate([5.4+wall_thickness+30+32.7-1-4-.1, case_depth-1-wall_thickness, wall_thickness+post_height]) cube([16, 2+wall_thickness, 15]);
}




// Base
difference () {
    cube([case_width, case_depth, wall_thickness]);
    {
        translate([5.4+wall_thickness+30, case_depth-wall_thickness-69.22-5.08-1, -1]) make_esp_post_array(post_height=post_height*2,holes_only=1);
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