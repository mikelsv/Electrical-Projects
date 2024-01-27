// Basic components library

// Defines
BC_OPT_LEGSZ = 5;
BC_OPT_ADDSZ = .5;
BC_OPT_POIDIA = 1.5;

// Function options
// rot - rotate in degrees
// addsz - add value to x and y size 
// legsz - legs size


// Battery
module Bat18650Half(center = false, add_length = 0, add_size = 0){
  // 38 x 17mm

  if(center == false)
    cylinder(38 + add_length, d = 17 + add_size);
  else
    translate([0, 0, -(38 + add_length) / 2])
    cylinder(38 + add_length, d = 17 + add_size);  
}

// DIP
module BcDipSize(rot, size, pois, dia, legsz){
  rotate([0, 0, rot]){
    translate([-size[0] / 2, -size[1] / 2, 0])
      cube(size);
  
    for(i = [0 : 1 : len(pois) - 1]){
      translate(pois[i])
        cylinder(legsz + 5, d = dia);     
    }  
  }  
}

module BcDipMode(size, pins = 1, rot = 0, addsz = BC_OPT_ADDSZ, dia = BC_OPT_POIDIA, legsz = BC_OPT_LEGSZ){
  
  S0 = [size[0] + addsz, size[1] + addsz, size[2]];
  
  // Legs  
  
  *for(i = [0 : 1 : pins - 1])
    translate([2.54 * (i - pins + pins / 2 + .5), 0, -legsz])
      cylinder(legsz + 10, d = 1.5); 
  
  pois = [
    for(x = [0 : 1 : pins - 1])
      for(y = [-1, 1])
        [2.54 * (x - pins + pins / 2 + .5), y * size[1] / 2, -legsz]
  ];
  
  BcDipSize(rot, S0, pois, dia, legsz);
}

module BcDip4W5_08(rot = 0, addsz = BC_OPT_ADDSZ, dia = BC_OPT_POIDIA, legsz = BC_OPT_LEGSZ){
  
  S0 = [5.08 + addsz, 5.08 + addsz, 5];
  
  pois = [
    for(x = [-.5, .5])
      for(y = [-1, 1])
        [x * 2.54, y * 5.08 / 2, -legsz]
  ];
  
  BcDipSize(rot, S0, pois, dia, legsz);
}


module BcDip8(rot = 0, addsz = BC_OPT_ADDSZ, dia = BC_OPT_POIDIA, legsz = BC_OPT_LEGSZ){
  
  S0 = [9.4 + addsz, 6.2 + addsz, 5];
  
  pois = [
    for(x = [-1.5, -.5, .5, 1.5])
      for(y = [-1, 1])
        [x * 2.54, y * 7.62 / 2, -legsz]
  ];
  
  BcDipSize(rot, S0, pois, dia, legsz);
}

// POI
module BcPoi(x, y, dia = BC_OPT_POIDIA, legsz = BC_OPT_LEGSZ, up = 0){
  translate([x, y, -legsz])
    cylinder(legsz + up, d = dia);
}

// Switch
module BcSwitch7x7(pox_x = 0, pos_y = 0){
  for(x = [-2.54 : 5.08 : 2.54])
    for(y = [-1.9 : 1.9 : 1.9])
      BcPoi(x, y);
}

module BcSwitch7x7Full(add = .3, legsz = BC_OPT_LEGSZ, up = 0, leg_dia = BC_OPT_POIDIA){
  sz = 7 + add;
  
  translate([-sz / 2, -sz / 2, 0])
  cube([sz, sz, sz + up]);
  
  translate([0, 0, -legsz])
  for(x = [-2.54 : 5.08 : 2.54])
    for(y = [-1.9 : 1.9 : 1.9])
      translate([x, y, 0])
      cylinder(legsz + 1, d = leg_dia);
      //Poi(x, y);
}

module BcButton6x6(add = .2, hsz = 4, legsz = BC_OPT_LEGSZ){
  rs = 6 + add;
  
  translate([- rs / 2, -rs / 2, 0])
  cube([rs, rs, hsz]);

  for(x = [-1: 2 : 1])
    for(y = [-1: 2 : 1])
      translate([x * 2.5, y * 2.6, -legsz])
      cylinder(legsz, d = 1);
}

module BcLed3mm(legsz = BC_OPT_LEGSZ){
  cylinder(5, d = 3);
  cylinder(1, d = 4.0);
  
