// Power Unit 24V 6A
$fn = 32;

// Defines
SHOW_FULL = 0; // Full design
SHOW_2D = 1; // Full design First Layer. Export to PDF
SHOW_FRONT = 2; // Front Panel
SHOW_FRONT_LEFT = 20; // Front Panel - Only left
SHOW_FRONT_RIGHT = 21; // Front Panel - Only right
SHOW_BACK = 3; // Back Panel Left / RIght
SHOW_POWER_DOWN = 40; // Power Down
SHOW_POWER_UP = 41; // Power Up
SHOW_USB_FRONT = 50; // USB Holder. Front
SHOW_USB_BACK = 51; // USB Holder. Back

// Select model by define
MODEL = SHOW_FULL; // <------------------

// Extension options
STABLE = 0;
// Set stable
// 0 - No
// 1 - Yes

// Show model
ShowModelId(MODEL, STABLE);

// Modules
module ShowModelId(MODEL, STABLE){
  if(MODEL == SHOW_FULL)
      ShowFullDesign();

  if(MODEL == SHOW_2D)
    projection(cut=true)
      translate([-55, -40, 0])
      ShowFullDesign();   
    //ShowBottomPanel();
    
  if(MODEL == 2)
    rotate([-115, 0, 0])
    ShowFrontPanel();

  if(MODEL == 20){
    rotate([-115, 0, 0])
    intersection(){
      ShowFrontPanel();
      
      translate([0, -50, -50])
      cube([59 + 0, 100, 100]);
    }
    
    if(STABLE)
      for(x = [4, 55])
        translate([x, 5, -18.3])
          PrintLayerOne();
  }
    
  if(MODEL == 21){
    rotate([-115, 0, 0])
    intersection(){
      ShowFrontPanel();
      
      translate([59, -50, -50])
      cube([59, 100, 100]);
    }

    if(STABLE)
      for(x = [73, 106])
        translate([x, 5, -18.3])
          PrintLayerOne();
  }

  if(MODEL == 3){
    ShowBackPanel();
  }
  
  if(MODEL == 40)
    ShowPowerDown();
  
  if(MODEL == 41)
    ShowPowerUp();
  
  if(MODEL == 50)
    ShowUsbFront(); 
  
  if(MODEL == 51)
    ShowUsbBack();   
}

module ShowUsbFront(){
  S0 = [18, 24, 23];  
  S1 = [18, 15, 16];  
  F0 = [10, 19, 1.8]; // Plate
  F1 = [18, 15.5, 16];
  
     difference(){
    union(){
      // Body
      translate([0, -S0[1] / 2, 0])
        cube(S0); 
      
      for(i = [-1, 1])        
      translate([4, -15 * i, 0])
      rotate([0, 0, 90 * i])
        difference(){
        hull(){
          cylinder(3, d = 8);
          
          translate([10, 0, 0])
            cylinder(3, d = 8); 
        }
        
        cylinder(10, d = 2);
        
        translate([0, 0, 1])
        cylinder(10, d = 5, $fn = 6);
      }      
    }
    
    // Electronic element
      translate([0, -F1[1] / 2, 3 + F0[2] + .1])
      difference(){
        cube(F1);
        //cube([F1[0], F1[1], .5]);
      }
    
    // Plate
    translate([8, -F0[1] / 2, 3])
      cube(F0);
    
    // Legs
    translate([8, -8, 0])
    cube([F0[0], 16, 3]);    
  } 
}

module ShowUsbBack(){
  S0 = [10, 25, 3 + 1.5 + 10 + 3];
  F0 = [10, 19.2, 1.8]; // Plate
  F1 = [10, 11, 10.5];
  
