// See notes in easy_mote_box_dimensions.scad

include <easy_mote_box_dimensions.scad>;

//Use roundedcube.scad https://danielupshaw.com/openscad-rounded-corners/
include <roundedcube.scad>;

// face with button window and recessed screw holes
difference() {
    roundedcube([lid_w, lid_l, lid_face_t], true, rounding_r, "zmin");
    // button window
    translate([0, -3, 0]) 
        cube([46, 55, lid_face_t + .01], true);
    
    // upper-left screw hole for recessed pan-head security screw
    // The hole has to be moved in by side_t + one-half base side wall thickness
    translate([-(lid_w/2) + lid_side_t + base_side_t/2,  (lid_l/2) - 12, -(lid_face_t /2)- .01]) {
        // recess for head
        cylinder(h=ss_head_depth, r=ss_head_r, center=true);
        // through hole for screw. The +8 is just enough to break through
        cylinder(h=lid_face_t + 8, r=ss_body_r, center=true);
    }
    // upper-right
    translate([ (lid_w/2) - lid_side_t - base_side_t/2,  (lid_l/2) - 12, -(lid_face_t /2)- .01]) {
        cylinder(h=ss_head_depth, r=ss_head_r, center=true);
        cylinder(h=lid_face_t + 8, r=ss_body_r, center=true);
    }
    // lower-right
    translate([ (lid_w/2) - lid_side_t - base_side_t/2, -(lid_l/2) + 12, -(lid_face_t /2)- .01]) {
        cylinder(h=ss_head_depth, r=ss_head_r, center=true);
        cylinder(h=lid_face_t + 8, r=ss_body_r, center=true);
    }
    // lower-left
    translate([-(lid_w/2) + lid_side_t + base_side_t/2, -(lid_l/2) + 12, -(lid_face_t /2)- .01]) {
        cylinder(h=ss_head_depth, r=ss_head_r, center=true);
        cylinder(h=lid_face_t + 8, r=ss_body_r, center=true);
    }
}
// left wall (overlaps face)
translate([-lid_w / 2 + lid_side_t / 2, 0, lid_h/2])
    roundedcube([lid_side_t, lid_l, lid_h], true, 2, "zmin");

// top wall with IR window
translate([0, lid_l/2 - lid_topbot_t/2, lid_h/2]) {
    difference() {
        roundedcube([lid_w, lid_topbot_t, lid_h], true, rounding_r, "zmin");
        
        // move up half the thickness of the floor of the base so the windows line up
        // then subtract adjustment amount to match base.
        translate([0, 0, base_floor_t/2 - ir_window_vert_adj])
            cube([ir_window_width, lid_topbot_t + .01, ir_window_height], true);
    }
}

// right wall
translate([lid_w / 2 - lid_side_t / 2, 0, lid_h/2])
    roundedcube([lid_side_t, lid_l, lid_h], true, rounding_r, "zmin");

// bottom wall
translate([0, -lid_l/2 + (lid_topbot_t / 2), lid_h/2]) {
    roundedcube([lid_w, lid_topbot_t, lid_h], true, rounding_r, "zmin");
}

