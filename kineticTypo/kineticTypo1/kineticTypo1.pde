boolean overBox = false;
PImage img;

Tile t;


void setup() {
  size(1000,500, P2D); // make sure you define a renderer (P2D)
  img = loadImage("../ASSETS/ETM#2.png");
  img.resize(1000,500);
  //frameRate(10);
  
  t = new Tile(4,2);
}

void draw() {
  background(0);
  
  //image(img, 0, 0); //cheking if letter is displyed correct;
  
  t.display();
  //t.fragment();

   
}
