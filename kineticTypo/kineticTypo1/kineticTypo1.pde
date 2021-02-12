// animation based on code of Tim Rodenbröker https://timrodenbroeker.de/
// code created by Markus Maerzhase https://github.com/maerzhase

public final int tilesX = 1;
public final int tilesY = 5;

private PImage originalImage;
private ArrayList<Tile> tiles = new ArrayList<Tile>();

void setup() {
  size(568, 800);
  originalImage = loadImage("../ASSETS/ETM_portrait#1.png");
  originalImage.resize(568, 800);
  for (int x= 0; x < tilesX ; x++) {
    for (int y = 0; y < tilesY ; y++) {
    Tile tile = new Tile(originalImage, x, y, width/tilesX, height/tilesY);
    tiles.add(tile);
    }
  }
}

void draw() {
  background(255,0,0);
  noStroke();
  // Kurzform um über alle Elemente der Liste zu gehen
  for (Tile tile : tiles) {
    // we are separating concerns here
    // use update to provide variables to each tile that change over time
    // and are used as parameters for how we want to display the tile
    // we do that before we actually display the tile
    tile.update(mouseX, mouseY);
    // display really just has the task of drawing the tile based on the
    // parameters we provide to the tile via the update function
    tile.display();
  }
}
