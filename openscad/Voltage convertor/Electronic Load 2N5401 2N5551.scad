include <../libraries/base_components.scad>
$fn = 32;

*%translate([42, 0, 1])
import("electronic load 2n5401 2n5551.stl");

// Defines
BOARD_SIZE = [84, 14, 2, 2];

// Process //

// Battery holder
*translate([42, +20 - 4 * 0 - 3, -6])
  holderR3();

// Connect 
*translate([0, 6, -BOARD_SIZE[3]])
  #cube([BOARD_SIZE[0], 2, BOARD_SIZE[2] + BOARD_SIZE[3]]);

// Main Board
//MainBoard();
MainBoardUsb();

// Helpers
*for(x = [0, .5, 1])
translate([x * 83 + 0, 00, -2.2])
  BcHelperPrintBox([0, 0], [15, 25]);

*for(y = [0, 1])
translate([42, y * 32 - 6, -2.2])
  rotate([0, 0, 90])
  BcHelperPrintBox([0, 0], [5, 60], step = 2);


// Test
*intersection(){
  MainBoard();
  
  translate([0, -10, -10])
    cube([40, 20, 20]);
}

module StepUp(MODE = 0){
  //23 x 1.5
  add = MODE == 0 ? [.3, .3] : [2.0, 2.0];
  S0 = [22.5 + add[0], 1.0 + add[1], 5 + (MODE == 0 ? 10 : 0)];
  
  //if(MODE == 0)
  difference(){
    translate([-S0[0] / 2, -S0[1] / 2, 0])
      cube(S0);
  
  if(MODE == 1){
    sx = S0[0] * .9;
    //for(x = [-1, 1])
      translate([-sx / 2, -S0[1] / 2, 0])
        cube([sx, S0[1], S0[2]]); 
  }
  }
}


module MainBoardUsb(){
  S0 = BOARD_SIZE;
  S0L = S0[3] - .2 * 1;
  S0M = [0, 0, -S0[3]];
  S0UP = 5;
  
  difference(){
    union(){
      // Main board   
      translate(S0M + [0, -S0[1] / 2, 0])
        cube([S0[0], S0[1], S0[2] + S0[3]]);
    
      // Switch box
      *translate([7, -1, 0])
      cube([8.5, 8.5, 8], center = true);
   
      // 3.7 to 12v Box
      translate([22, 6.5, 0])
        StepUp(1);
      
      // 
      translate([22, 0, -S0[3]])
        scale([2.3, 1, 1])
          cylinder(S0[2] + S0[3], d = 19);
      
  }
  
    // 3.7 to 12v
    translate([22, 6.5, 0])
      StepUp();
    
    // Power In    
    #BcPoi(10, 1, legsz = S0L, up = S0UP);
    #BcPoi(10, -1, legsz = S0L, up = S0UP);

    #translate([0, 0, 0])
      rotate([0, 0, 180])
      BcUsbMicro(legsz = S0L);

    // Power Switch
    *translate([7, -1, 0])
      rotate([0, 0, 90])
        BcSwitch7x7Full(legsz = S0L);
    
    // Led 
    #translate([45, -4, 0])
      rotate([0, 0, 90])
      BcLed3mm(legsz = S0L);
    
    // R1
    #translate([37, 5, 0])
      ResVert(legsz = S0L);
    
    // R7
    #translate([41, 5, 0])
      rotate([0, 0, 0])
        ResVert(legsz = S0L);
    
    //R hole
    //#BcPoi(15, 2, legsz = S0L, up = S0UP);
    
    // RV09
    translate([21, -3, 0])
      rotate([0, 0, 90])
        BcResRv09(legsz = S0L);
        
    // R3
    #translate([45, 5, 0])
      rotate([0, 0, 90])
        ResVert(legsz = S0L);
        
    // R2
    #translate([45, 2, 0])
      rotate([0, 0, 90])
        ResVert(legsz = S0L);
        
    // 2N5404
    translate([53, 3, 0])
      rotate([0, 0, 180])
        #BcTo92(legsz = S0L);
        
    // 2N5551
    translate([60, 3, 0])
      rotate([0, 0, -90])
        #BcTo92(legsz = S0L);
        
    // Cap 1u
     translate([57, -3, 0])      
      #BcCapacitorDisc(legsz = S0L);
      
     // R5
    #translate([65, 5, 0])
      rotate([0, 0, 0])
        ResVert(legsz = S0L);     
       
    // R4
    #translate([65, -1, 0])
      rotate([0, 0, 0])
        ResVert(legsz = S0L); 
        
    // RM065
    translate([36, -3, 0])
      rotate([0, 0, 180])
      BcRm063(legsz = S0L);
    
     // R6
    for(y = [-1, 1]){
      #BcPoi(73, y * 5, legsz = S0L, up = S0UP);
    }     
    
    // IRF530    
    translate([82, 0, 0])
      rotate([0, 0, 90])
        BcTo220(legsz = S0L);
    
    // Connection Holes
    #BcPoi(30, -3, legsz = S0L, up = S0UP);
    #BcPoi(42, -4.5, legsz = S0L, up = S0UP);
    #BcPoi(54, -1, legsz = S0L, up = S0UP);
    
    // Clear bottom
    translate([0, -50, -5 - S0[3]])
      cube([100, 100, 5]);    
  }  
  
}

