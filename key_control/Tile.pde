class Tile {

  int x, y; 
  int tileW, tileH;
  float r, rx, ry;
  
  private int offsetX;
  private int offsetY;
  
  private int posX;
  private int posY;
  
  Tile (int x, int y, int tempW, int tempH) {
    
    tileW = tempW;
    tileH = tempH;
    
    this.offsetX = x;
    this.offsetY = y;
    
    this.posX = this.offsetX * this.tileW;
    this.posY = this.offsetY * this.tileH;
    
    rx = this.posX + tempW/2;
    ry = this.posY + tempH/2;
    r = dist(this.posX, this.posY, rx, ry);
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
  rect(this.posX, this.posY, tileW, tileH);
  this.drawEffect();
  ellipseMode(CENTER);
  noStroke();
  fill(0, 0, 0, 40);
  ellipse(rx, ry, r*2, r*2);
  }
  
  void drawEffect(){
  
    println(p1.x); 
    float alpha = int(map(p1.x, p1.r, width - p1.r, 25, 100));
    if (this.overlaps(p1)){
      ellipseMode(CENTER);
      noStroke();
      fill(255, 0, 0, int(alpha));
      ellipse(rx, ry, tileW, tileH);
    }
  }
}
