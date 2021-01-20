public final int tilesX = 4;
public final int tilesY = 0;

public PImage img;
private ArrayList<Tile> tiles = new ArrayList<Tile>();

void setup() {
  size(1000, 500);
  img = loadImage("../ASSETS/ETM#2.png");
  img.resize(1000, 500);
  for (int x= 0; x < tilesX ; x++) {
    Tile tile = new Tile(x, width/tilesX, height);
    tiles.add(tile);
  }
}

void draw() {
  background(0);
  // Kurzform um über alle Elemente der Liste zu gehen
  for (Tile tile : tiles) {
    tile.update(mouseX, mouseY);
    tile.display();
  }
}