  for(x = [-1, 1])
    translate([x * 1.27, 0, -legsz])
    cylinder(legsz, d = 1);
}

module BcLed5mm(legsz = BC_OPT_LEGSZ){
  cylinder(5, d = 5);
  cylinder(1, d = 6.0);
  
  for(x = [-1, 1])
    translate([x * 1.27, 0, -legsz])
    cylinder(legsz, d = 1);
}

module BcResRv09(legsz = BC_OPT_LEGSZ, add = .2){
  S0 = [12 + add, 10 + add, 6];
  
rotate([0, 0, -90]){
  // Body
  translate([0, 0, 3])
  cube(S0, center = true);
  
  // Plastic stoppers
  for(x = [-4.5, 4])
    translate([x, 0, -1.5])
    cylinder(2, d = 1.5);
  
  // Connectors
  for(y = [-1, 0, 1])    
    translate([7, y * 2.5, -legsz])
      scale([.7, 1.3, 1])
      cylinder(legsz + 5, d = 1.5);

  // Connectors holes
  for(y = [-1, 0, 1])    
    translate([6, y * 2.5, -legsz])
      scale([1.2, 1, 1])
      cylinder(legsz + 5, d = 1.5);
  
  // Holders (left & right)
  for(y = [-1, 1])
    translate([0, y * 5, -legsz])
    scale([1, .15, 1])
    cylinder(legsz + 5, d = 6.5);
}
}

module BcRm063(legsz = 10, up = 5, add = .2){
  x = 6.5;
  y = 5.5;
  
  csx = 6.5 + add;
  csy = 4 + add;
  
  #translate([- csx / 2, - csy / 2, 0])
    cube([csx, csy, 5]);
  
  for(p = [[-1, 1], [0, -1], [1, 1]])
    BcPoi(p[0] * 2.54, p[1] * 2.54 / 2, legsz = legsz, up = up);  
}

module BcRm065(legsz = 10, up = 5, add = .2){
  x = 7.3;
  y = 6.5;
  
  csx = 6.5 + add;
  csy = 4 + add;
  
  translate([- csx / 2, 0, 0])
  cube([csx, csy, 5]);
  
  cylinder(5, d = 6.5);
  
  for(p = [[-1, 1], [0, -1], [1, 1]])
    scale([1.6, 1, 1])
    BcPoi(p[0] * 1.4, p[1] * 2.54, legsz = legsz, up = up);  
}

module BcResistor(length, dia, pitch, rot = 0, legsz = BC_OPT_LEGSZ, legdia = BC_OPT_POIDIA){
  
  rotate([0, 0, rot]){  
    // L
    rotate([0, 90, 0])
    translate([0, 0, -length / 2])    
      hull(){
        cylinder(length, d = dia);
        
        translate([-5, 0, 0])
        cylinder(length, d = dia);
      }
    
    // Wire      
      hull()
    for(z = [0, 1])      
        translate([0, 0, z * 3])      
    rotate([0, 90, 0])
    translate([0, 0, -pitch / 2])  
    cylinder(pitch, d = legdia); 
   
    // Leg
    translate([-pitch / 2, 0, -legsz])
    //rotate([180, 0, 0])
    cylinder(5 + legsz, d = 1);
    
    // Leg
    translate([+pitch / 2, 0, -legsz])
    //rotate([180, 0, 0])
    cylinder(5 + legsz, d = 1);  
  }
}

module BcResistorVert(dia = 2.8, rot = 0, legsz = BC_OPT_LEGSZ, up = 5){
 
  rotate([0, 0, rot]){
    cylinder(10, d = dia);
  
    translate([0, 0, -legsz])
      cylinder(legsz + 10, d = 1.5);
 
    BcPoi(0, -2.54 / 2 - dia / 2, legsz = legsz, up = up);    
  }
}

module BcCapacitorDisc(SD, legsz = 5, rot = 0){
  
  rotate([0, 0, rot]){
    // Case
    scale([1.3, .8, 1])
      cylinder(5 + 5, d = 3.5);
    
    // + legs 
    for(x = [-1, 1]){
      translate([2.54 * x, 0, 0])
        cylinder(5, d = 2);
    }
    
    // Legs
    for(x = [-1, 1]){
      translate([2.54 * x, 0, -legsz])
      cylinder(legsz + 5, d = 1);
    }
  }
}

