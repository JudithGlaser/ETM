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
    r = dist(x, y, rx, ry);
  }
  
  boolean overlaps(Particle other){
  
  float d = dist(rx, ry, other.x, other.y);
  if (d < r + other.r){
   return true;
  } else {
    return false;
  }
  }
 
 
  void display(){
  stroke(0);
  noFill();
  rect(x, y, tileW, tileH);
  this.drawEffect();
  ellipseMode(CENTER);
  noStroke();
  fill(0, 0, 0, 40);
  ellipse(rx, ry, r*2, r*2);
  }
  
  void drawEffect(){
  
    if (this.overlaps(p1)){
      ellipseMode(CENTER);
      noStroke();
      fill(255, 0, 0, 50);
      ellipse(rx, ry, tileW, tileH);
    }
  }
}
