class Tile {
  
  // Since we configure this at the beginning we can make this
  // variable a final static variable, this means we know 
  // that this variable will never change
  private final static int fraqX = 4; 
  private final static int fraqY = 6;
  private final static int tolleranceX = 30;
 
  // declaring this variables as private makes sure we 
  // can only access this variables within the Tile class
  private int offsetX;
  private int offsetY;
 
  private int tileW; 
  private int tileH;
 
  private int fragW;
  private int fragH; 
  
  private int posX;
  private int posY;
  
  private float mx = 0;
  private float my = 0;
  
  private PImage originalImage; 
  private PGraphics pg;
 
  // constructor
  Tile (PImage img, int x, int y, int widthTile, int heightTile) {
    this.originalImage = img;
    
    this.offsetX = x;
    this.offsetY = y;
   
    this.tileW = widthTile;
    this.tileH = heightTile;
   
    this.posX = this.offsetX * this.tileW;
    this.posY = this.offsetY * this.tileH;
   
    this.pg = createGraphics(this.tileW, this.tileH);
   
    // calcultaion of fraqments
    this.fragW = int(this.tileW / Tile.fraqX);  
    this.fragH = int(this.tileH / Tile.fraqY);
  }
  
  private boolean isHovered(){
    if (this.mx > this.posX - Tile.tolleranceX && 
      this.mx < this.posX + this.tileW + Tile.tolleranceX && 
      this.my > 0 && 
      this.my < height) {
        return true; 
    } else {
      return false;
    }
  }
  
  void update(float mousePosX, float mousePosY){
    this.mx = mousePosX;
    this.my = mousePosY;
  }
 
  void display(){
    pushMatrix(); // 
    translate(this.posX,this.posY);
    this.drawAnimation();
    image(this.pg, 0, 0);
    popMatrix();
  }
 
  void drawAnimation(){
    pg.beginDraw();
    for (int fy = 0; fy < Tile.fraqY; fy++) { // wrap up 2D loop
      for (int fx = 0; fx < Tile.fraqX; fx++) {
        // WAVE
        int wave = int(sin((frameCount + ( fx*fy )) * 0.05) * 200);
        // int wave = int(sin((frameCount + ( fx*fy )) * 0.05) * map(mouseY, 5, height, 0, 200)); // trigonomic function
      
        if ( this.isHovered()) { 
          wave = int(sin((frameCount + ( fx*fy )) * 0.05) * map(mouseY, 5, 499, 0, 200)); 
        }
      
        // SOURCE
        int sx = fx * this.fragW + this.posX + wave; //copy the "right" dimensions of tile
        int sy = fy * this.fragH + this.posY;
        int sw = this.fragW;
        int sh = this.fragH;

        // DESTINATION
        int dx = fx * this.fragW; // source and destination are the same 
        int dy = fy * this.fragH;
        int dw = this.fragW;
        int dh = this.fragH;
      
        pg.copy(this.originalImage, sx, sy, sw, sh, dx, dy, dw, dh);
      }
    }
    pg.endDraw();
  }
}
