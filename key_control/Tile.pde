class Tile {

  float x, y; 
  float tileW, tileH;
  float r, rx, ry;
  
  Tile (float tempX, float tempY, float tempW, float tempH) {
    
    x = tempX;
    y = tempY;
    tileW = tempW;
    tileH = tempH;
    
    rx = tempX + tempW/2;
    ry = tempY + tempH/2;
    r = tempW/2;
  }
 
 
  void display(){
  stroke(0);
  noFill();
  rect(x, y, tileW, tileH);
  ellipseMode(CENTER);
  noStroke(); 
  fill(200);
  ellipse(rx, ry, tileW, tileH);
  }
}
