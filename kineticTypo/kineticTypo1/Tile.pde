class Tile {

 float tx;
 float ty;
  
 int tilesX; 
 int tilesY;
 
 float tileW; 
 float tileH;

 int fraqX; 
 int fraqY;
 
 int fraqW;
 int fraqH; 
 
 
 Tile (){ // constructor
 
   tx = 0;
   ty = 0;
 
   tilesX = 2; // how many tiles on the Y/X axis
   tilesY = 1;
   
   tileW = width/tilesX;
   tileH = height/tilesY;
 
 }
 
 void display(){
 
  fill(255);
  noStroke();
  rect(tx,ty, tileW, tileH);
 }
 
 void fragment(){
 
  fraqX = 4; // how many tiles on the Y/X axis  
  fraqY = 4; 
  
  fraqW = int(tileW/fraqX);  // calcultaion of fraqments
  fraqH = int(tileH/fraqY);
  
  for (int fy = 0; fy < fraqY; fy++) { // wrap up 2D loop
   for (int fx = 0; fx < fraqX; fx++) {
      
     fill(0);
     rect(fx, fy, fraqW, fraqH);
      // WAVE
      //int wave = int(sin((frameCount + ( x*y )) * 0.05) * 200); // trigonomic function
      //int wave = int(sin((frameCount + ( x*y )) * 0.05) * map(mouseY, 5, 499, 0, 200)); // trigonomic function
      //println(mouseY);
      
      // SOURCE
      //int sx = x * fraqW + wave; //copy the "right" dimensions of tile
      // int sx = x * tileW + int(random(-100,100)); // source and destination are not the same (adding randomness)
      //int sy = y * fraqH;
      //int sw = fraqW;
      //int sh = fraqH;


      // DESTINATION
      //int dx = x*fraqW; // source and destination are the same 
      //int dy = y*fraqH;
      //int dw = fraqW;
      //int dh = fraqH;
      
      //copy(img, sx, sy, sw, sh, dx, dy, dw, dh);
   }
  } 
 
 }
 
}
