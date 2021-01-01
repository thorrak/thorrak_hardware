
front_post_hole_offset = 24.7;
front_post_to_pcb_front = 3.6;
front_to_rear_post_hole_offset = 30.5;

panel_depth = 3;  // The width of the case front/back/sides
panel_offset = max(0.5, panel_depth-3);
post_height = 2.5;

// Constants associated with the case lid
rear_tab_height = 2;  // The height of the tab that will lock the lid in place
rear_tab_height_offset = 1; // How much additional clearance to give the tab
tab_side_clearance = 2; // How much clearance to give each side of the tab

pcb_width = 31.6; // Width of the actual PCB (should be greater than front_post_hole_offset)
pcb_depth = 38+6; // Depth of the actual PCB (should be greater than front_to_rear_post_hole_offset);
pcb_height = 1.6; // Height of the PCB fiberglass (part of the RJ-11 offset)

rj_11_width = 17; // Width of the RJ-11 jack (for the hole in the front of the case)
rj_11_height = 13.5+.3; // Height of the RJ-11 jack (for the hole in the front of the case)

exit_hole_width = 13; // Width of the exit hole (in the back of the case)

case_interior_width = pcb_width + 19.6; // Giving 10mm of clearance on either side for wiring, etc. 
case_interior_depth = pcb_depth + 10; // All additional depth is added to the back
case_interior_height = post_height+rj_11_height+pcb_height+5; // This should be equal to post_height + enough room for the RJ-11 jack at a minimum

zip_tie_width = 3.5;


////// These are defined based on the above. Breaking out to make it more explicit what is happening below)
case_exterior_width = case_interior_width + (panel_depth * 2);
case_exterior_depth = case_interior_depth + (panel_depth * 2);
case_exterior_height = case_interior_height + panel_depth;

// Related to the case lid
case_lid_depth = rear_tab_height + rear_tab_height_offset + 2;
tab_width = (case_exterior_width - exit_hole_width - (2*panel_depth) - (4*tab_side_clearance))/2;


// Related to the "nut slot" posts
nut_width = 5.5;
nut_height = 2.5;
nut_post_width = nut_width + 3;
nut_hole_height = nut_height + 1.2;
nut_hole_width = nut_width + 1;
nut_hole_depth = (nut_post_width-nut_width)/2 + nut_width;
nut_hole_height_loc = case_exterior_height - 3 - nut_hole_height;
nut_hole_width_loc = (nut_post_width - nut_hole_width)/2;


module post_with_nut(panel_depth, panel_offset, post_height, negative_only=0) {

    post_radius = 4;
    screw_radius = 2;

    // Used to create a "standard" hex nut object
    module std_hex(hole_depth) {
            width_between_flats = 7;
            flat_width = 4.04;
            module hex_nut(width_between_flats,flat_width,hole_depth) {
                translate([-width_between_flats/2,-flat_width/2,0]) cube([width_between_flats,flat_width,hole_depth]);
                rotate([0,0,-60]) translate([-width_between_flats/2,-flat_width/2,0]) cube([width_between_flats,flat_width,hole_depth]);
                rotate([0,0,60]) translate([-width_between_flats/2,-flat_width/2,0]) cube([width_between_flats,flat_width,hole_depth]);
                
            }
        //hex_nut(width_between_flats,flat_width,hole_depth);
        #cylinder(r=screw_radius*2.25, h=hole_depth);
    }


    if(negative_only == 0) {
        // We're doing the positive part (the actual post that gets printed)
        difference() {
            cylinder(r=post_radius,h=post_height);
            translate([0,0,-((post_height+panel_depth)/2)]) cylinder(r=screw_radius, h=(post_height+panel_depth)*2+.1);
        }
    } else {
        // We're doing the negative part - the hole cylinder and the hex nut
        translate([0,0,-((post_height+panel_depth)/2)]) cylinder(r=screw_radius, h=(post_height+panel_depth)*2+.1);
        translate([0,0,-(panel_depth+.1)]) std_hex(panel_depth+.1-panel_offset);
    }
}

