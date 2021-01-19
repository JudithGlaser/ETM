PImage img;

int tilesX = 4; 
int tilesY;

ArrayList<Tile> tiles = new ArrayList<Tile>();

void setup() {
  size(1000,500, P2D); // make sure you define a renderer (P2D)
  img = loadImage("../ASSETS/ETM#2.png");
  img.resize(1000,500);
  //frameRate(10);
   
  for (int x= 0; x < tilesX ; x++) {
    Tile tile = new Tile(x, width/tilesX, height);
    tiles.add(tile);
  }
}

void draw() {
  background(0);
  
  // The second is using an enhanced loop: (Kurzform um über alle Elemente der Liste zu gehen)
  for (Tile tile : tiles) {
  tile.update();
}

}
