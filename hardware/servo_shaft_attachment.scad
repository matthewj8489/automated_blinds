$fn=50;
e=0.1;

// Horn dimensions (distance from center)
x_r=8;
y_r=14;
shaft_z=20;

// parameters
blind_shaft_w=3;
blind_shaft_d=4.5;
blind_shaft_h=16;

cyl_r=5;
cyl_h=blind_shaft_h+8;

cyl_open_cent_r=2.5;
cyl_open_cent_h=2;

mount_w=x_r-2;
mount_d=y_r;
mount_h=2;

support_h=5;
support_d=7;
support_w=mount_w-1;

tap_hole_dist=13;
tap_hole_r=1;

////////////////////////////////////////////
//difference(){
    
main_body();

//translate([0, 0, 15])
//        cube([10, 10, 25], center=true);
//}

difference() {
    mount_tab(cyl_r-2);

    translate([0,tap_hole_dist,mount_h/2])
        cylinder(h=mount_h,r=tap_hole_r,center=true);
}

rotate([0,0,180])   
difference() {
    mount_tab(cyl_r-2);
    
    translate([0,tap_hole_dist,mount_h/2])
        cylinder(h=mount_h,r=tap_hole_r,center=true);
}


translate([-support_w/2,cyl_r-2,mount_h])
    support(support_w, support_d, support_h);

rotate([0,0,180])
    translate([-support_w/2,cyl_r-2,mount_h])
        support(support_w, support_d, support_h);

////////////////////////////////////////////

/**
*   Support for mounting tab
*/
module support(sup_w, sup_d, sup_h) {

    rotate(a=[90,0,90])
    linear_extrude(height=sup_w)
    polygon(points=[[0,0],[0,sup_h],[sup_d,0]]);

}

/**
*   Tab for mounting to servo horn
*       offset : offset from center
*/
module mount_tab(offset) {

    translate([0,mount_d/2+offset,mount_h/2])
        cube([mount_w, mount_d, mount_h], center=true);

    translate([0,mount_d+offset,mount_h/2])
        cylinder(mount_h, r=mount_w/2, center=true);

}

module main_body() {

    difference() {

        translate([0,0,cyl_h/2])
            cylinder(cyl_h, r=cyl_r, center=true);

        translate([0,0,cyl_open_cent_h/2])
            cylinder(cyl_open_cent_h, r=cyl_open_cent_r, center=true);
        
        translate([0,0,cyl_h-blind_shaft_h+blind_shaft_h/2])
            cube([blind_shaft_w, blind_shaft_d, blind_shaft_h+e], center=true);
    }

}