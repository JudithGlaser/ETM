import mqtt.*;
MQTTClient client;
int a0, a1;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int circleX = 300;
int circleY = 300;

Particle p1;
Avarage aX;
Avarage aY;

public final int tilesX = 4;
public final int tilesY = 4;
private ArrayList<Tile> tiles = new ArrayList<Tile>();




void setup() {
  size (500, 500);
  
  client = new MQTTClient(this);
  client.connect("mqtt://localhost", "processing");
  client.subscribe("a0");
  client.subscribe("a1");
  aX = new Avarage();
  aY = new Avarage();
  
  p1 = new Particle(circleX, circleY, 25);
  for (int x= 0; x < tilesX ; x++) {
    for (int y = 0; y < tilesY ; y++) {
      Tile tile = new Tile(x, y, width/tilesX, height/tilesY);
      tiles.add(tile);
    }
  }
}


void draw() {
  background(255);
  
  aX.update(a0);
  aY.update(a1);
    
    p1.x = circleX; 
    p1.y = circleY; 
    
  float x = aX.value();
  float y = aY.value();
    
    p1.display();
   
   for (Tile tile : tiles) {
    tile.display();
   }

// this will be replaced by poti values  
  if (upPressed) {
    circleY--;
    if (circleY < p1.r){
      circleY = p1.r;
    }
  }
  if (downPressed) {
    circleY++;
     if (circleY > height - p1.r){
      circleY = height - p1.r;
    }
  }
  if (leftPressed) {
    circleX--;
    if (circleX < p1.r){
      circleX = p1.r;
    }
  }
  if (rightPressed) {
    circleX++;
     if (circleX > width - p1.r){
      circleX = width - p1.r;
    }
  }
}

void messageReceived(String topic, byte[] payload)  {
  a0 = Integer.parseInt(new String(payload));
}

void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  }
  else if (keyCode == DOWN) {
    downPressed = true;
  }
  else if (keyCode == LEFT) {
    leftPressed = true;
  }
  else if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  }
  else if (keyCode == DOWN) {
    downPressed = false;
  }
  else if (keyCode == LEFT) {
    leftPressed = false;
  }
  else if (keyCode == RIGHT) {
    rightPressed = false;
  }
}

void messageReceived(String topic, byte[] payload)  {
  // println(topic);
  if(topic.equals("a0")) {
      //println("receiving a0");
      a0 = Integer.parseInt(new String(payload));
  } else if(topic.equals("a1")){
    println("receiving a1");
    a1 = Integer.parseInt(new String(payload));
  }
}
