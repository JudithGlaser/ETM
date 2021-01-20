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
 
  private int tileW; 
  private int tileH;
 
  private int fraqW;
  private int fraqH; 
  
  private int posX;
  private int posY;
  
  private float mx = 0;
  private float my = 0;
  
  private PGraphics pg;
 
  Tile (int x, int widthTile, int heightTile) {
    this.offsetX = x;
   
    this.tileW = widthTile;
    this.tileH = heightTile;
   
    this.posX = this.offsetX * this.tileW;
    this.posY = 0;
   
    this.pg = createGraphics(this.tileW, this.tileH);
   
    // calcultaion of fraqments
    this.fraqW = int(this.tileW / Tile.fraqX);  
    this.fraqH = int(this.tileH / Tile.fraqY);
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
        int sx = fx * this.fraqW + this.posX + wave; //copy the "right" dimensions of tile
        int sy = fy * this.fraqH;
        int sw = this.fraqW;
        int sh = this.fraqH;

        // DESTINATION
        int dx = fx * this.fraqW; // source and destination are the same 
        int dy = fy * this.fraqH;
        int dw = this.fraqW;
        int dh = this.fraqH;
      
        pg.copy(img, sx, sy, sw, sh, dx, dy, dw, dh);
      }
    }
    pg.endDraw();
  }
}
