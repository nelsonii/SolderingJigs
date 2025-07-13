include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

//2024-10-08 : Improved to support wires while soldering
//2025-01-16 : Multi version

toolWidth=127; // 5"
toolDepth=12;
toolHeight=4.5;
viseHeight=2.0;

wireShift=19.5;
potLeg=8.5;

wiggle=0.1;
$fn=60;
tool();

module tool() {  

  spacing = 30/2;
  
  difference(){
    union() {
      color("orange") cuboid([toolWidth, toolDepth, toolHeight], align=V_UP); //base jig
      color("yellow") cuboid([toolWidth+5, toolDepth, viseHeight], align=V_UP); //to fit into vise 
      left(spacing*3) potwiresupport();
      left(spacing) potwiresupport();
      right(spacing) potwiresupport();
      right(spacing*3) potwiresupport();
    }
      left(spacing*3) potholes();
      left(spacing) potholes();
      right(spacing) potholes();
      right(spacing*3) potholes();
   
  }//difference
}


module potwiresupport() {
  forward(12/2) color("brown") cuboid([15, 12+toolDepth, 3], align=V_UP); // extension for soldering
  forward(wireShift) color("green") cuboid([15, 6, potLeg+2], align=V_UP); // wire holder
}

module potholes() {
      color("green") cyl(d=7.25, h=toolHeight+wiggle, align=V_UP); // MOD POT
    right(6) up(toolHeight-2) color("blue") cuboid([6, 3, 2+wiggle], align=V_UP); // pot cutout
    //wire slots
    left(0)  up(potLeg+2-4) forward(wireShift) cuboid([1.25,6,4], align=V_UP);
    left(5)  up(potLeg+2-4) forward(wireShift) cuboid([1.25,6,4], align=V_UP);
    right(5) up(potLeg+2-4) forward(wireShift) cuboid([1.25,6,4], align=V_UP);
}