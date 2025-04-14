wall_thickness = 3;
case_depth = 135;
case_width = 140;
case_height = 72;

hole_radius = 2;

lid_height = 5; // Should be 5
tab_width = 20; // The width of the tabs on the lid

wall_tolerance = 1;
tab_tolerance = .8;

screw_radius = (4 / 2);
screw_length = ((15 - 5) / 2);



LCD2004_BOARD_WIDTH = 60.8;
LCD2004_BOARD_HEIGHT = 42;

module LCD2004() {
    
    screw_hole_diameter = 3;
    panel_width = LCD2004_BOARD_WIDTH;
    board_width = panel_width;
    screw_width = 66;

    panel_height = 43;
    board_height = LCD2004_BOARD_HEIGHT;
    screw_height = 37;

    screw_resolution = 10;
    
    translate([(board_width-screw_width)/2,(board_height-screw_height)/2,-0.1]) cylinder(h=screw_length, r=(screw_hole_diameter/2), $fn=screw_resolution);
    
    translate([(board_width-screw_width)/2,(board_height-screw_height)/2+screw_height,-0.1]) cylinder(h=screw_length, r=(screw_hole_diameter/2), $fn=screw_resolution);
    translate([(board_width-screw_width)/2+screw_width,(board_height-screw_height)/2,-0.1]) cylinder(h=screw_length, r=(screw_hole_diameter/2), $fn=screw_resolution);
    translate([(board_width-screw_width)/2+screw_width,(board_height-screw_height)/2+screw_height,-0.1]) cylinder(h=screw_length, r=(screw_hole_diameter/2), $fn=screw_resolution);
    
    #translate([(board_width-panel_width)/2, (board_height-panel_height)/2, -0.1]) cube([panel_width,panel_height,wall_thickness+2]);
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


module make_screw_triangle(screw_radius, screw_length) {
    post_width = (screw_radius * 4) + 1;
    length = screw_length;

    translate([post_width/2,post_width/2,length/2]) cylinder(h = (length+2), r1 = screw_radius, r2 = screw_radius, center=true);
}


// Now, add the screw triangles
post_width = (screw_radius * 4) + 1;

difference() {
    translate([wall_thickness+(wall_tolerance/2),wall_thickness+(wall_tolerance/2),0]) cube([case_width-(wall_thickness*2)-wall_tolerance, case_depth-wall_thickness-wall_tolerance, lid_height-.2]);
    {
        translate([wall_thickness,case_depth-wall_thickness,0]) mirror([0,1,0]) make_screw_triangle(screw_radius, screw_length);
        translate([case_width-wall_thickness,case_depth-wall_thickness,0]) mirror([1,1,0]) make_screw_triangle(screw_radius, screw_length);
        translate([(case_width-LCD2004_BOARD_WIDTH)/2,case_depth/3*2-(LCD2004_BOARD_HEIGHT/2),0]) LCD2004();    
    }
}

translate([wall_thickness+10+tab_tolerance,(wall_tolerance/2),0]) cube([tab_width-(tab_tolerance*2),wall_thickness+2,lid_height/2-tab_tolerance]);
translate([case_width-tab_width-(wall_thickness+10)+tab_tolerance,(wall_tolerance/2),0]) cube([tab_width-(tab_tolerance*2),wall_thickness+2,lid_height/2-tab_tolerance]);

//translate([case_width/2, case_depth/3*2, 0]) make_lcd_standoff();
//translate([case_width/2-15, case_depth/3*2, 0]) make_lcd_standoff();
//translate([case_width/2-30, case_depth/3*2, 0]) make_lcd_standoff();
//translate([case_width/2+15, case_depth/3*2, 0]) make_lcd_standoff();