module MainBoard(){
  S0 = BOARD_SIZE;
  S0L = S0[3] - .2 * 1;
  S0M = [0, 0, -S0[3]];
  S0UP = 5;
  
  difference(){
    union(){
      // Main board   
      translate(S0M + [0, -S0[1] / 2, 0])
        cube([S0[0], S0[1], S0[2] + S0[3]]);
    
      // Switch box
      translate([7, -1, 0])
      cube([8.5, 8.5, 8], center = true);
   
      // 3.7 to 12v Box
      translate([23, 6, 0])
        StepUp(1);      
  }
  
    // 3.7 to 12v
    #translate([23, 6, 0])
      StepUp();
    
    // Power In Switch, Out    
    #BcPoi(2, 1, legsz = S0L, up = S0UP);
    #BcPoi(13, 1, legsz = S0L, up = S0UP);

    // Power Switch
    #translate([7, -1, 0])
      rotate([0, 0, 90])
        BcSwitch7x7Full(legsz = S0L);
    
    // Led 
    #translate([45, -4, 0])
      rotate([0, 0, 90])
      BcLed3mm(legsz = S0L);
    
    // R1
    #translate([37, 5, 0])
      ResVert(legsz = S0L);
    
    // R7
    #translate([41, 5, 0])
      rotate([0, 0, 0])
        ResVert(legsz = S0L);
    
    //R hole
    //#BcPoi(15, 2, legsz = S0L, up = S0UP);
    
    // RV09
    translate([21, -3, 0])
      rotate([0, 0, 90])
        BcResRv09(legsz = S0L);
        
    // R3
    #translate([45, 5, 0])
      rotate([0, 0, 90])
        ResVert(legsz = S0L);
        
    // R2
    #translate([45, 2, 0])
      rotate([0, 0, 90])
        ResVert(legsz = S0L);
        
    // 2N5404
    translate([53, 3, 0])
      rotate([0, 0, 180])
        #BcTo92(legsz = S0L);
        
    // 2N5551
    translate([60, 3, 0])
      rotate([0, 0, -90])
        #BcTo92(legsz = S0L);
        
    // Cap 1u
     translate([57, -3, 0])      
      #BcCapacitorDisc(legsz = S0L);
      
     // R5
    #translate([65, 5, 0])
      rotate([0, 0, 0])
        ResVert(legsz = S0L);     
       
    // R4
    #translate([65, -1, 0])
      rotate([0, 0, 0])
        ResVert(legsz = S0L); 
        
    // RM065
    translate([36, -3, 0])
      rotate([0, 0, 180])
      BcRm063(legsz = S0L);
    
     // R6
    for(y = [-1, 1]){
      #BcPoi(73, y * 5, legsz = S0L, up = S0UP);
    }     
    
    // IRF530    
    translate([82, 0, 0])
      rotate([0, 0, 90])
        BcTo220(legsz = S0L);
    
    // Connection Holes
    #BcPoi(30, -3, legsz = S0L, up = S0UP);
    #BcPoi(42, -4.5, legsz = S0L, up = S0UP);
    #BcPoi(54, -1, legsz = S0L, up = S0UP);
    
    // Clear bottom
    translate([0, -50, -5 - S0[3]])
      cube([100, 100, 5]);    
  }  
  
}



