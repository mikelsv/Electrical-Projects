// Base Design //

module BdBoardHullC(h, poi, mul = [1, 1, 1]){
  dia = poi[2] == undef || poi[2] < 0 ? 3 : poi[2];
  
  poi_x = poi[0] * mul[0];
  
  translate([poi_x, poi[1], 0])
    cylinder(h, d = dia);
  
  if(poi[2] == -1)
    %translate([poi_x, poi[1], 0])
      #cylinder(h + 10, d = 1);
}

module BdBoardHullCall(pois, h, mul = [1, 1, 1], rev = 0, center = [0, 0]){
  mlen = len(pois);
  
  for( i = [0 : 1 : mlen - 2])
    hull(){
      BdBoardHullC(h, pois[i], mul);
      BdBoardHullC(h, pois[i + 1], mul);
      BdBoardHullC(h, center);
    }
    
  hull(){
    BdBoardHullC(h, pois[mlen - 1], mul);
    BdBoardHullC(h, pois[0], mul);
    BdBoardHullC(h, center);
  }
}

/* Example
module MainBoardHull(h){
  pois = [
    [-5, 13.5], [5, 13.5],
    [5, 7], [10, 4], [12, 0, 10], [13, -14, 10],
    [11, -22], [0, -22], [0, -22, 14]//, [-13, -14, 10], [-12, 0, 10],
  ];
  
  MainBoardHullCall(pois, h);
  MainBoardHullCall(pois, h, [-1, 0, 0]);  
}
*/


// Text
module TextGnd(height = 1){
  cube([5, 1, height], center = true);
}

module TextPwr(height = 1){
  cube([5, 1, height], center = true);
  cube([1, 5, height], center = true);
}