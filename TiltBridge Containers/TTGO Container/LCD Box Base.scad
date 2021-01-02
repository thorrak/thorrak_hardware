wall_thickness=1;
case_depth=3.5+3.7+1.5+wall_thickness+1;
pcb_length=50.3; // Originally 51

case_width = 51;

riser_height = 4.6; // This is the amount of space underneath the assembly (to accomodate longer screws)


module below_pcb_carveout() {
    translate([0, (25.7-21.1)/2,-riser_height]) cube([pcb_length,21.1,3.7+0.01+riser_height]);
}

//cube([52,32.3,10]);
difference() {
    translate([-wall_thickness, -wall_thickness, 0]) cube([case_width+2*wall_thickness, 25.7+2*wall_thickness, case_depth-wall_thickness]);

    // Base (area below the PCB
    below_pcb_carveout();

    //PCB itself (extended above to case_depth)
    translate([0,0,3.7]) cube([pcb_length,25.7,1.5+case_depth]);

    // MicroUSB Port Hole
    translate([-wall_thickness*2, (25.7-10)/2, 3.7-0.5]) cube([wall_thickness*3, 10, case_depth]);
    
    // side air holes
    translate([pcb_length/2-15/2,-wall_thickness-0.1,0]) cube([15,25.7+2*wall_thickness+0.2,10]);
    
    // back air hole
    translate([pcb_length-0.1,25.7/2-10/2,0]) cube([wall_thickness+0.2+4,10,1.5]);
    
    translate([nut_post_width+wall_thickness*2,-nut_post_width, 3.7]) cube([case_width-2*nut_post_width-wall_thickness*4, nut_post_width*2+25.7,case_depth-wall_thickness-3]);

}


// Related to the "nut slot" posts
nut_width = 5.5;
nut_height = 2.5;
nut_post_width = nut_width + 2.3;
nut_hole_height = nut_height + 1.2;
nut_hole_width = nut_width + 0.4;

nut_hole_depth = (nut_post_width-nut_width)/2 + nut_width;


module make_nut_posts() {
        translate([nut_post_width/2+(wall_thickness*2),nut_post_width/2,-wall_thickness-0.1-riser_height]) cylinder(r=2, h=case_depth+wall_thickness*2+riser_height*2);
        translate([case_width-(nut_post_width/2+(wall_thickness*2))+2,nut_post_width/2,-wall_thickness-0.1-riser_height]) cylinder(r=2, h=case_depth+wall_thickness*2+riser_height*2);
}

module make_nut_wall() {
    difference() {
        cube([case_width+2*wall_thickness, nut_post_width, case_depth-wall_thickness]);

        make_nut_posts();

        // Nut holes
        translate([nut_post_width/2+(wall_thickness*2)-nut_hole_width/2,-1,case_depth/2-nut_hole_height/2-wall_thickness]) cube([nut_hole_width, nut_post_width+1, nut_hole_height]);
        translate([case_width-(nut_post_width/2+(wall_thickness*2))+2-nut_hole_width/2,-1,case_depth/2-nut_hole_height/2-wall_thickness]) cube([nut_hole_width, nut_post_width+1, nut_hole_height]);

        // side air holes
        translate([pcb_length/2-15/2+wall_thickness,-wall_thickness-0.1,0]) cube([15,25.7+2*wall_thickness+0.2,1.5]);
    }
}


module make_walls() {
    translate([-wall_thickness,-nut_post_width-wall_thickness,0]) make_nut_wall();
    translate([-wall_thickness,25.7+wall_thickness,0]) make_nut_wall();
}

difference() {
    make_walls();
    translate([nut_post_width+wall_thickness*2,-nut_post_width, -riser_height+wall_thickness]) cube([case_width-2*nut_post_width-wall_thickness*4, nut_post_width*2+25.7,case_depth+riser_height+wall_thickness]);
    //translate([nut_post_width+wall_thickness*2,-nut_post_width, 3.7]) cube([case_width-2*nut_post_width-wall_thickness*4, nut_post_width*2+25.7,case_depth-wall_thickness-3]);
}

// The actual base.

 difference() {
    translate([-wall_thickness, -nut_post_width-wall_thickness,-riser_height-wall_thickness]) cube([case_width+2*wall_thickness, nut_post_width*2+25.7+2*wall_thickness, riser_height+wall_thickness]);
    below_pcb_carveout();
    translate([-wall_thickness,-nut_post_width-wall_thickness,0]) make_nut_posts();
     translate([-wall_thickness,25.7+wall_thickness,0]) make_nut_posts();
}
