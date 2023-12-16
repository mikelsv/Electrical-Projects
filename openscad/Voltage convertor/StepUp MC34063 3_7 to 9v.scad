include <../libraries/base_components.scad>
$fn = 32;

// Version 1.1 (11.12.2023)
// Base models

// Version 1.2 (16.12.2023)
// + Logic magnet board
// + Refactory code
// + Closed case

// ToDo:
// Battery door


// Configure
MODE_MAIN_BOARD = 10; // Main Board
MODE_MAIN_BOARD_UP = 11; // Main Board Up
MODE_LOGIC_BOARD = 20; // Logic board
MODE_DRILL_BOARD = 21; // Drill board
MODE_MAGNET_BOARD = 30; // Logic magnet board
// Test
MODE_SHOW_FULL_MAIN = 0; // Show main up & down

// Select mode
MODE = MODE_SHOW_FULL_MAIN; // <-----------

// Select options
HOLE_UP = 0.2; // Move hole to up (mm)
INVERSE_IT = 0; // Inverse logic sheme 180 degrees
HOLES_Y = 6.35 - 1.24; // Holes y +- position

if(MODE == MODE_SHOW_FULL_MAIN)
  ShowFullMain();
else if(MODE == MODE_MAIN_BOARD)
  MainBoard();
else if(MODE == MODE_MAIN_BOARD_UP)
  MainBoardUp();
else if(MODE == MODE_LOGIC_BOARD)
  LogicBoard();
else if(MODE == MODE_DRILL_BOARD)
  LogicBoard(2);
else if(MODE == MODE_MAGNET_BOARD)
  LogicMagnetBoard();

// Defaults
MAIN_BOARD_SZ = [45, 26, 3, 2.5];
MAIN_BOARD_CON_1 = [18, 9];
MAIN_BOARD_CON_2 = [-20, 9];
// Up
//MAIN2_BOARD_SZ = [45, 26, 1];

// Logic
LOGIC_BOARD_SZ = [32, 17, 2, 2];
LOGIC_BOARD_POS = [-5, 8, 6];


// Difference base logic
module BaseLogic(holes_y = HOLES_Y, SDZL = 0){  
  // MC34063
  DIP8(legsz = SDZL);
  
  // Holes
  for(x = [-1.5, -.5, .5, 1.5])
  for(y = [-1, 1])
  translate([x * 2.54, y * holes_y, -SDZL])
  cylinder(5 + 5, d = 1.5);
  
  // Power In
  for(y = [-1, 1])
  translate([-7, y * 2.54, -SDZL])
    cylinder(10, d = 1.5);
  
  // Result
  for(rc = [[0, -1], [0, 1], [1, -1], [1, 1], [.5, -1.5], [.5, 1.5]])
  //for(x = [0, 1])
  //for(y = [-1, 1])
  translate([7 + rc[0] * 2.54, rc[1] * 2.54, -SDZL])
    cylinder(10, d = 1.5);
}

module LogicMagnetBoard(){
  S0 = LOGIC_BOARD_SZ;
  MX = 0;
  SDZL = S0[3] - HOLE_UP;

  difference(){
    // Board
    translate([-S0[0] / 2 + MX, -S0[1] / 2, -S0[3]])
      cube([S0[0], S0[1], S0[2] + S0[3]]);

    // Base logic
    translate([0, 1, 0])
      rotate([0, 0, INVERSE_IT * 180])
      BaseLogic(SDZL = SDZL);

    // Gercon (20x3) 
    translate([-11, -7, 1])
    //scale([1, 1, 10])
    rotate([0, 90, 0])
    #hull(){
      cylinder(22, d = 3.6);
      
      translate([1, 0, 0])
      cylinder(22, d = 3.6);
    }
  }
}

module ShowFullMain(){
  MainBoard();
  
  translate([0, 0, 14.5])
  rotate([180, 0, 0])
  MainBoardUp();
  
