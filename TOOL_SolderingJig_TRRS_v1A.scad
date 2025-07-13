include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

toolWidth=80;
toolDepth=16;
toolHeight=4.5;

tool();

module tool() {  
  difference(){
    union() {
      color("orange") cuboid([toolWidth, toolDepth, toolHeight], align=V_UP); //base jig
      color("orange") cuboid([toolWidth+5, toolDepth, 2], align=V_UP); //to fit into vise 
    }
    forward(2) color("green") cyl(d=8.25, h=toolHeight, align=V_UP, $fn=30); // TRRS
    forward(2) up(toolHeight-1.5) color("blue") cyl(d=10.1, h=1.5, align=V_UP, $fn=30); // TRRS lip
    forward((toolDepth/2)-(5/2)+2) color("purple") cuboid([2,5,toolHeight], align=V_UP);
    
  }//difference
}

