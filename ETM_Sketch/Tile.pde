class Tile {
  private final static int overlapTolerance = 25;
  Pointer pointer;
  
  float r, rx, ry;
  
  private int offsetX;
  private int offsetY;
  
  PGraphics pg;
  PImage tex;
  PShader deform;
  private int posX;
  private int posY;
  private int sizeX;
  private int sizeY;
  
  float alpha;
  
  Tile (PImage t, Pointer p, int i, int j, int x, int y, int w, int h) {
    this.pointer = p;
    this.posX = x;
    this.posY = y;
    this.sizeX = w;
    this.sizeY = h;
    this.tex = t;
    this.deform = loadShader("deform.glsl", "vert.glsl");
    this.pg = createGraphics(this.sizeX, this.sizeY, P2D);
    this.deform.set("resolution", float(width), float(height));
    float offsetX = i * 2;
    float offsetY = j * -2;
    this.deform.set("offset", offsetX, offsetY, 0f, 0f);
    
    rx = this.posX + w/2;
    ry = this.posY + h/2;
    r = dist(this.posX, this.posY, rx, ry);
  }
  
  boolean pointerOverlaps(){
    float d = dist(rx, ry, this.pointer.x, this.pointer.y);
    if (d < r + this.pointer.radius) {
     return true;
    } else {
      return false;
    }
  }
  
  void update() {
    this.alpha = 25;
    if (this.pointer.x > this.posX && this.pointer.x < this.posX + this.sizeX/2) {
      this.alpha = int(map(this.pointer.x, this.posX, this.posX + this.sizeX/2, 25, 100));

    } 
    if (this.pointer.x > this.posX + this.sizeX/2 && this.pointer.x < this.posX + this.sizeX) {
      this.alpha = int(map(this.pointer.x, this.posX + this.sizeX/2, this.posX + this.sizeX, 100, 25));

    } 
    float x = 100;
    float y = 1;
    if (this.pointerOverlaps()) {
       // mult = 0.1; 
       x -= this.distX() * 100;
       y = this.distY();
    }
    // here we can set two values that will be available in the shader as:
    // mouse.x and mouse.y
    this.deform.set("mouse", x, map(this.alpha, 25, 100, 1, 2));
    // this makes the frameCount available in our shader as:
    // time
    this.deform.set("time", float(frameCount));
}
  
  void display() {
    this.pg.beginDraw();
    this.pg.shader(this.deform);
    this.pg.image(this.tex, 0, 0, width, height);
    this.pg.endDraw();
    pushMatrix();
    translate(this.posX, this.posY);
    image(this.pg, 0, 0, this.sizeX, this.sizeY);
    popMatrix();    
  }
  
  private float distX() {
    return sin(map(this.pointer.x, this.posX, this.posX + this.sizeX, 0, PI));
  }
  
  private float distY() {
    return sin(map(this.pointer.y, this.posY, this.posY + this.sizeY, 0, PI));
  }
  
  private boolean isHovered(){
    if (mouseX > this.posX - Tile.overlapTolerance && 
      mouseX < this.posX + this.sizeX + Tile.overlapTolerance && 
      mouseY > this.posY - Tile.overlapTolerance && 
      mouseY < this.posY + this.sizeY + Tile.overlapTolerance) {
        return true; 
    } else {
      return false;
    }
  }
  
  void old_display(){
    pushMatrix();
    pushStyle();
    strokeWeight(1);
    stroke(255, 180);
    noFill();
    rect(this.posX, this.posY, this.sizeX, this.sizeY);
    this.old_drawEffect();
    ellipseMode(CENTER);
    noStroke();
    fill(255, 255, 255, 40);
    ellipse(rx, ry, r*2, r*2);
    popStyle();
    popMatrix();
  }
  
  void old_drawEffect(){
    if (this.pointerOverlaps()){
      ellipseMode(CENTER);
      noStroke();
      //fill(o, g, 0, 55);
      fill(0, 0, 255, int(this.alpha));
      ellipse(this.rx, this.ry, this.sizeX, this.sizeY);
    }
  }
}
