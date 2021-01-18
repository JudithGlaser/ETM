boolean overBox = false;
PImage img;

int tilesX; 
int tilesY;

float tileW; 
float tileH;

int y;
int x;

Tile t1;
Tile t2;

void setup() {
  size(1000,500, P2D); // make sure you define a renderer (P2D)
  img = loadImage("../ASSETS/ETM#2.png");
  img.resize(1000,500);
  frameRate(10);
  
  t1 = new Tile();
  t2 = new Tile();
 
}

void draw() {
  background(0);
  
  tilesX = 4; // how many tiles on the Y/X axis
  tilesY = 2;
  
  tileW = width/tilesX;
  tileH = height/tilesY;
  
  //image(img, 0, 0); //cheking if letter is displyed correct;

  translate(0, 0);
  t1.display();
  translate(tileW, 0);
  t2.display();
}
