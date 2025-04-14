wall_thickness = 3.7;


// All holes/openings should be offset from hole 1, at 0,0, which is the lower left hole
lcd_hole_1_x = 0;
lcd_hole_1_y = 0;

// Lower right hole
lcd_hole_2_x = 66; // Per lolin's spec
lcd_hole_2_y = lcd_hole_1_y;

// Upper left hole
lcd_hole_3_x = lcd_hole_1_x;
lcd_hole_3_y = 37; // Per lolin's spec

// Upper right hole
lcd_hole_4_x = lcd_hole_2_x;
lcd_hole_4_y = lcd_hole_3_y;

// Screw hole radius for the LCD
lcd_hole_radius = 1.4;

// Opening X and Y are offset from lcd_hole_1
lcd_opening_x = 2.6;
lcd_opening_y = -3;

// This is the actual width/length of the hole
lcd_opening_x_length = 60.8;
lcd_opening_y_length = 42;




module lcd_holes() {
    translate([lcd_hole_1_x, lcd_hole_1_y, 0]) cylinder(h=wall_thickness*3, r=lcd_hole_radius, center=true, $fn=30);
    translate([lcd_hole_2_x, lcd_hole_2_y, 0]) cylinder(h=wall_thickness*3, r=lcd_hole_radius, center=true, $fn=30);
    translate([lcd_hole_3_x, lcd_hole_3_y, 0]) cylinder(h=wall_thickness*3, r=lcd_hole_radius, center=true, $fn=30);
    translate([lcd_hole_4_x, lcd_hole_4_y, 0]) cylinder(h=wall_thickness*3, r=lcd_hole_radius, center=true, $fn=30);
    translate([lcd_opening_x, lcd_opening_y, -1]) cube([lcd_opening_x_length, lcd_opening_y_length, wall_thickness*3]);
}

lcd_plate_size = 4.0; // 3.8

module lcd_plate(lcd_x, lcd_y) {
    translate([-lcd_plate_size/2, -lcd_plate_size/2, 0]) translate([lcd_x, lcd_y, 0]) cube([lcd_plate_size, lcd_plate_size, wall_thickness]);
}

module make_lcd_plates() {
    lcd_plate(lcd_hole_1_x, lcd_hole_1_y);
    lcd_plate(lcd_hole_2_x, lcd_hole_2_y);
    lcd_plate(lcd_hole_3_x, lcd_hole_3_y);
    lcd_plate(lcd_hole_4_x, lcd_hole_4_y);
}


frame_width = 5;

difference() {
    make_lcd_plates();
    lcd_holes();
}

extra_vertical_padding=3.0;


module make_frame() {
    translate([-lcd_plate_size/2-frame_width, -lcd_plate_size/2-frame_width, 0]) cube([lcd_hole_4_x+lcd_plate_size+(frame_width*2),frame_width,wall_thickness]);

    translate([-lcd_plate_size/2-frame_width,-lcd_plate_size/2-frame_width,0]) cube([frame_width, lcd_hole_3_y+frame_width+lcd_plate_size*2, wall_thickness]);

    translate([-lcd_plate_size/2-frame_width, -lcd_plate_size/2-frame_width+lcd_hole_3_y+frame_width+lcd_plate_size, 0]) cube([lcd_hole_4_x+lcd_plate_size+(frame_width*2),frame_width,wall_thickness]);


    translate([-lcd_plate_size/2-frame_width+lcd_hole_4_x+frame_width+lcd_plate_size,-lcd_plate_size/2-frame_width,0]) cube([frame_width, lcd_hole_3_y+frame_width+lcd_plate_size*2, wall_thickness]);

}

difference() {
// These are the frame
make_frame();
translate([lcd_plate_size/2, -lcd_plate_size/2+lcd_opening_y+1,-0.01]) cube([lcd_hole_2_x-lcd_plate_size,lcd_opening_y_length+extra_vertical_padding,wall_thickness+0.2]);
}