module make_posts(negative_only=0) {
    translate([-front_post_hole_offset/2,0,panel_depth]) post_with_nut(panel_depth, panel_offset, post_height, negative_only);
    translate([front_post_hole_offset/2,0,panel_depth]) post_with_nut(panel_depth, panel_offset, post_height, negative_only);
    translate([0,front_to_rear_post_hole_offset,panel_depth]) post_with_nut(panel_depth, panel_offset, post_height, negative_only);
}

make_posts();


// Make the case base
difference() {
    translate([-(case_exterior_width/2), -(front_post_to_pcb_front+panel_depth), 0]) cube([case_exterior_width, case_exterior_depth, panel_depth]);

    make_posts(1);
    
    translate([-exit_hole_width/2, case_exterior_depth-front_post_to_pcb_front-panel_depth*3-1, -0.1]) cube([exit_hole_width, zip_tie_width, panel_depth/2+0.1]);
    translate([-exit_hole_width/2-zip_tie_width, case_exterior_depth-front_post_to_pcb_front-panel_depth*3-1, -0.1]) cube([zip_tie_width, zip_tie_width, panel_depth+0.2]);
    translate([exit_hole_width/2, case_exterior_depth-front_post_to_pcb_front-panel_depth*3-1, -0.1]) cube([zip_tie_width, zip_tie_width, panel_depth+0.2]);
}

// Make the case front
difference() {
    translate([-(case_exterior_width/2), -(front_post_to_pcb_front+panel_depth), 0]) cube([case_exterior_width, panel_depth, case_exterior_height]);
    translate([-(rj_11_width/2),-(front_post_to_pcb_front+panel_depth+.1),panel_depth+post_height-.3+pcb_height]) cube([rj_11_width, panel_depth+2, rj_11_height]);

    translate([-(case_exterior_width/2)+panel_depth,-(front_post_to_pcb_front),0]) make_nut_hole();
    translate([(case_exterior_width/2)-panel_depth-nut_post_width,-(front_post_to_pcb_front),0]) make_nut_hole();    
    
}

// Make the case left/right
translate([-(case_exterior_width/2),-(front_post_to_pcb_front+panel_depth),0]) cube([panel_depth,case_exterior_depth, case_exterior_height]);
translate([(case_exterior_width/2)-panel_depth,-(front_post_to_pcb_front+panel_depth),0]) cube([panel_depth,case_exterior_depth, case_exterior_height]);


// Make the case rear
translate([0,case_exterior_depth-panel_depth,0]) difference() {
    translate([-(case_exterior_width/2), -(front_post_to_pcb_front+panel_depth), 0]) cube([case_exterior_width, panel_depth, case_exterior_height + case_lid_depth]);
    translate([-(exit_hole_width/2),-(front_post_to_pcb_front+panel_depth+.1),panel_depth+post_height-.3+pcb_height]) cube([exit_hole_width, panel_depth+2, case_exterior_height + case_lid_depth]);
    translate([case_exterior_width/2-tab_width-panel_depth-tab_side_clearance,-(front_post_to_pcb_front+panel_depth+.1),case_exterior_height]) cube([tab_width,panel_depth*2,rear_tab_height]);
    translate([-(case_exterior_width/2)+panel_depth+tab_side_clearance,-(front_post_to_pcb_front+panel_depth+.1),case_exterior_height]) cube([tab_width,panel_depth*2,rear_tab_height]);
}



module make_nut_hole() {
        translate([nut_hole_width_loc,-1-panel_depth,nut_hole_height_loc]) cube([nut_hole_width,nut_hole_depth+1+panel_depth,nut_hole_height]);
}

module make_nut_post() {
    difference() {
        cube([nut_post_width,nut_post_width,case_exterior_height]);
        translate([nut_post_width/2,nut_post_width/2,-1]) cylinder(r=2, h=case_exterior_height+2);
        make_nut_hole();
    }
}

translate([-(case_exterior_width/2)+panel_depth,-(front_post_to_pcb_front),0]) make_nut_post();
translate([(case_exterior_width/2)-panel_depth-nut_post_width,-(front_post_to_pcb_front),0]) make_nut_post();

