module ADXL345() {
    // Reference model of the ADXL345 board that I have.
    $fn = 10;
    Length = 21;
    Width = 16;
    Depth = 1;

    HoleDist = 16;
    HoleOffset = 1;
    HoleRad = 3.5/2;

    module Hole() {
        translate([HoleDist/2,Width/2-HoleOffset-HoleRad,0])
        cylinder(Depth*2,HoleRad,HoleRad,center=true);
    } 

    Pins = 8;
    // PinDistance = Length/(Pins+1);
    PinDistance = 2.5;
    PinsOffset = 2;
    PinHoleRad = 0.3;

    module PinHoles() {
        translate([-Length/2-PinDistance/4, - Width/2 + PinsOffset,0])
        for(i = [1 : 1 : Pins]) {
            translate([i*PinDistance,0,0])
            cylinder(Depth*2, PinHoleRad, PinHoleRad, center=true);
        }
    }



    // Headers

    PinHeight = 11;
    BlockWidth = 2;
    BlockDepth = BlockWidth;
    BlockLength = 2.5;
    BlockOffset = 3;

    module Pin() {
        // Block
        color("black")
        translate([0,0,PinHeight/2 - BlockOffset - BlockDepth/2])
        cube([BlockLength, BlockWidth, BlockDepth], center=true);
        // Pin
        color("grey")
        cylinder(PinHeight, 0.2, 0.2, center=true);
    }

    translate([0,0,Depth/2]) {
        // Board
        difference() { 
            color("green")
            cube([Length,Width,Depth], center = true);
            Hole();
            mirror([1,0,0]) 
            Hole();
            PinHoles();
        }

        // Pins
        translate([-Length/2 - PinDistance/4, - Width/2 + PinsOffset,0])
        for(i = [1 : 1 : Pins]) {
            translate([i*PinDistance,0,0])
            Pin();
        }
    }
}

// ADXL345();
