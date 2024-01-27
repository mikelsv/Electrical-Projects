include <../libraries/base_components.scad>
include <../libraries/base_design.scad>

$fn = 32;

*%translate([24.5, 1.5, 1])
import("Human Acu Tester.stl");

// Defines
BOARD_SIZE = [53, 18, 2, 2];


MainBoard();

module MainBoardDesign(h){
  pois = [
    [1.5, 0], [1.5, 4], [9, 3.5], [9, 11]
    ,[37, 11], [37, 5],  
    [47, 0, 15],
    [40, -3.5], [9, -3.5], [1.5, -4], [1.5, -0]
  ];
  
  BdBoardHullCall(pois, h, center = [10, 0]);
  //BdBoardHullCall(pois, h, [-1, 0, 0]);  
}


module MainBoard(){
  S0 = BOARD_SIZE;
  S0L = S0[3] - .2 * 1;
  S0M = [0, 3, -S0[3]];
  S0UP = 5;
  
  difference(){
    union(){
      // Main board   
      *translate(S0M + [0, -S0[1] / 2, 0])
        cube([S0[0], S0[1], S0[2] + S0[3]]);
      
      // Main Board Design
      translate([0, 0, -S0[3]])
        MainBoardDesign(S0[2] + S0[3]);  

    }
    
    // Down Line //
    
    // USB Micro
    translate([0, 0, 0])
      rotate([0, 0, 180])
        BcUsbMicro(legsz = S0L);
    
    // Cap 10uF
    translate([10, 0, 0])      
      #BcCapacitorDisc(legsz = S0L, rot = 90);
    
    // 2N2222 - Q3
    translate([15, 0, 0])
      #BcTo92(legsz = S0L, rot = -90);
  
    // 2N2222 - Q2
    translate([23, 1, 0])
      #BcTo92(legsz = S0L, rot = -90);  
    
    // 2N2222 - Q1
    translate([30, 2, 0])
      #BcTo92(legsz = S0L, rot = -90);
      
    // R1
    #translate([35, 4, 0])
      BcResistorVert(legsz = S0L, rot = -30);
      
    // Cap 22nF
    translate([35, -2, 0])      
      #BcCapacitorDisc(legsz = S0L, rot = 90 + 30);

    // RV09
    translate([45, 0, 0])
      rotate([0, 0, -90])
        BcResRv09(legsz = S0L);

    
    // Top Level //
    
    // Human +
    translate([10, 9, 0])
      BcPin254(legsz = S0L); 
      
    // Rs
    #translate([15, 7, 0])
      BcResistorVert(legsz = S0L);
   
    // Rs
    for(x = [25, 30])
    #translate([x, 9, 0])
      BcResistorVert(legsz = S0L);
      
    // Led 
    #translate([20, 9, 0])
      rotate([0, 0, 90])
        BcLed3mm(legsz = S0L);
   
      
    // Human -
    translate([36, 9, 0])
      BcPin254(legsz = S0L);    

    
    
  }

}