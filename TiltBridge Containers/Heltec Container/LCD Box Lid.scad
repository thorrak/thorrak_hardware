wall_thickness=1;
case_depth=3.5+3.7+1.5+wall_thickness+1;
pcb_length=50.3; // Originally 51
case_width=51;

insert_height=case_depth-1.5-3.7-0.8;




// Related to the "nut slot" posts
nut_width = 5.5;
nut_height = 2.5;
nut_post_width = nut_width + 2.3;
nut_hole_height = nut_height + 1.2;
nut_hole_width = nut_width + 0.4;

nut_hole_depth = (nut_post_width-nut_width)/2 + nut_width;
riser_height = wall_thickness*2;

module make_nut_posts() {
        translate([nut_post_width/2+(wall_thickness*2),nut_post_width/2,-wall_thickness-0.1-riser_height]) cylinder(r=2, h=case_depth+wall_thickness*2+riser_height*2);
        translate([case_width-(nut_post_width/2+(wall_thickness*2))+2,nut_post_width/2,-wall_thickness-0.1-riser_height]) cylinder(r=2, h=case_depth+wall_thickness*2+riser_height*2);
}


difference() {    
    // The actual case lid (will need to carve out LCD hole)
    translate([-wall_thickness, -wall_thickness-nut_post_width, -wall_thickness]) cube([case_width+2*wall_thickness, 25.7+2*wall_thickness+nut_post_width*2, wall_thickness]);

    // The LCD hole
    translate([19.2, 3.8, -wall_thickness-0.1]) cube([23.8,13.6,wall_thickness*2]);
    
    // The button cutout
    #translate([1.4,2.6,-wall_thickness-0.1]) cube([8.5,2.8,wall_thickness*2]);

    translate([-wall_thickness,-nut_post_width-wall_thickness,0]) make_nut_posts();
    translate([-wall_thickness,25.7+wall_thickness,0]) make_nut_posts();

}


// Insert panels ("walls")
difference() {
    make_walls();
    translate([19+2,0,0]) cube([20, 25.7+3*wall_thickness, insert_height+1]);

}
// MicroUSB Port Notch
translate([-wall_thickness, (25.7-10)/2, 0]) cube([wall_thickness, 10, 0.8]);


translate([1.7,3,0]) {
    translate([0,0,-wall_thickness]) cube([8.6,2,wall_thickness]);
    cube([2,2,2]);
}


module make_walls() {
    {
        translate([0.2,0.1,0]) cube([pcb_length-0.4,1.4,insert_height]);
        translate([0.2,25.7-1.4-0.1,0]) cube([pcb_length-0.4,1.4,insert_height]);
    }
}