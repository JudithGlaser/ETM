class Particle {

  int x, y; 
  int r;
  
  Particle (int tempX, int tempY, int tempR) {
    
    x = tempX;
    y = tempY;
    r = tempR;
  }
  
  void display(){
  stroke(0);
  noFill();
  ellipse(x, y, r*2, r*2);
  }
}
