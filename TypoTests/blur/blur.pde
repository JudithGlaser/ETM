PImage img;
PShader blur;

void setup() {
  size(1000, 500, P2D);
  img = loadImage("Mess.png");
  blur = loadShader("blur.glsl"); 
  stroke(255, 0, 0);
  rectMode(CENTER);
  image(img,0,0);

}

void draw(){
  filter(blur);  
}