    difference(){
    union(){
      // Body
      translate([0, -S0[1] / 2, 0])
        cube(S0);
      
      // Bolt connector
      for(i = [-1, 1])
        translate([-5, i * 8.5, 0])
        difference(){
          hull(){
            cylinder(3, d = 8);
            
            translate([5, 0, 0])
            cylinder(3, d = 8);
          }
          
          cylinder(3, d = 2);
          
          translate([0, 0, 1])
          cylinder(3, d = 5, $fn = 6);
        }
    }
    
    // Up holes
    for(i = [-1, 1])
        translate([6, -2.54 * i, 3 + F0[2] + F1[2] + .2])
          #cylinder(3, d = 4.5);
    
    // Electronic element
      translate([0, -F1[1] / 2, 3 + F0[2] + .1])
      difference(){
        cube(F1);
        cube([F1[0], F1[1], .4]);
      }
    
    // Plate
    translate([2, -F0[1] / 2, 3])
      cube(F0);
    
    // Legs
    translate([0, -6.5 / 2, 0])
    cube([F0[0], 6.5, 3]);    
  }
  
}

module ShowFullDesign(){
  // Front
  translate([0, 0, 18])
  ShowModelId(2);

  // Usb
  translate([110, 40, 0])
  rotate([0, 0, 180])
    ShowModelId(50);
  
  // + back
  translate([110 - 58 - 8 - 2 - 2, 40, 0])
    ShowModelId(51);
  
  *translate([67 / 2, 35, 0])
  cube([67, 19, 3], center = true);  
  
  // Power
  translate([109, 70, 0])
  rotate([0, 0, 180])
  ShowModelId(40);
  
  // XL4015
  translate([50, 75, 0])
  ShowBottomPanel();
  
  // Backend
  translate([0, 100, 0])
  rotate([0, 0, -90])
  ShowModelId(3);
  
  translate([110, 100, 0])
  rotate([0, 0, -180])
  ShowModelId(3);
  
}

// Model modules & test
//PowerDown();
//Display();
//PowerButton();
//PowerButtonTest();

*translate([-10, 2, -18.11])
ShowBackPanel();

//PrintLayer();

module ShowPowerDown(){
  S0 = [21, 20, 1];
  
  difference(){
    union(){
      // Body
      translate([-1, -S0[1] / 2, 0])
        cube(S0);
      
      translate([-1, -S0[1] / 2, 0])
        cube([1, S0[1], 2]);
    }  
  
    // Bolts
    for(y = [-1, 1]){
      translate([7.5, y * 7, 0]){
        cylinder(8, d = 2);
       
        translate([0, 0, 5])
          cylinder(3, d = 5, $fn = 6);
      }
    }
  
    // Power down holes
    translate([4.5, 0, 0])
      cylinder(10, d = 2);
    
    translate([9, 0, 0])
      cylinder(10, d = 2);    
  }
}

module ShowPowerUp(){
  // 10 x 11
  
  difference(){
    union(){
      // Up
      translate([0, -7, 0])
      cube([15, 14, 13]);    
      
      // Down
      translate([0, -10, 0])
      cube([15, 20, 2]);
      
      // Cylinders
      for(y = [-1, 1])
        translate([0, y * 5, 2])
          rotate([0, 90, 0])
            intersection(){
              cylinder(15, d = 10);
              
              translate([-10, -5, 0])
              cube([10, 10, 15]);
          }
    }
      
    // Power Box
    translate([0, -5, 0])
      cube([14, 10, 11]);
    
    // Bolts
    for(y = [-1, 1]){
      translate([7.5, y * 7, 0]){
        cylinder(8, d = 2);
       
        translate([0, 0, 5])
          cylinder(3, d = 5, $fn = 6);
      }
    }
    
    // Free
    for(y = [-1, 1])
    translate([2, y * 6, 0.5])
      scale([3.5, 1, 4])
        rotate([0, 90, 0])
          //translate([0, 0, -5])
          #cylinder(5, d = 1);
      //sphere(3);
    //cylinder(2, d = 4);
  
    // Free
    translate([2, -6, 0])
      #cube([1, 12, 3]);
    
     translate([13, -6, 0])
      #cube([1, 12, 3]);
  } 
}

// Add Leg + M2 hole
module AddLegs(length = 10){
  difference(){
    hull(){
      translate([-length, 0, 0])
      cylinder(3, d = 8);
      
      cylinder(3, d = 8);
    }

    cylinder(3, d = 2);
      
    translate([0, 0, 1])
      cylinder(30, d = 5, $fn = 6);    
  }
}

