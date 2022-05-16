// Easy Mote is 60x127.
// Security screws are button head T25 M5x20.
// Screws to attach to wall are Tapcon concrete anchors 3/16" x 1-1/4".

// Minimum fragment size (smooths the screw holes)
$fs = 0.15;

// outer dimensions
box_w = 80;
box_l = 137;
box_h = 30;

// thicknesses
floor_t = 5;
side_t = 10;
top_bottom_t = 5;

// security screws to attach cover
thread_radius = 2.5;

// floor with screw holes
difference() {
    // floor
    color([1, 0, 0])
    cube([box_w, box_l, floor_t], true);
    // upper-left hole
    translate([-20, 55, -floor_t/2 - .001])
        cylinder(h=floor_t + .01, r1=2.5, r2=4.5);
    // upper-right hole
    translate([20, 55, -floor_t/2 - .001])
        cylinder(h=floor_t + .01, r1=2.5, r2=4.5);
    // lower-right hole
    translate([20, -55, -floor_t/2 - .001])
        cylinder(h=floor_t + .01, r1=2.5, r2=4.5);
    // lower-left hole
    translate([-20, -55, -floor_t/2 - .001])
        cylinder(h=floor_t + .01, r1=2.5, r2=4.5);
}

// left wall with screw holes (y position is -lid_l/2 + 12 or lid_l/2 - 12)
color([0,1,0])
translate([-box_w / 2 + (side_t / 2), 0, box_h/2 - floor_t/2]) {
    difference() {
        cube([side_t, box_l, box_h], true);
        translate([0, 62, (floor_t + box_h - 30)]) 
            cylinder(h=30, r=thread_radius);
        translate([0, -62, (floor_t + box_h - 30)]) 
            cylinder(h=30, r=thread_radius);
    }
}

// top wall 5 thick with IR hole
color([0,0,1])
translate([0, box_l/2 - (top_bottom_t / 2), box_h/2 - floor_t/2]) {
    difference() {
        // wall 
        cube([box_w, top_bottom_t, box_h], true);
        
        // hole
        cube([20, top_bottom_t + 0.01, 15], true);
    }
}

// right wall with screw holes
color([0,1,0])
translate([box_w / 2 - (side_t /2), 0, box_h/2 - floor_t/2 ]) {
    difference() {
        cube([side_t, box_l, box_h], true);
        translate([0, 62, (floor_t + box_h - 30)])
            cylinder(h=30, r=thread_radius);
        translate([0, -62, (floor_t + box_h - 30)])
            cylinder(h=30, r=thread_radius);
    }
}

// bottom wall
color([0,0,1])
translate([0, -box_l/2 + (top_bottom_t / 2), box_h/2 - floor_t/2]) {
    cube([box_w, top_bottom_t, box_h], true);
}
