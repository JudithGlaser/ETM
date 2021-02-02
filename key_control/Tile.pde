class Tile {

  float x, y; 
  float tileW, tileH;
  float r;
  
  Tile (float tempX, float tempY, float tempW, float tempH) {
    
    x = tempX;
    y = tempY;
    tileW = tempW;
    tileH = tempH;
    
    r = tempW/2;
  }
 
 
  void display(){
  stroke(0);
  noFill();
  rect(x, y, tileW, tileH);
  }
}
