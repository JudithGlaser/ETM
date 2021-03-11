boolean overBox = false;

int maxImages = 6; // Total # of images
int imageIndexA = 3; // Initial image to be displayed is the first
int imageIndexB = 0; // Initial image to be displayed is the first
int imageIndexC = 2; // Initial image to be displayed is the first
int imageIndexD = 5; // Initial image to be displayed is the first
int imageIndexE = 4; // Initial image to be displayed is the first

// Declaring an array of images.
PImage[] imagesA = new PImage[maxImages];
PImage[] imagesB = new PImage[maxImages];
PImage[] imagesC = new PImage[maxImages];
PImage[] imagesD = new PImage[maxImages];
PImage[] imagesE = new PImage[maxImages];


void setup(){
 size(1000, 500);
  
  // Loading the images A into the array
  for (int a = 0; a < imagesA.length; a ++ ) {
    imagesA[a] = loadImage( "A/" + a + ".png" ); 
  }
  
  // Loading the images B into the array
  for (int b = 0; b < imagesB.length; b ++ ) {
    imagesB[b] = loadImage( "B/" + b + ".png" ); 
  }
  
   // Loading the images C into the array
  for (int c = 0; c < imagesC.length; c ++ ) {
    imagesC[c] = loadImage( "C/" + c + ".png" ); 
  }
  
  // Loading the images D into the array
  for (int d = 0; d < imagesD.length; d ++ ) {
    imagesD[d] = loadImage( "D/" + d + ".png" ); 
  }
  
  // Loading the images D into the array
  for (int e = 0; e < imagesE.length; e ++ ) {
    imagesE[e] = loadImage( "E/" + e + ".png" ); 
  }
  
  frameRate(10);
 
}

void draw(){

 noStroke();
 background(0);
 image(imagesA[imageIndexA],0 ,0);
 image(imagesB[imageIndexB],width/5,0);
 image(imagesC[imageIndexC],width/5*2 ,0);
 image(imagesD[imageIndexD],width/5*3 ,0);
 image(imagesE[imageIndexE],width/5*4 ,0);
 
 // Test if the cursor is over the box A 
  if (mouseX > 0 && mouseX < width/5 && 
     mouseY > 0 && mouseY < height) {
    overBox = true; 
    imageIndexA = int(random(0,maxImages));
  }
  
   // Test if the cursor is over the box B 
  if (mouseX > width/5 && mouseX < width/5*2  && 
     mouseY > 0 && mouseY < height) {
    overBox = true; 
    imageIndexB = int(random(0,maxImages));
  }

 
 // Test if the cursor is over the box C
 if (mouseX > width/5*2 && mouseX < width/5*3 && 
     mouseY > 0 && mouseY < height) {
    overBox = true; 
    imageIndexC = int(random(0,maxImages));
  }
  
  // Test if the cursor is over the box D
 if (mouseX > width/5*3 && mouseX < width/5*4 && 
     mouseY > 0 && mouseY < height) {
    overBox = true; 
    imageIndexD = int(random(0,maxImages));
  }
  
    // Test if the cursor is over the box E
 if (mouseX > width/5*4 && mouseX < width && 
     mouseY > 0 && mouseY < height) {
    overBox = true; 
    imageIndexE = int(random(0,maxImages));
  }
  
}
 
