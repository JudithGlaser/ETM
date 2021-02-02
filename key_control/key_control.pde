//https://happycoding.io/tutorials/processing/input

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

float circleX = 300;
float circleY = 300;

Particle p1;
Tile t1; 


void setup() {
  size (500, 500);
  p1 = new Particle(circleX, circleY, 50);
  t1 = new Tile(0, 0, width/2, height/2);
}

void draw() {
  background(255);  

    p1.x = circleX; 
    p1.y = circleY; 


    if (p1.overlaps(t1)){
      background(255, 0, 0);
    }

    p1.display();
    t1.display();

/////
  if (upPressed) {
    circleY--;
  }
  if (downPressed) {
    circleY++;
  }
  if (leftPressed) {
    circleX--;
  }
  if (rightPressed) {
    circleX++;
  }
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