module BcCapacitorRadial(dia = 5, legsz = 5, rot = 0){
  rotate([0, 0, rot]){
      cylinder(10, d = dia);
    
    for(x = [-1, 1]){
      translate([2.0 * x, 0, 0])
        cylinder(5, d = 2);
    }
      
    for(x = [-1, 1]){
      translate([2.54 * x / 2, 0, -legsz])
      cylinder(legsz + 5, d = 1);
    }
  }
}

// Transistors
module BcTo92(rot = 0, add = BC_OPT_ADDSZ, leg_sx = .8, leg_sy = .8, legsz = 18.8){
  len_d = 4.5;
  len_h = 4.6;

  //_LEGSZ = legs != 999 ? legs : leg_sz;

  rotate([0, 0, rot]){
    difference(){
      cylinder(len_h + add, d = len_d + add);
      
      translate([-(len_h + add) / 2, 0, 0])
      cube([len_h + add, 4.5 + len_d, 4.5 + len_h]);
    }

      translate([-(len_d + add) / 2, 0, 0])
      cube([len_d + add, 1.25, len_h + add]);
    
    if(legsz){
    leg_r = .8;// .63; // .46
      for(x = [-1 : 1 : 1])
        translate([-leg_r / 2 - 1.27 * x, -leg_sy / 2, -legsz])
          cube([leg_r, leg_sy, legsz]); // 18.8
    }  
  }
}

module BcTo126(rot = 0, addsz = .2, legsz = BC_OPT_LEGSZ){
  // 4 x 10
  D_SX = 7.72 + addsz;
  D_SY = 2.66 + addsz;
  D_SZ = 11;
  
  rotate([0, 0, rot]){
    translate([-D_SX / 2, -D_SY / 2, 0])
      cube([D_SX, D_SY, D_SZ]);
  
    for(x = [-1, 0, 1])
      translate([2.5 * x, 0, -legsz])
        scale([1.5, 1, 1])
          cylinder(legsz + 5, d = 1);
  }
}

module BcTo220(rot = 0, legsz = BC_OPT_LEGSZ){
  // 4 x 10
  D_SX = 10.5;
  D_SY = 4.5;
  D_SZ = 10;
  
  rotate([0, 0, rot]){
    translate([-D_SX / 2, -D_SY / 2, 0])
      cube([D_SX, D_SY, D_SZ]);
  
    for(x = [-1, 0, 1])
      translate([2.5 * x, 0, -legsz])
        scale([2, 1, 1])
          cylinder(legsz + 5, d = 1);
  }
}

// Pins
module BcPin254(size = 1, addsz = BC_OPT_ADDSZ, legsz = BC_OPT_LEGSZ){
  
  SX = size * 2.54 + addsz;
  SY = 2.54 + addsz;
  
  // Body
  translate([-SX / 2, -SY / 2, 0])
    cube([SX, SY, 5]);
  
  // Legs
  for(i = [0 : 1 : size - 1])
    translate([2.54 * (i - size + size / 2 + .5), 0, -legsz])
      cylinder(legsz, d = 1.5);    
}

// Usb
module BcUsbMicro(legsz = BC_OPT_LEGSZ){
  MDL_POWER_LEN = 0;
  
    // Power Usb (9 x 8 x 3)
    translate([MDL_POWER_LEN - 8, 0, 0]){
    hull()
    for(y = [-1, 1])
      translate([0, y * 2.5, 0])
      rotate([0, 90, 0])
      cylinder(8, d = 3);
    
    translate([4, 0, 5])
    cube([8, 8, 10], center = true);
  }
   
    // Power Usb Holes
    for(y = [-1, 1])
      translate([MDL_POWER_LEN - 4, y * 3.84, -legsz])
        scale([1.5, .8, 1])
        cylinder(5 + legsz, d = 1);
    
    // Power Usb Connectors (+, -)
    for(y = [-1, 1])
      translate([MDL_POWER_LEN - 8, y * 1.27, -legsz])
        cylinder(5 + legsz, d = 1);  
}

// Helpers
module BcHelperPrintBox(pos = [0, 0], size, step = 1){
  for(y = [0 : step : size[1]])
    translate([pos[0] - size[0] / 2, pos[1] - size[1] / 2 + y, 0])
      cube([size[0], .6, .2]);
}

module BcHelperPrintCircle(pos, dia = 10){
  translate([pos[0], pos[1], 0])
  intersection(){
    BcHelperPrintBox([0, 0], [dia, dia]);    
    cylinder(.2, d = dia);    
  }  
}