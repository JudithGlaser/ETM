class Pointer {

  private float x, y; 
  private float radius;
  
  Pointer (float _x, float _y, float _r) {
    this.x = _x;
    this.y = _y;
    this.radius = _r;
  }
  
  void update(float _x, float _y) {
    this.x = _x;
    this.y = _y;
  }
  
  void display(){
    pushMatrix();
    ellipseMode(CENTER);
    noFill();
    stroke(0, 255, 0);
    strokeWeight(2);
    ellipse(x, y, this.radius * 2, this.radius * 2);
    noStroke();
    fill(0, 255, 0);
    ellipse(x, y, 2, 2);
    popMatrix();
  }
}