  // Crona
  SC0 = [48, 26, 17];
  
  translate([-SC0[0] / 2, -SC0[1] / 2, -2.5])
    %cube(SC0);
}

module MainBoardUp(){
  S0 = MAIN_BOARD_SZ; // Main board
  P0 = MAIN_BOARD_CON_1; // Connection points
  P1 = MAIN_BOARD_CON_2;
  SDZ = S0[3];

  difference(){
    union(){
    // Board
    translate([-S0[0] / 2, -S0[1] / 2, 0])
      cube([S0[0], S0[1], 1]);
      
      // SY wall
      translate([-S0[0] / 2, -S0[1] / 2, 0])
      cube([S0[0], 2, 11]);
      
      // Output wall
      translate([18.5, -S0[1] / 2, 0])
        cube([4, S0[1], 5]);
      
      // Battery wall
      *translate([-22.5, -4, 5 + BUT_UP])
      rotate([0, 90, 0])
      cylinder(2.0, d = 17);
      }
    
    // Crona connector
    translate([20, -25 / 2, 1])
      cube([2, 25, 20]);
    
    // Logic Board
    POS = LOGIC_BOARD_POS;
    //  rotate([90, 0, 180])
    translate([0, 0, 0])
    #translate([POS[0], -POS[1], POS[2]])
      //rotate([-90, 180, 0])
    //rotate([90, 180, 180])
      rotate([-90, 0, 180])
    #LogicBoard(FILL = 1);    
      
    // Connection
    for(p = [P0, P1])
    translate([p[0], -p[1], -2]){
      // Hole
      #cylinder(20, d = 2);
      
      // Bolt
      rotate([0, 0, 90])
      #cylinder(2, d = 4);
    }    
  }
}

module MainBoard(){
  S0 = MAIN_BOARD_SZ; // Main board
  P0 = MAIN_BOARD_CON_1; // Connection points
  P1 = MAIN_BOARD_CON_2;
  
  SDZ = S0[3];
  SDZL = S0[3] - HOLE_UP;
  
  BUT_UP = 1.2;
  
  difference(){
    union(){
      // Board
      translate([-S0[0] / 2, -S0[1] / 2, -S0[3]])
        cube([S0[0], S0[1], S0[2] + S0[3]]);
      
      // SY wall
      translate([-S0[0] / 2, -S0[1] / 2, 0])
      cube([S0[0], 2, 9]);
      
      // Battery wall
      translate([-22.5, -4, 5 + BUT_UP])
      rotate([0, 90, 0])
      cylinder(2.0, d = 17);
      
      *translate([+18, 4, 5 + BUT_UP])
      rotate([0, 90, 0])
      cylinder(3.5, d = 17);
    }
    
    // Battery
    translate([0, -4, 5 + BUT_UP])
    rotate([0, 90, 0])
      Bat18650Half(center = true);
    
    // Battery VCC+
          // Battery wall
      translate([-22.5, -4, 5 + BUT_UP])
      rotate([0, 90, 0]){
          translate([0, 0, 2])
          cylinder(2.0, d = 17);

          translate([0, 0, 1])
          #cylinder(1.0, d = 7.5);

          #cylinder(1.0, d = 2.2);      
      }
    
    // Crona connector
    translate([20, -25 / 2, -2])
    cube([2, 25, 20]);
    
    // Logic Board
    #translate(LOGIC_BOARD_POS)
    rotate([90, 0, 180])
    LogicBoard(FILL = 1);    
      
    // Connection
    for(p = [P0, P1])
    translate([p[0], p[1], -SDZ]){
      // Hole
      #cylinder(20, d = 2);
      
      // Nut
      rotate([0, 0, 90])
      #cylinder(2, d = 5, $fn = 6);
    }
     
   // Clear max height
    translate([-S0[0] / 2, -S0[1] / 2, 13])
      cube([S0[0], S0[1], 3]);
  }
}

