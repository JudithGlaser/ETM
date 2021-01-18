class Tile {

 float tx;
 float ty;
  
 int tilesX; 
 int tilesY;
 
 float tileW; 
 float tileH;

 float fraqX; 
 float fraqY;
 
 int fraqW;
 int fraqH; 
 
 Tile (){ 
   
   tx = 0;
   ty = 0;
 
   tilesX = 2; // how many tiles on the Y/X axis
   tilesY = 1;
   
   tileW = width/tilesX;
   tileH = height/tilesY;
 
 }
 
 Tile (int amountX, int amountY, int posX, int posY){ // constructor
 
   tilesX = amountX; // how many tiles on the Y/X axis
   tilesY = amountY;
   
   tileW = width/tilesX;
   tileH = height/tilesY;
   
   tx = posX;
   ty = posY;
 
 }
 
 void display(){
 
  //fill(255);
  //noStroke();
  //rect(tx,ty, tileW, tileH);
  //test();
  test2();
  //fragment();
 }
 
 void fragment(){
 
  fraqX = 4; // how many tiles on the Y/X axis  
  fraqY = 4; 
  
  fraqW = int(tileW/fraqX);  // calcultaion of fraqments
  fraqH = int(tileH/fraqY);
  
  for (int fy = 0; fy < fraqY; fy++) { // wrap up 2D loop
   for (int fx = 0; fx < fraqX; fx++) {
      
     
      // WAVE
      int wave = int(sin((frameCount + ( fx*fy )) * 0.05) * map(mouseY, 5, height, 0, 200)); // trigonomic function
      
      // SOURCE
      int sx = fx * fraqW + wave; //copy the "right" dimensions of tile
      int sy = fy * fraqH;
      int sw = fraqW;
      int sh = fraqH;


      // DESTINATION
      int dx = fx*fraqW; // source and destination are the same 
      int dy = fy*fraqH;
      int dw = fraqW;
      int dh = fraqH;
      
      copy(img, sx, sy, sw, sh, dx, dy, dw, dh);
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
  
  void test2(){
  
  fill(random(0,255));
  rect(tx,ty,tileW, tileH);
 }
}
