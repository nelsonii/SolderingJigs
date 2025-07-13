include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>



diam=9.75;
heig=2;
head=20;
addl=10;
//40mm total height

odiam = diam*1.75;

mirror([0,0,1]) tool();

module tool() {  
  union() {
  difference(){
    color("green") cyl(d=odiam, h=head+addl, align=V_UP, $fn=12); // handle
    //color("yellow") up(head+addl) fillet_cylinder_mask(r=(odiam/2), fillet=2.5); // remark out with t-handle
    color("purple") cyl(d=diam+1.50, h=heig, align=V_UP, $fn=6); // nut
    color("pink") cyl(d=(diam-2), h=head, align=V_UP, $fn=32); // headroom
    
  }//difference
  up(head+addl-4) cuboid([odiam/2, odiam*2.5, 4], align=V_UP, chamfer=1); // new t-handle
}
}

