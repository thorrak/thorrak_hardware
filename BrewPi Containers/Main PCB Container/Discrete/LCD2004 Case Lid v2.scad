wall_thickness = 2.5;
case_depth = 135;
case_width = 140;
case_height = 66;

hole_radius = 2;

lid_height = 5;
tab_width = 20; // The width of the tabs on the lid

wall_tolerance = 1;
tab_tolerance = .8;

screw_radius = (4 / 2);
screw_length = ((15 - 5) / 2);



LCD2004_BOARD_WIDTH = 98;
LCD2004_BOARD_HEIGHT = 60;
module LCD2004() {
    
    screw_hole_diameter = 4;
    panel_width = LCD2004_BOARD_WIDTH;
    board_width = panel_width;
    screw_width = 93;

    panel_height = 42;
    board_height = LCD2004_BOARD_HEIGHT;
    screw_height = 55;

    screw_resolution = 10;
    
    translate([(board_width-screw_width)/2,(board_height-screw_height)/2,-0.1]) cylinder(h=screw_length, r=(screw_hole_diameter/2), $fn=screw_resolution);
    translate([(board_width-screw_width)/2,(board_height-screw_height)/2+screw_height,-0.1]) cylinder(h=screw_length, r=(screw_hole_diameter/2), $fn=screw_resolution);
    translate([(board_width-screw_width)/2+screw_width,(board_height-screw_height)/2,-0.1]) cylinder(h=screw_length, r=(screw_hole_diameter/2), $fn=screw_resolution);
    translate([(board_width-screw_width)/2+screw_width,(board_height-screw_height)/2+screw_height,-0.1]) cylinder(h=screw_length, r=(screw_hole_diameter/2), $fn=screw_resolution);
    translate([(board_width-panel_width)/2, (board_height-panel_height)/2, -0.1]) cube([panel_width,panel_height,wall_thickness+2]);
}

module make_lcd_standoff() {
    standoff_height = 10-wall_thickness;
    screw_hole_diameter = 4;
    standoff_width = screw_hole_diameter + 4;
    screw_resolution = 10;

    difference() {
        cube([standoff_width, standoff_width, standoff_height]);
        translate([standoff_width/2, standoff_width/2, -0.1]) cylinder(h=standoff_height+1, r=(screw_hole_diameter/2), $fn=screw_resolution);
    }
}

top_of_post = 0;


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


    module make_lid_screw_hole() {
        // The (lid) screw hole
        translate([nut_post_width/2,nut_post_width/2,7]) cylinder(r=screw_radius, h=nut_post_height+2, $fn=30);
    }


    module make_post(holes_only=0) {
        // This makes the rotateable post/holes
        if(holes_only == 0) {        
            difference() {
                // The post itself
                cube([nut_post_width, nut_post_width, nut_post_height]);
                // The nut post holes (nut hole, screw hole)
                make_lid_screw_hole();
                // The cut to make the post 45 degrees
                rotate([-45,0,0]) translate([-0.05,-0.05,0]) cube([nut_post_width+.1, nut_post_width+.1, nut_post_height]);
            }
        } else {
            // JUST The nut post holes (nut hole, screw hole), but on the same orientation as the post
            make_lid_screw_hole();        
        }    
    }


    translate([nut_post_width/2, nut_post_width/2, (post_top_at-nut_post_height)]) rotate([0, 0, rotation]) translate([-nut_post_width/2, -nut_post_width/2, 0]) make_post(holes_only);
}




// Now, add the screw triangles
post_width = (screw_radius * 4) + 1;

difference() {
    // We're no longer offsetting the lid - it now covers the full top.
    cube([case_width, case_depth, wall_thickness]);


    translate([(case_width-LCD2004_BOARD_WIDTH)/2,case_depth/3*2-(LCD2004_BOARD_HEIGHT/2),0]) LCD2004();    
    
    
    // Front left nut hole
    translate([wall_thickness, wall_thickness+0, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=270, holes_only=1);
    // Back left nut hole    
    translate([wall_thickness, case_depth-wall_thickness-8.5, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=270, holes_only=1);


    // Front right nut hole
    translate([case_width-wall_thickness-8.5, wall_thickness+0, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=90, holes_only=1);
    // Back right nut hole    
    translate([case_width-wall_thickness-8.5, case_depth-wall_thickness-8.5, 0]) captive_square_nut_post(top_of_post, wall_thickness, rotation=90, holes_only=1);

    
}


// Fermentrack Logo
translate([case_width/2-23,8,wall_thickness]) linear_extrude(height=0.6) import("ft_logo_white_bkg.svg", dpi=500);