module LogicBoard(FILL = 0){
  S0 = LOGIC_BOARD_SZ;
  MX = -4;
  SDZL = S0[3] - HOLE_UP;
  
  SX = S0[0];
  
  SY = S0[1];
  SZ = S0[2];
  SDZ = S0[3];
  //SDZL = SDZ - .2;

  if(FILL == 1){
    FSX = SX + .5;
    FSY = SY + .5;
    BS = 7 + .5;
    
    // Board
    translate([-FSX / 2 + MX, -FSY / 2, -SDZ])
      cube([FSX, FSY, SZ + SDZ]);  
    
    translate([-14, -5, 0])
    translate([-BS / 2, -3.5, -BS / 2])
    cube([BS + 22, 7, BS]);
    
    translate([-14 + 9, -5, 2])
    translate([-BS / 2, -3.5, -BS / 2])
    cube([BS + 12.5, 7, BS]);
  } else if(FILL == 2){
    FSX = SX;// + .5;
    FSY = SY;// + .5;
    BS = 7;// + .5;
    
    difference(){
      union(){
        // Board
        translate([-FSX / 2 + MX, -FSY / 2, -SDZ])
          cube([FSX, FSY - 5, SZ + SDZ]);
        
        translate([-14, -5, 0])
        translate([-BS / 2, -3.75, -BS / 2])
        cube([BS + 22, 7, BS]);
        
        *translate([-14 + 9, -5, 2])
        translate([-BS / 2, -3.75, -BS / 2])
        cube([BS + 12.5, 7, BS]);
      }
      
      // Drill hole 7x7
      translate([-14, 11.5, 0])
        rotate([90, 0, 0]){
          *#cylinder(20, d = 1.5);
          
          #translate([0, 0, +1.0])
          cylinder(20, d = 4);          
        }
        
      // Drill hole led 3mm
      translate([-8, 11.5, 0])
        rotate([90, 0, 0]){
          *#cylinder(20, d = 1.5);
          
          #translate([0, 0, +1])
          cylinder(20, d = 3);          
        }      
    }
  } else

  difference(){
    union(){
    // Board
    translate([-S0[0] / 2 + MX, -S0[1] / 2, -S0[3]])
      cube([S0[0], S0[1], S0[2] + S0[3]]);
      
      // Switch case
      translate([-17.5, -5, 0])
      cube([7, 5.5, 3.5]);
    }
    
    // Base logic
    translate([INVERSE_IT * 6, 0, 0])
    rotate([0, 0, INVERSE_IT * 180])    
      BaseLogic(SDZL = SDZL);
    
    // Switch
    translate([-14, -2, 0])
    rotate([90, 90, 0])
    #BcSwitch7x7Full(legsz = 4);
    
    // + Wire contact
    translate([-14, 3.0, -SDZL])
      cylinder(10, d = 1.5);
    
    // Led
    translate([-7-1, -8, 0])
    rotate([90, 90, 0])
    BcLed3mmMod(legsz = 13);
    
    // Led to Power
    line([-8, -1, SZ - .5], [-12, 3, SZ], .5);
    
    // Led resistor
    *translate([-10, 2.5, -SDZL])
      cylinder(10, d = 1.5);
    // + Body
    translate([-7, 2.5, -SDZL + 1])
      cylinder(10, d = 3);
  }  
}

module BcLed3mmMod(legsz = BC_OPT_LEGSZ){
  cylinder(5, d = 3);
  cylinder(1, d = 4.5);
  
  for(x = [-1, 1]){
    translate([x * 1.27, 0, -legsz - x * 6])
    cylinder(legsz + x * 6, d = 1);
    
    translate([x * 1.27 + x * .5, 0, -legsz -x * 6])
    cylinder(legsz + x * 6, d = 1);  
  }
}

module line(start, end, thickness = 1) {
    hull() {
        translate(start) sphere(thickness);
        translate(end) sphere(thickness);
    }
}