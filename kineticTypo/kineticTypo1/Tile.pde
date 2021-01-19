class Tile {

 float tileW; 
 float tileH;

 float fraqX; 
 float fraqY;
 
 int fraqW;
 int fraqH; 
 
 int i;
 
 float posX;
 float posY;
 
 PGraphics pg;
 
 Tile (int x, int widthTile, int heightTile){ // Constructor
   
   tileW = widthTile;
   tileH = heightTile;
   
   posX = x * widthTile;
   posY = 0;
   
   pg = createGraphics(int(tileW), int(tileH));
   
 }
  
 void update(){   
  pushMatrix(); // 
  translate(posX,posY);
  display();
  image(pg, 0, 0);
  popMatrix();
 }
 
 void display(){
   pg.beginDraw();
   animation();
   pg.endDraw();
 }
 
 void animation(){
 
  fraqX = 4; // how many tiles on the Y/X axis  
  fraqY = 8; 
  
  fraqW = int(tileW/fraqX);  // calcultaion of fraqments
  fraqH = int(tileH/fraqY);
  
  for (int fy = 0; fy < fraqY; fy++) { // wrap up 2D loop
   for (int fx = 0; fx < fraqX; fx++) {
      
     
      // WAVE
      //int wave = int(sin((frameCount + ( fx*fy )) * 0.05) * 200);
      //int wave = int(sin((frameCount + ( fx*fy )) * 0.05) * map(mouseY, 5, height, 0, 200)); // trigonomic function
      
      // SOURCE
      int sx = fx * fraqW - 500; //copy the "right" dimensions of tile
      int sy = fy * fraqH;
      int sw = fraqW;
      int sh = fraqH;


      // DESTINATION
      int dx = fx * fraqW; // source and destination are the same 
      int dy = fy*fraqH;
      int dw = fraqW;
      int dh = fraqH;
      
      pg.copy(img, sx, sy, sw, sh, dx, dy, dw, dh);
   }
  } 
 }
 
  void test(){
  
  fraqX = 4; // how many tiles on the Y/X axis  
  fraqY = 4; 
  
  fraqW = int(tileW/fraqX);  // calcultaion of fraqments
  fraqH = int(tileH/fraqY);  
    
  for (int fy = 0; fy < fraqY; fy++) { // wrap up 2D loop
   for (int fx = 0; fx < fraqX; fx++) { 
     
     fill(random(0,255));
     rect(fx * fraqW, fy * fraqH, fraqW, fraqH);
    }
   } 
 } 
  

void rectangle(){
  
  fill(255);
  rect(0, 0, tileW, tileH);
} 

}
