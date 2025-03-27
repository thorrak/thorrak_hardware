
front_post_hole_offset = 24.7;
front_post_to_pcb_front = 3.6;
front_to_rear_post_hole_offset = 31.75;

panel_depth = 2;  // The width of the case front/back/sides
panel_offset = max(0.5, panel_depth-3);

// Heatset insert & PCB Post options
heatset_insert_height = 6;
heatset_insert_hole_diameter = 4.2;
heatset_insert_screw_diameter = 3;
screw_space_below_heatset = 0.4;
post_height=heatset_insert_height;// + screw_space_below_heatset;
post_radius = heatset_insert_hole_diameter/2+1.5;
screw_radius = heatset_insert_screw_diameter/2+0.2;

// Constants associated with the case lid
rear_tab_height = 2;  // The height of the tab that will lock the lid in place
rear_tab_height_offset = 1; // How much additional clearance to give the tab
tab_side_clearance = 2; // How much clearance to give each side of the tab

pcb_width = 31.6; // Width of the actual PCB (should be greater than front_post_hole_offset)
pcb_depth = 38+6; // Depth of the actual PCB (should be greater than front_to_rear_post_hole_offset);
pcb_height = 1.6; // Height of the PCB fiberglass (part of the RJ-11 offset)

rj_45_width = 17; // Width of the RJ-11 jack (for the hole in the front of the case)
rj_45_height = 13.5+.3; // Height of the RJ-11 jack (for the hole in the front of the case)

exit_hole_width = 13; // Width of the exit hole (in the back of the case)

case_interior_width = pcb_width + 12.6; // Giving 10mm of clearance on either side for wiring, etc. 
case_interior_depth = pcb_depth + 16; // All additional depth is added to the back
case_interior_height = post_height+rj_45_height+pcb_height+3; // This should be equal to post_height + enough room for the RJ-11 jack at a minimum

zip_tie_width = 4;


////// These are defined based on the above. Breaking out to make it more explicit what is happening below)
case_exterior_width = case_interior_width + (panel_depth * 2);
case_exterior_depth = case_interior_depth + (panel_depth * 2);
case_exterior_height = case_interior_height + panel_depth;

// Related to the case lid
case_lid_depth = rear_tab_height + rear_tab_height_offset + 2;
tab_width = (case_exterior_width - exit_hole_width - (2*panel_depth) - (4*tab_side_clearance))/2;


// Lid screw posts
lid_screw_post_width = post_radius*2;  // Making it the same as the PCB holes


//


module post_holes(top_of_post) {
    // Heat set insert
    translate([0,0,top_of_post-heatset_insert_height]) cylinder(r=heatset_insert_hole_diameter/2, h=heatset_insert_height+0.01, $fn=20);
    // Screw hole
    translate([0,0,top_of_post-heatset_insert_height-screw_space_below_heatset]) cylinder(r=screw_radius, h=heatset_insert_height+screw_space_below_heatset+0.01, $fn=20);
}

    
module post_with_nut(panel_depth, panel_offset, negative_only=0) {

    // This is the post
    if(negative_only==0) {
        difference() {
            cylinder(r=post_radius, h=post_height, $fn=30);
            post_holes(post_height);
        }
    } else {
        post_holes(post_height);
    }    
}


module angle_base_post(angled_height, width, flat_height) {
    difference() {
        cube([angled_height, width, angled_height]);
        translate([-0.01,-0.01,-0.01]) rotate([0,45,0]) cube([angled_height+0.02, width+0.02, angled_height*2]);
    }
    translate([0,0,angled_height]) cube([angled_height, width, flat_height]);
}


module make_lid_screw_post(flip=0) {
    difference() {
        translate([0,0,case_exterior_height-lid_screw_post_width-heatset_insert_height]) {
            if(flip==0) {
                angle_base_post(lid_screw_post_width, lid_screw_post_width, heatset_insert_height);
            } else {
                translate([lid_screw_post_width,lid_screw_post_width,0]) rotate([0,0,180]) angle_base_post(lid_screw_post_width, lid_screw_post_width, heatset_insert_height);
            }
        }
//        cube([lid_screw_post_width,lid_screw_post_width,case_exterior_height]);

        translate([lid_screw_post_width/2,lid_screw_post_width/2,0]) 
        post_holes(case_exterior_height);
    }
}






difference () {
    // Actual lid base
    translate([-(case_exterior_width/2), -(front_post_to_pcb_front+panel_depth), 0]) cube([case_exterior_width, case_exterior_depth, panel_depth]);


    // Screw Holes    
    // Front left
    translate([-(case_exterior_width/2)+panel_depth+lid_screw_post_width/2,-(front_post_to_pcb_front)+lid_screw_post_width/2,-0.01]) cylinder(r=screw_radius, h=panel_depth+0.2, $fn=20);

    // Front right
    translate([(case_exterior_width/2)-panel_depth-lid_screw_post_width+lid_screw_post_width/2,-(front_post_to_pcb_front)+lid_screw_post_width/2,-0.01]) cylinder(r=screw_radius, h=panel_depth+0.2, $fn=20);

    // Back left
    translate([-(case_exterior_width/2)+panel_depth+lid_screw_post_width/2,case_interior_depth-lid_screw_post_width-front_post_to_pcb_front+lid_screw_post_width/2,-0.01]) cylinder(r=screw_radius, h=panel_depth+0.2, $fn=20);

    // Back right
    translate([(case_exterior_width/2)-panel_depth-lid_screw_post_width+lid_screw_post_width/2,case_interior_depth-lid_screw_post_width-front_post_to_pcb_front+lid_screw_post_width/2,-0.01]) cylinder(r=screw_radius, h=panel_depth+0.2, $fn=20);
}


// Fermentrack Logo
//translate([case_exterior_width/2-38,11,panel_depth]) linear_extrude(height=0.6) import("ft_logo_white_bkg.svg", dpi=800);
