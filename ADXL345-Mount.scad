include <ADXL345-Ref.scad>;
include <../../Utility/Clamp/Clamp.scad>;

// #ADXL345();

module ADXL345_Clamp(Holes = true) {
    ADXLW = 21;
    Width = ADXLW + 4;
    Clear = 0.5;

    module Holes(Angled = false) {

        HoleRad = 3.5/2;
        HoleDist = 8;
        r = Angled ? HoleRad - Clear : HoleRad;
        rX = Angled ? HoleRad + Clear : r;

        rotate([0,90,0])
        translate([HoleDist,-20.25,0])
        cylinder(r1=rX, r2 = r, h=3);

        mirror([0,0,1])
        rotate([0,90,0])
        translate([HoleDist,-20.25,0])
        cylinder(r1= rX , r2 = r, h=3);

    }

    translate([0,25.5,-2])
    rotate([0,-90,0])
    union() {
        difference() {
            Ext = 11;

            Clamp(
                Clearance = 0.4,
                Radius = 15,
                PlateExtension = Ext,
                PlateThickness = 5,
                Thickness = 4,
                Width = Width
            );

            translate([5-1.5, - 17 - Ext/2,0])
            cube([1.5,Ext,21+2*Clear], center=true);

            translate([5-0.1, - 17 - Ext/2 - 1.5,0])
            cube([1.5,Ext,18], center=true);

            // if(Holes) Holes(Angled = false);
        }

        // if(!Holes) Holes(Angled = true);

    }
}

ADXL345_Clamp();

