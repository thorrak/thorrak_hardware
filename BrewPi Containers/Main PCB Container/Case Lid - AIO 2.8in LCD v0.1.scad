wall_thickness = 1.8;
case_depth = 135;
case_width = 140;
case_height = 60;



// All holes/openings should be offset from hole 1, at 0,0
lcd_hole_1_x = 0;
lcd_hole_1_y = 0;

lcd_hole_2_x = 86-3-6.92+0.4; // Moving 0.4 right
lcd_hole_2_y = lcd_hole_1_y;

lcd_hole_3_x = lcd_hole_1_x;
lcd_hole_3_y = 50-3-3;

lcd_hole_4_x = lcd_hole_2_x;
lcd_hole_4_y = lcd_hole_3_y;

lcd_hole_radius = 1.8;

lcd_opening_x = 2.25;
lcd_opening_y = -3.3;
lcd_opening_x_length = 70.2 + 0.6;  // Moving 0.6 out
lcd_opening_y_length = 50.6;

offset_visual_x = -lcd_opening_x-lcd_opening_x_length/2+case_width/2;
offset_visual_y = case_depth/3*2-lcd_opening_y_length/2;


module lcd_holes() {
    translate([lcd_hole_1_x, lcd_hole_1_y, 0]) cylinder(h=wall_thickness*3, r=lcd_hole_radius, center=true, $fn=30);
    translate([lcd_hole_2_x, lcd_hole_2_y, 0]) cylinder(h=wall_thickness*3, r=lcd_hole_radius, center=true, $fn=30);
    translate([lcd_hole_3_x, lcd_hole_3_y, 0]) cylinder(h=wall_thickness*3, r=lcd_hole_radius, center=true, $fn=30);
    translate([lcd_hole_4_x, lcd_hole_4_y, 0]) cylinder(h=wall_thickness*3, r=lcd_hole_radius, center=true, $fn=30);
    translate([lcd_opening_x, lcd_opening_y, -1]) cube([lcd_opening_x_length, lcd_opening_y_length, wall_thickness*3]);
}


module captive_square_nut_post(post_top_at, attached_wall_thickness, rotation=0, holes_only=0) {
    nut_width = 5.5;
    nut_height = 2.5;

    nut_post_width = nut_width + 3.6;

    nut_hole_height = nut_height + 0.8;
    nut_hole_width = nut_width + 1;
    nut_hole_depth = (nut_post_width-nut_width)/2 + nut_width + 0.6;

    nut_hole_from_top_of_post = 2;

    screw_radius = 1.8;
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




top_of_post = 0;


difference() {
    cube([case_width, case_depth, wall_thickness]);


    // Front left nut hole
    #translate([wall_thickness, wall_thickness+4, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=270, holes_only=1);
    // Back left nut hole    
    #translate([wall_thickness, case_depth-wall_thickness-8.5, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=270, holes_only=1);


    // Front right nut hole
    translate([case_width-wall_thickness-8.5, wall_thickness+4, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=90, holes_only=1);
    // Back right nut hole    
    translate([case_width-wall_thickness-8.5, case_depth-wall_thickness-8.5, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=90, holes_only=1);
    
    #translate([offset_visual_x, offset_visual_y, 0]) lcd_holes();
}

// Alignment ridge
translate([wall_thickness+0.3,2,wall_thickness]) cube([case_width-2*wall_thickness-0.6, 1.6, 1.4]);