module BackPanelElement(){
  linear_extrude(height = 3)
  polygon(points=[[0, 0], [12, 0], [12, 3], [10,  5],
  [10, 27], [13, 32], [13, 32]
  , [0, 32]]);  
}

module BackPanelElement2(RIGHT = 0){
  // LR: 0 - Left, 1 - Right
  LEFT = RIGHT == 0 ? 1 : 0;
  
  translate([0, 3 * LEFT, 0])
  rotate([90, 0, 0])
  difference(){
    BackPanelElement();
    
    // Nut holders
    for(y = [8.5, 25]){
      translate([6, y, 0]){
        cylinder(10, d = 2);
        
        translate([0, 0, RIGHT == 0 ? 1 : 0])
        #cylinder(2, d = 5, $fn = 6);
      }
    }
  }
  
  translate([14, 4 * (LEFT == 1 ? 1 : -1), 0])
    AddLegs();
}

module ShowBackPanel(){
  BackPanelElement2(0);
  
  rotate([0, 0, 90])
  BackPanelElement2(1);
  
  translate([0, 0, 32])
  difference(){
    union(){
      linear_extrude(height = 3)
        polygon(points = [[0, 0], [13, 0], [13, 3], [3, 13], [0, 13], [0, 0]] );
      
      translate([0, 0, 3])
        intersection(){
          sphere(10);
          
          translate([3, 3, -9])
            cube([6, 6, 6]);
        }
    }
    
    translate([5, 5, .0]){
      translate([0, 0, -5.0])
      cylinder(50, d = 2);
      
      translate([0, 0, 1])
      cylinder(2, d = 5, $fn = 6);
    }    
  }
}


module PrintLayerOne(){
  S0 = [16, 35, 3];  
  
    translate([-S0[0] / 2, -S0[1] / 2, 0])
    for(y = [0 : 1 : S0[1]])
      translate([0, 0 + y * 1., 0])
      cube([S0[0], .7, .2]);
    //scale([1, 2, 1])
      //cylinder(.2, d = 10); 
}

module PrintLayer(){
  S0 = [100, 50, 3];  
  
  for(x = [0, 1.36, 2])
    translate([4 + x * 51, 10.66, 0])
    for(y = [-22 : 1 : 12])
      translate([-8, y * 1., 0])
      cube([16, .7, .2]);
    //scale([1, 2, 1])
      //cylinder(.2, d = 10);
  
}

module ShowBottomPanel(){
  S0 = [51, 26, 3];
  
  difference(){
    translate([-S0[0] / 2, -S0[1] / 2, -S0[2]])
      #cube(S0);
    
    for(x = [-1, 1])
      for(y = [-1, 1])
        translate([47 / 2 * x, 23 / 2 * y, 0])
          cylinder(5, d = 2);
    
    //PowerDown();
  }
}

module ShowFrontPanel(){
  S0 = [110, 37, 3];
  
