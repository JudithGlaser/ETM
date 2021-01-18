boolean overBox = false;
PImage img;

Tile t;


void setup() {
  size(1000,500, P2D); // make sure you define a renderer (P2D)
  img = loadImage("../ASSETS/ETM#2.png");
  img.resize(1000,500);
  //frameRate(10);
  
  t = new Tile();
}

void draw() {
  background(0);
  
  //image(img, 0, 0); //cheking if letter is displyed correct;
  
  t.display();
  t.fragment();

  
  //int fraqX = 10; // how many tiles on the Y/X axis  
  //int fraqY = 10; 
  
  //int fraqW = int(width/fraqX);  // calcultaion of tifloat hight an map(mouseX, 5, 499, 0, 40);dth
  //int fraqH = int(height/fraqY);
  
   //for (int y = 0; y < fraqY; y++) { // wrap up 2D loop
    //for (int x = 0; x < fraqX; x++) {
      
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
    //}
  //} 
  
}
