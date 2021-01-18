boolean overBox = false;
PImage img;

Tile t1;
Tile t2;


void setup() {
  size(1000,500, P2D); // make sure you define a renderer (P2D)
  img = loadImage("../ASSETS/ETM#2.png");
  img.resize(1000,500);
  //frameRate(10);
  
  t1 = new Tile(4,2,0,0);
  t2 = new Tile(4,2,2,2);
}

void draw() {
  background(0);
  
  //image(img, 0, 0); //cheking if letter is displyed correct;
  
  t1.display();
  t2.display();
}
