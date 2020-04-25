$fn=50;
e=0.1;

main_circle_meas_d = 7.5;
outside_circle_meas_d = 4;
length_meas = 32;
height_meas = 2;
thickness = 2;

main_circle_r = (main_circle_meas_d + 0.5) / 2;
outside_circle_r = (outside_circle_meas_d + 0.5) / 2;

difference() {
    h1 = height_meas + 1;
    w1 = length_meas + 1 + thickness * 2;
    h2 = height_meas + 1;
    
    translate([0,0,h1/2])
        cube([main_circle_r * 2 + thickness * 2, w1, h1], center=true);

    translate([0,0,h2/2 - e])
        cube([main_circle_r * 2, length_meas + 1, h2 + 3*e], center=true);
}