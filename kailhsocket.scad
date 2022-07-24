$fn=60;

//hotswap
cyl_h=3.05;
cyl_d=3;

base_x=4.75;
base_x_sum=9.55;
base_y=4.65;
base_y_sum=6.85;
base_z=1.8;

clip_x=1.68;
clip_y=(13.15-9.95)/2;
clip_z=1.85;

//based on:
//https://www.kailhswitch.com/Content/upload/pdf/201915927/CPG135001D03_-_White_Clicky_Choc.pdf  
module kailh_choc_switch(){
    color("orange")
    union(){
        cube([15,15,0.8]);
        translate([0.6,0.7,0.8])
        cube([13.8,13.6,2.2]);
        
        translate([7.5,7.5,3]){
            cylinder(h=3,d=3.4);
            
            translate([0,+5.5,0])
            cylinder(h=3,d=1.9);
            translate([0,-5.5,0])
            cylinder(h=3,d=1.9);
            
            //contacts
            translate([-5.9,0,0])
            cylinder(h=3,d=1.2);
            translate([-3.8,-5,0])
            cylinder(h=3,d=1.2);
        }
    }
}

//based on:
//https://www.kailhswitch.com/Content/upload/pdf/202115927/CPG135001S30-data-sheet.pdf
module kailh_hot_swap_choc(extend_cables=0){


    //fuck
    mirror([0,0,1])
    union(){
    //plastic
    color("darkgray"){
        cube([base_x,base_y,base_z]);
        
        translate([base_x_sum-base_x,base_y_sum-base_y,0])
        cube([base_x,base_y,base_z]);
        
        translate([base_x/2,base_y/2,0]){
            cylinder(h=cyl_h,d=cyl_d);
            translate([5,2.2,0])
            cylinder(h=cyl_h,d=cyl_d);
        }
        translate([base_x,0,0])
        rotate([0,0,45])
        cube([base_x,base_y,base_z]);
    }
    
    //metal
    color("gray"){
        translate([-clip_x-extend_cables,base_y/2-clip_y/2,0])
        cube([clip_x+base_y/2+extend_cables, clip_y, clip_z]);
        translate([base_x_sum-base_y/2,base_y_sum-base_y/2-clip_y/2,0])
        cube([clip_x+base_y/2+extend_cables, clip_y, clip_z]);
    }
    }
}

difference(){
cube([20,20,3]);
translate([2.5,2.5,0]){
    translate([0,0,-3])
    kailh_choc_switch();

    translate([7.5-3.8+base_y/2+.05,0.1,3])
    rotate([0,0,90])
    kailh_hot_swap_choc(10);
    }
}


//kailh_choc_switch();