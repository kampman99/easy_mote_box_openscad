// Easy Mote is 60x127.
// Security screws are button head T25 M5x20.
// Screws to attach to wall are Tapcon concrete anchors 3/16" x 1-1/4".

// Minimum fragment size (smooths the screw holes)
$fs = 0.15;

//openscad-rounded-corners rounding radius
rounding_r = 2;

// outer dimensions
base_w = 80;
base_l = 137;
base_h = 32;

echo(str("Base outer dimensions: " , base_w , " x " , base_l , " x " , base_h));

// base thicknesses
base_floor_t = 5;
base_side_t = 10;
base_topbot_t = 5;

// lid thicknesses
lid_face_t = 7;
lid_side_t = 5;
lid_topbot_t = 5;

// total gap between base and lid on sides and top bottom (x and y)
lw_gap = 1;

// lid outer dimensions
lid_w = base_w + lid_side_t + lid_side_t + lw_gap;
lid_l = base_l + lid_topbot_t + lid_topbot_t + lw_gap;
lid_h = base_h + lid_face_t;

echo(str("Lid outer dimensions: ", lid_w, " x ", lid_l, " x ", lid_h));

// security screw dimensions
ss_body_r = 2.5;
ss_body_length = 20;
ss_head_depth = 3;
ss_head_r = 4.7;


