include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>





bid=8;
bod=12;
bbo=3.5;
heig=bbo/2; 
odiam = bod*1.6;

head=20;
addl=5;
//40mm total height

wiggle = 0.25;


mirror([0,0,1]) tool();

module tool() {  
  difference(){
    color("green") cyl(d=odiam, h=head+addl, align=V_UP, $fn=8); // handle
    color("yellow") up(head+addl) fillet_cylinder_mask(r=(odiam/2), fillet=2.5); // handle cleanup
    color("purple") cyl(d=bod+wiggle, h=heig, align=V_UP, $fn=60); // bearing
  }//difference
    color("pink") cyl(d=bid-wiggle, h=head, align=V_UP, $fn=60); // headroom
}

