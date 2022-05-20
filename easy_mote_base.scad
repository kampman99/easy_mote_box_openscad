// See notes in easy_mote_box_dimensions.scad

include <easy_mote_box_dimensions.scad>;

// floor with screw holes
difference() {
    // floor
    color([1, 0, 0])
    cube([base_w, base_l, base_floor_t], true);
    // upper-left hole
    translate([-20, 55, -base_floor_t/2 - .001])
        cylinder(h=base_floor_t + .01, r1=2.5, r2=4.5);
    // upper-right hole
    translate([20, 55, -base_floor_t/2 - .001])
        cylinder(h=base_floor_t + .01, r1=2.5, r2=4.5);
    // lower-right hole
    translate([20, -55, -base_floor_t/2 - .001])
        cylinder(h=base_floor_t + .01, r1=2.5, r2=4.5);
    // lower-left hole
    translate([-20, -55, -base_floor_t/2 - .001])
        cylinder(h=base_floor_t + .01, r1=2.5, r2=4.5);
}

// left wall with screw holes (y position of holes is -lid_l/2 + 12 or lid_l/2 - 12)
// move wall out by half width, then back in by half thickness
translate([-base_w / 2 + (base_side_t / 2), 0, base_h/2]) {
    difference() {
        cube([base_side_t, base_l, base_h], true);
        translate([0, (lid_l / 2) - 12, base_h/2 - ss_body_length + .001]) 
            color([0,0,0])
            cylinder(h=ss_body_length, r=ss_body_r);
        translate([0, -(lid_l / 2) + 12, base_h/2 - ss_body_length + .001]) 
            cylinder(h=ss_body_length, r=ss_body_r);
    }
}

// top wall with IR hole
color([0,0,1])
translate([0, base_l/2 - (base_topbot_t / 2), base_h/2]) {
    difference() {
        // wall 
        cube([base_w, base_topbot_t, base_h], true);
        
        // hole centered vertically and horizontally then adjusted by ir_window_vert_adj
        translate([0, 0, ir_window_vert_adj])
            cube([ir_window_width, base_topbot_t + 0.01, ir_window_height], true);
    }
}

// right wall with screw holes
color([0,1,0])
translate([base_w / 2 - (base_side_t /2), 0, base_h/2 ]) {
    difference() {
        cube([base_side_t, base_l, base_h], true);
        translate([0, (lid_l / 2) -12, base_h/2 - ss_body_length + .001])
            cylinder(h=ss_body_length, r=ss_body_r);
        translate([0, -(lid_l / 2) + 12, base_h/2 -ss_body_length + .001])
            cylinder(h=ss_body_length, r=ss_body_r);
    }
}

// bottom wall
color([0,0,1])
translate([0, -base_l/2 + (base_topbot_t / 2), base_h/2]) {
    cube([base_w, base_topbot_t, base_h], true);
}