module ResVert(legsz = 10, up = 5){  
  cylinder(10, d = 2.8);
  
  translate([0, 0, -legsz])
  cylinder(legsz + 10, d = 1.5);
 
  BcPoi(0, -2.54, legsz = legsz, up = up);  
}


/* 1.0 30.08.2022
+ 4 mm case length. +1 jum
Buttery Z + .5 mm. Dia + .4.
Buttery up + 1 mm.
Battery center M4. Z + 2mm.
*/

// Parameters
//* // 12mm board
bx = 75; //69.85;
by = 12.7;
bl = 80 + 4; // nihrom = 86
bd_y = 18; // Board y
bth_rad = 24; // Battery holder radius
bth_sx = 4; // Battery holder len
// Bat holders d = 28 !
// */

OPT_FULL_LENGTH = 0;
OPT_HALF_LENGTH = 1;


module holderR3(){
  // Board height
  bh = 3;
  
  //* // 30
  ring_dia = 30;
  rinh_down = 3;
  bat_dia = 23.5;
  //*/
  
  // Battery
  *translate([-67 / 2, 0, 13])
  rotate([90, 0, 90])
  cylinder(67, d = 18.5);  
  
  difference(){
    union(){
      cup = 2.0;
      translate([0, 0, 5])
      cube([bl, bd_y, cup], center = true);  

      // Rings
      translate([-4 + bl / 2, 0, 12])
      rotate([90, 90, 90])
      cylinder(4, d = bat_dia, $fn = 8);

      translate([- bl / 2, 0, 12])
      rotate([90, 90, 90])
      cylinder(4, d = bat_dia, $fn = 8);
      
      // Bat holders
      if(OPT_FULL_LENGTH){
        translate([- bl / 2, 0, 12])
        rotate([90, 90, 90])
        cylinder(bl, d = bth_rad, $fn = 7);        
      } else if(OPT_HALF_LENGTH){
        hlen = (bl - 0) / 8;
        pos = bl / 2 - hlen + 5;
        
        for(x = [-1, 1])        
        translate([-hlen / 2 + pos * x, 0, 12])
        rotate([90, 90, 90])
        cylinder(hlen, d = bth_rad, $fn = 7);
       
        *for(x = [-1, 1])        
        translate([-2 + 25 * x, 0, 12])
        rotate([90, 90, 90])
        cylinder(bth_sx, d = bth_rad, $fn = 7);
      } else {
        for(x = [-1, 1])        
        translate([-2 + 25 * x, 0, 12])
        rotate([90, 90, 90])
        cylinder(bth_sx, d = bth_rad, $fn = 7); 
      }     
    }
      
    // Power Con
    translate([-10 - 37, 0, 12 + 1])
    rotate([90, 90, 90])
    cylinder(100, d = 4, $fn = 30);
    
    // Battery
    #translate([-bx / 2, 0, 13 + .5])
    rotate([90, 0, 90])
    cylinder(bx, d = 18.5 + .3);
    
    // Battery Up
    translate([-74 / 2, 0, 13 + 6 + 1.])
    rotate([90, 0, 90])
    cylinder(67+7, d = 18.5);
    
    // Clear bottom
    translate([-50, -50, -1 - 0])
      cube([100, 100, 5]);   
    
  }  
}
