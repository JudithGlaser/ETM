public final int tilesX = 4;
public final int tilesY = 0;

private PImage originalImage;
private ArrayList<Tile> tiles = new ArrayList<Tile>();

void setup() {
  size(1000, 500);
  originalImage = loadImage("../ASSETS/ETM#2.png");
  originalImage.resize(1000, 500);
  for (int x= 0; x < tilesX ; x++) {
    Tile tile = new Tile(originalImage, x, width/tilesX, height);
    tiles.add(tile);
  }
}

void draw() {
  background(0);
  // Kurzform um über alle Elemente der Liste zu gehen
  for (Tile tile : tiles) {
    // we are separating concerns here
    // use update to provide variables to each tile that change over time
    // and are used as parameters for how we want to display the tile
    // we do that before we actually display the tile
    tile.update(mouseX, mouseY);
    // display really just has the task of drawing the tile based on the
    // parameters we provide to the thile via the update function
    tile.display();
  }
}
