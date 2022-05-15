// outer dimensions
box_w = 80;
box_l = 137;
box_h = 30;
floor_t = 5;
side_t = 10;
top_bottom_t = 5;

// floor with screw holes
difference() {
    // floor
    color([1, 0, 0])
    cube([box_w, box_l, floor_t], true);
    // upper-left hole
    translate([-30, 55, -floor_t/2 - .001])
        cylinder(h=floor_t + .01, r=3);
    // upper-right hole
    translate([30, 55, -floor_t/2 - .001])
        cylinder(h=floor_t + .01, r=3);
    // lower-right hole
    translate([30, -55, -floor_t/2 - .001])
        cylinder(h=floor_t + .01, r=3);
    // lower-left hole
    translate([-30, -55, -floor_t/2 - .001])
        cylinder(h=floor_t + .01, r=3);
}

// left wall
color([0,1,0])
translate([-box_w / 2 - (side_t / 2), 0, box_h / 2]) {
    cube([side_t, box_l, box_h + floor_t], true);
}

// top wall 5 thick with IR hole
color([0,0,1])
translate([0, box_l/2 + (top_bottom_t / 2), box_h/2]) {
    difference() {
        // wall 
        cube([box_w + side_t + side_t, top_bottom_t, box_h + floor_t], true);
        
        // hole
        cube([20, top_bottom_t + 0.01, 15], true);
    }
}

// right wall
color([0,1,0])
translate([box_w / 2 + (side_t /2), 0, box_h /2]) {
    cube([side_t, box_l, box_h + floor_t], true);
}

// bottom wall
color([0,0,1])
translate([0, -(box_l/2 + (top_bottom_t / 2)), box_h/2]) {
    cube([box_w + side_t + side_t, top_bottom_t, box_h + floor_t], true);
}
