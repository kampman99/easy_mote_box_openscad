// See notes at the top of easy_mote_base.scad

//Use roundedcube.scad https://danielupshaw.com/openscad-rounded-corners/
include <roundedcube.scad>;

// Minimum fragment size (smooths the screw holes)
$fs = 0.15;

// outer dimensions
// 80 + 5 + 5 + 1
lid_w = 91;
// 137 + 5 + 5 + 1
lid_l = 148;
// 30 + 7
lid_h = 37;

// thicknesses
face_t = 7;
side_t = 5;
top_bottom_t = 5;

// security screws
head_depth = 4;
head_radius = 4.7;
thread_radius = 2.5;
thread_length = 20;

// face with button window and recessed screw holes
difference() {
    roundedcube([lid_w, lid_l, face_t], true, 2, "zmin");
    // button window
    translate([0, -4, 0]) 
        cube([46, 55, face_t + .01], true);
    
    // upper-left screw hole for recessed pan-head security screw
    // The hole has to be moved in by side_t + one-half base side wall thickness
    translate([-(lid_w/2) + side_t + 5,  (lid_l/2) - 12, -(face_t /2)- .01]) {
        // recess for head
        cylinder(h=head_depth, r=head_radius, center=true);
        // through hole for screw. The +8 is just enough to break through
        cylinder(h=face_t + 8, r=thread_radius, center=true);
    }
    // upper-right
    translate([ (lid_w/2) - side_t - 5,  (lid_l/2) - 12, -(face_t /2)- .01]) {
        cylinder(h=head_depth, r=head_radius, center=true);
        cylinder(h=face_t + 8, r=thread_radius, center=true);
    }
    // lower-right
    translate([ (lid_w/2) - side_t - 5, -(lid_l/2) + 12, -(face_t /2)- .01]) {
        cylinder(h=head_depth, r=head_radius, center=true);
        cylinder(h=face_t + 8, r=thread_radius, center=true);
    }
    // lower-left
    translate([-(lid_w/2) + side_t + 5, -(lid_l/2) + 12, -(face_t /2)- .01]) {
        cylinder(h=head_depth, r=head_radius, center=true);
        cylinder(h=face_t + 8, r=thread_radius, center=true);
    }
}
// left wall (overlaps face)
translate([-lid_w / 2 + side_t / 2, 0, lid_h/2 - face_t/2])
    roundedcube([side_t, lid_l, lid_h], true, 2, "zmin");

// top wall with IR window
translate([0, lid_l/2 - top_bottom_t/2, lid_h/2 - face_t/2]) {
    difference() {
        roundedcube([lid_w, top_bottom_t, lid_h], true, 2, "zmin");
        
        // move up half the thickness of the floor of the base so the windows line up
        translate([0, 0, 2.5])
            cube([20, top_bottom_t + .01, 15], true);
    }
}

// right wall
translate([lid_w / 2 - side_t / 2, 0, lid_h/2 - face_t/2])
    roundedcube([side_t, lid_l, lid_h], true, 2, "zmin");

// bottom wall
translate([0, -lid_l/2 + (top_bottom_t / 2), lid_h/2 - face_t/2]) {
    roundedcube([lid_w, top_bottom_t, lid_h], true, 2, "zmin");
}

