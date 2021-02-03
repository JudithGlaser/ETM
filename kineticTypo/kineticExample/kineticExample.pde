PGraphics pg;
PFont font;
boolean overBox = false;
PImage img;


void setup() {
  font = createFont("../ASSETS/RobotoMono-Regular.ttf", 400);
  size(1000, 500, P2D); // make sure you define a renderer (P2D)
  //pg = createGraphics(700, 500, P2D);
  img = loadImage("../ASSETS/ETM#2.png");
  img.resize(1000,500);
  //frameRate(10);
}

void draw() {
  background(0);
  
  //pg.beginDraw();  // enter pg. element
  //pg.background(0);
  //pg.fill(255);
  //pg.textFont(font);
  //pg.textSize(500);
  //pg.pushMatrix();
  //pg.translate(width/2, height/2-150);
  //pg.textAlign(CENTER, CENTER);
  //pg.text("mess", 0, 0);
  //pg.popMatrix();
  //pg.endDraw();

  //image(img, 0, 0); //cheking if letter is displyed correct
  
  int tilesX = 10; // how many tiles on the Y/X axisy 
  float tilesY = map(mouseX, 5, 499, 0, 40);

  int tileW = int(width/tilesX);  // calcultaion of tiles hight and width
  int tileH = int(height/tilesY);
  
   for (int y = 0; y < tilesY; y++) { // wrap up 2D loop
    for (int x = 0; x < tilesX; x++) {
      
      // WAVE
      //int wave = int(sin((frameCount + ( x*y )) * 0.05) * 200); // trigonomic function
      int wave = int(sin((frameCount + ( x*y )) * 0.05) * map(mouseY, 5, 499, 0, 200)); // trigonomic function
      println(mouseY);
      
      // SOURCE
      int sx = x * tileW + wave; //copy the "right" dimensions of tile
      // int sx = x * tileW + int(random(-100,100)); // source and destination are not the same (adding randomness)
      int sy = y * tileH;
      int sw = tileW;
      int sh = tileH;


      // DESTINATION
      int dx = x*tileW; // source and destination are the same 
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(img, sx, sy, sw, sh, dx, dy, dw, dh);
    }
  } 
}
