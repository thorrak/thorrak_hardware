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



module make_nut_post() {
        translate([nut_post_width/2,nut_post_width/2,-1]) cylinder(r=2, h=3*case_lid_depth);
}


to_back_of_lid = -(front_post_to_pcb_front+panel_depth)+0.5 +case_exterior_depth-panel_depth-0.5;
difference () {
    translate([-case_exterior_width/2,-(front_post_to_pcb_front+panel_depth)+0.5,0]) cube([case_exterior_width, case_exterior_depth-panel_depth-0.5, case_lid_depth]);
    translate([-(case_exterior_width/2)+panel_depth,-(front_post_to_pcb_front),-0.1]) make_nut_post();
    translate([(case_exterior_width/2)-panel_depth-nut_post_width,-(front_post_to_pcb_front),-0.1]) make_nut_post();
}

translate([-(exit_hole_width/2),to_back_of_lid,0]) cube([exit_hole_width, panel_depth, case_lid_depth]);
translate([case_exterior_width/2-tab_width-panel_depth-tab_side_clearance,to_back_of_lid,0]) cube([tab_width,panel_depth,rear_tab_height-1]);
translate([-(case_exterior_width/2)+panel_depth+tab_side_clearance,to_back_of_lid,0]) cube([tab_width,panel_depth,rear_tab_height-1]);


