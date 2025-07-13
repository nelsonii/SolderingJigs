include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=60;

toolWidth=127; //5"
toolDepth=18;
toolHeight=4;

spacing = 14;

trrsDiam=8.2;
trrsLip=10.2;

tool();

module tool() {  
  difference(){
    union() {
      color("orange") cuboid([toolWidth, toolDepth, toolHeight], align=V_UP); //base jig
      color("orange") cuboid([toolWidth+5, toolDepth, 2], align=V_UP); //to fit into vise 
    }
    left(spacing*3) trrs(); 
    left(spacing) trrs();
    right(spacing) trrs(); 
    right(spacing*3) trrs();
    
  }//difference
}

module trrs() {
    color("green") cyl(d=trrsDiam, h=toolHeight, align=V_UP); // TRRS
    up(toolHeight-1.5) color("blue") cyl(d=trrsLip, h=1.5, align=V_UP); // TRRS lip
}