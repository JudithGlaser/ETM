class Tile {

  int x, y; 
  int tileW, tileH;
  float r, rx, ry;
  
  private int offsetX;
  private int offsetY;
  
  private int posX;
  private int posY;
  
  float alpha;
  //int o, g;
  
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
      
   
    if (p1.x > this.posX && p1.x < this.posX + this.tileW/2) {
        alpha = int(map(p1.x, this.posX, this.posX + this.tileW/2, 25, 100));
         //o = 255;
         //g = 0;
     } 
     if (p1.x > this.posX + this.tileW/2 && p1.x < this.posX + this.tileW) {
     alpha = int(map(p1.x, this.posX + this.tileW/2, this.posX + this.tileW, 100, 25));
        //o = 0;
        //g = 255;
    } 
    println("p1.x " + p1.x); 
    println("posX " + posX); 
    println("posX + tileW/2 " + (this.posX + this.tileW/2)); 
    if (this.overlaps(p1)){
      ellipseMode(CENTER);
      noStroke();
      //fill(o, g, 0, 55);
      fill(255, 0, 0, int(alpha));
      ellipse(rx, ry, tileW, tileH);
    }
  }
}
