include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=60; //circle smoothness

// 1/2/3 imperial block
holespacing = 14.2875; //14.2875 = 0.5625" = 9/16"
holediam = 8.73125; //8.73125 = 0.34375" = 11/32"

baseThick = 5;
baseWidth = (holespacing*2)+(holediam/PI);

slotWidth = 18;

difference() {
  union()  {
    base(); 
    left(holespacing) post();
    right(holespacing) post();
  }
  slot();
  pry();
}
module base() { color("purple") cuboid([baseWidth, holediam, baseThick], align=V_UP, fillet=1, edges=EDGES_Z_ALL); }
module post() { color("green") cyl(h=5+baseThick, d=holediam, align=V_UP); }
module slot() { color("gray") prismoid(size1=[slotWidth,2.1], size2=[slotWidth, 1.9], h=3, align=V_UP); } //[x,2,3]
module pry() { color("pink") up(baseThick-1) cuboid([5, 10, 1], align=V_UP); }