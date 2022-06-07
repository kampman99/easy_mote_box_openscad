// Minimum fragment size (smooths the screw holes)
$fs = 0.15;

// cube with hole for insert
hole_radius = 3.5;

difference() {
    cube([20, 20, 10]);
    translate([10, 10, 2])
        cylinder(h=10.01, r=hole_radius);
}