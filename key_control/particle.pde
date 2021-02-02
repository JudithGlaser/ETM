class Particle {

  float x, y; 
  float r;
  
  Particle (float tempX, float tempY, float tempR) {
    
    x = tempX;
    y = tempY;
    r = tempR;
  }
  
  boolean overlaps(Tile other){
  
  float d = dist(x, y, other.x, other.y);
  if (d < r + other.r){
   return true;
  } else {
    return false;
  }
  }
  
  void display(){
  stroke(0);
  noFill();
  ellipse(x, y, r*2, r*2);
  }
}
