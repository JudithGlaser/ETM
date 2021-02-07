class Deformation {
 private final static int tolerance = 30;
 PGraphics pg;
 PImage tex;
 PShader deform;
 int posX, posY;
 int sizeX, sizeY;

  Deformation(PImage t, int i, int x, int y, int w, int h) {
    this.posX = x;
    this.posY = y;
    this.sizeX = w;
    this.sizeY = h;
    this.tex = t;
    this.deform = loadShader("deform.glsl", "vert.glsl");
    this.pg = createGraphics(this.sizeX, this.sizeY, P2D);
    this.deform.set("resolution", float(width), float(height));
    float offsetX = i * 2;
    println(offsetX / 2);
    this.deform.set("offset", offsetX, 0f, 0f, 0f);


}
  
  void update() {
    this.deform.set("time", float(frameCount));
    float x = 100;
    if (this.isHovered()) {
       // mult = 0.1; 
       x -= this.distX() * 100;
    }
    this.deform.set("mouse", x, this.distY());
  }
  
  void display() {
    this.pg.beginDraw();
    this.pg.shader(this.deform);
    this.pg.image(this.tex, 0, 0, width, height);
    this.pg.endDraw();
    pushMatrix();
    translate(this.posX, this.posY);
    image(this.pg, 0, 0, this.sizeX, this.sizeY);
    stroke(0);
    noFill();
    rect(0,0,this.sizeX,sizeY);
    popMatrix();    
  }
  
  private float distX() {
    return sin(map(mouseX, this.posX, this.posX + this.sizeX, 0, PI));
  }
  
  private float distY() {
    return sin(map(mouseY, this.posY, this.posY + this.sizeY, 0, PI));
  }
  
  private boolean isHovered(){
    if (mouseX > this.posX - Deformation.tolerance && 
      mouseX < this.posX + this.sizeX + Deformation.tolerance && 
      mouseY > 0 && 
      mouseY < height) {
        return true; 
    } else {
      return false;
    }
  }
  
   
}