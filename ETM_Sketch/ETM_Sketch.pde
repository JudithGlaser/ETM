private MQTTReceiver receiver;
private Pointer pointer;
public final int tilesX = 8;
public final int tilesY = 15;
private ArrayList<Tile> tiles = new ArrayList<Tile>();

private boolean DEBUG = false;
private boolean SHOW_POINTER = false;
private boolean SHOW_OVERLAP_GRID = false;

int SLEEP_TIMER = 1000 * 60;
int timerCount = 0;

PVector lastPointerPosition = new PVector(0, 0);

PImage tex;

void setup() {
  //fullScreen(P2D);
  noCursor();
  size(360, 640, P2D);
  frameRate(30);
  textureWrap(REPEAT);
  receiver = new MQTTReceiver(this, DEBUG);  
  pointer = new Pointer(0, 0, Tile.overlapTolerance);
  tex = loadImage("Image#1b.png");
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
  
  if(lastPointerPosition.dist(p) > 15) {
    timerCount = millis(); 
  }
  println(lastPointerPosition.dist(p));
    
  if(millis() < timerCount + SLEEP_TIMER) {
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
  lastPointerPosition = p;
}
