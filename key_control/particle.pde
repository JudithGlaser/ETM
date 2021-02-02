class Particle {

  int x, y; 
  int r;
  
  Particle (int tempX, int tempY, int tempR) {
    
    x = tempX;
    y = tempY;
    r = tempR;
  }
  
  void display(){
  ellipseMode(CENTER);
  stroke(0);
  noFill();
  ellipse(x, y, r*2, r*2);
  fill(0);
  ellipse(x, y, 2, 2);
  }
}
