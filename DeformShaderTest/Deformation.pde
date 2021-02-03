class Deformation {
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
    this.deform.set("mouse", float(mouseX), float(mouseY));
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
   
}
