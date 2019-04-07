$fn=120;

basel=29;
basew=18;
baseh=2;

inbasel=34;
inbasew=14;
inbaseh=5;

cut1l=30;
cut1w=11;
cut1h=5;
cut1z=baseh;

cut2l=11;
cut2w=basew;
cut2h=5;
cut2z=3;

hole1x=inbasel-19;
hole2x=hole1x-9.5;
holer=2.5/2;


clpl=2;
clpw=8;
clph=1.5;

clpx=inbasel-1-clpl;
clpslx=3;

//couter sink
csw=5/2;
csd=1;

difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
difference(){
    //main base plus upper portion
union(){
        cube([basel,basew,baseh]);
        translate([0,(basew-inbasew)/2,0])
        cube([inbasel,inbasew,inbaseh]);
}
    //cutout1
    translate([0,(basew-cut1w)/2,cut1z])
    cube([cut1l,cut1w,cut1h]);
}
    //cutout2
    translate([(inbasel-cut2l),(basew-cut2w)/2,cut2z])
    cube([cut2l,cut2w,cut2h]);
}
    //cutout3 slant front
    translate([inbasel-2,0,3,])
    rotate(a=[0,20,0])
    cube([3,basew,3]);
}
    //cutout3 slant front
    translate([(inbasel-cut2l)-2,0,5,])
    rotate(a=[0,45,0])
    cube([3,basew,3]);
}
    //hole1
    translate([hole1x,basew/2,0])
    cylinder(h=10,r=holer);
}
    //hole2
    translate([hole2x,basew/2,0])
    cylinder(h=10,r=holer);
}
    //clip cutout
    translate([clpx,(basew-clpw)/2,0])
    union(){
    cube([clpl,clpw,clph]);
    rotate(a=[-90,0,0])
    linear_extrude(height=clpw)
    polygon(points=[[0,0],[0,-clph],[-clpslx,0]]);
    }
}
    //backcut
    rotate(a=[-90,0,0])
    linear_extrude(height=basew)
    polygon(points=[[0,0],[0,-inbaseh],[2,-inbaseh]]);

}
    //countersink2
    translate([hole1x,basew/2,baseh-csd])
    cylinder(h=csd,r1=holer,r2=csw,center=false);
}
    //countersink2
    translate([hole2x,basew/2,baseh-csd])
    cylinder(h=csd,r1=holer,r2=csw,center=false);
}