  difference(){
    union(){
      // Case
      translate([0, -S0[1] / 2, 0])
        cube(S0);
      
      // Top
      translate([0, -16, 1])
      rotate([115, 0, 0])
        difference(){
          cube([S0[0], 11, S0[2]]);
          
          // Connection nut + hole
          for(x = [0, 2])
          translate([5 + x * 50, 5, .2]){
            cylinder(10, d = 2);
            
            translate([0, 0, 1])
            cylinder(2, d = 5, $fn = 6);
          }          
        }
      
      // Bottom
      translate([0, 20, 0])
      rotate([115, 0, 0])
        cube([S0[0], 11, S0[2]]);
      
      // Connection
      for(x = [0, 1, 1.36, 2])
        translate([4 + x * 51, 10.66, 20])
          rotate([115, 0, 0])
            difference(){
              hull(){
                translate([0, -12, 0])
                cylinder(3, d = 8);
                
                cylinder(3, d = 8);
              }
              
              // Bolt hole
              translate([0, 0, 0])
              cylinder(3, d = 2);
              
              // Nut
              translate([0, 0, 2])
              cylinder(3, d = 5, $fn = 6);
            }
            
      // Left-Right Walls      
      for(x = [0, 1, 1.345, 2])
      translate([x * 53.5, 0, 3])
      rotate([0, 90, 0])
      linear_extrude(height = 3)
      polygon(points=[[0,0],[0,16],[-5,16], [-5, -15], [-8, -20.7], [-0, -20]] );
            
      //for(y = [-13, 1])
      *translate([0, y, 5])
      rotate([0, 90, 0]){
        difference(){
          cylinder(3, d = 8);
          
          // M2 hole
          cylinder(3, d = 2);
          
          // Nut hole
          translate([0, 0, 0])
          cylinder(2, d = 5, $fn = 6);
        }
      }
      
      // Connectors Banana Nut control
      for(x = [-1, 1])
        translate([74 + x * 9, 9, 3])
          difference(){          
            cylinder(5, d = 12);
            
            cylinder(6, d = 8, $fn = 6);
            
            translate([-6, -6, 0])
            cube([12, 6, 8]);
          }
      
    }
    
    // Display
    translate([30, 0, -3])
    Display();
    
    // Potenciometers
    for(x = [-1, 1])
      translate([74 + x * 9, -9, 0]){
        #cylinder(10, d = 7);
        
        translate([-8, 0, 1])
        scale([3.5, 3.5, 1])
        #cylinder(5, d = 1);        
      }
      
    // + Clear
      translate([53, -6, 14])
      rotate([0, 90, 0])
      scale([1.1, 1.3, 1])
      cylinder(22, d = 20);
    
    // Connectors Banana
    for(x = [-1, 1])
      translate([74 + x * 9, 9, 0])
        #cylinder(10, d = 4);   
    
    // Power button
    translate([100, 0, -2])
      rotate([0, 0, 90])
      #PowerButton();
    
    // Left-Right nut hole
    for(r = [0, 1])
    for(y = [-1, 1])
    translate([110 * r, 0, 0])
    rotate([0, 0, 180 * r])
    translate([0, y * 9, 4])
    rotate([0, 90, 0]){    
      cylinder(10, d = 2);
      
      cylinder(2, d = 5, $fn = 6);
    }
    
    
    // Clear
    translate([0, -S0[1], -S0[2]])
      cube([S0[0], S0[1] * 2, S0[2]]);   
  }
  
  
}

module Display(addsz = .3){
  S0 = [48 + addsz, 29 + addsz, 3];
  S1 = [46 + addsz, 26 + addsz, 18];
  S2 = [9.5 + addsz, 29 + addsz, 17];
  //S21 = [9.5 + addsz, 5 + addsz, 17];
  
  translate([-S0[0] / 2, -S0[1] / 2, 0])
    cube(S0);
  
  translate([-S1[0] / 2, -S1[1] / 2, 0])
    cube(S1);
  
  for(x = [-1, 1]){
    translate([-S2[0] / 2 + x * (2.5 + S2[0] / 2), -S2[1] / 2, 0])
      difference(){
        cube(S2);
        
        translate([0, 1, 0])
          cube([S2[0], S2[1] - 2, S2[2]]);
      }
  }  
}

module PowerButton(addsz = 0.3){
  S0 = [15 + addsz, 11.5 + addsz, 1.5 ];
  S1 = [13 + addsz, 8.5 + addsz, 10 ];
  S2 = [15 + addsz, 4 + addsz, 10];
  
  translate([-S0[0] / 2, -S0[1] / 2, 0])
    cube(S0);
  
  translate([-S1[0] / 2, -S1[1] / 2, 0])
    cube(S1);
  
    translate([-S2[0] / 2, -S2[1] / 2, 0])
    cube(S2);
}

module PowerButtonTest(){
    S0 = [19, 13, 3];

  difference(){  
    translate([-S0[0] / 2, -S0[1] / 2, 0])
      cube(S0);
    
    translate([0, 0, -1.5])
    PowerButton();  
  }
}



module PowerDown(){
  SX = 51;
  SY = 28;
  SZ = 10;
  
  translate([-SX / 2, -SY / 2, 0])
    cube([SX, SY, SZ]);
  
}


