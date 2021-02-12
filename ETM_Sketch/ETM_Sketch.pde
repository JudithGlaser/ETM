private MQTTReceiver receiver;
private Pointer pointer;
public final int tilesX = 4;
public final int tilesY = 4;
private ArrayList<Tile> tiles = new ArrayList<Tile>();

private boolean DEBUG = true;
private boolean SHOW_POINTER = true;
private boolean SHOW_OVERLAP_GRID = true;

PImage tex;

void setup() {
  noCursor();
  size(1000, 500, P2D);
  frameRate(30);
  textureWrap(REPEAT);
  receiver = new MQTTReceiver(this, DEBUG);  
  pointer = new Pointer(0, 0, Tile.overlapTolerance);
  tex = loadImage("ETM#2.png");
  tex.resize(width, height);
  
  for (int x= 0; x < tilesX ; x++) {
    for (int y = 0; y < tilesY ; y++) {
      Tile tile = new Tile(tex, pointer, x, y,(width / tilesX) * x, (height/tilesY) * y, width / tilesX, height / tilesY);
      tiles.add(tile);
    }
  }
}


void draw() {
  background(0);
  PVector p = receiver.averageMapped();
  pointer.update(p.x, p.y);
  for (Tile tile : tiles) {
    tile.update();
    tile.display();
  }
  if (SHOW_OVERLAP_GRID) {
    for (Tile tile : tiles) {
      tile.old_display();
    }
  }
  if(SHOW_POINTER) {
    pointer.display();
  }
}
