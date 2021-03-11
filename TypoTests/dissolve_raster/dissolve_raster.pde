// credits Tim Rodenbroeker
// Source https://www.youtube.com/watch?v=XO8u0Y75FRk

PImage img; 
int tileCount = 3;
int d = 0;
int i = 0;
//int[] data = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
int[] data = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
};



void setup (){
  size (1000, 500);
  img = loadImage("Mess3.png");
  img.resize(1000,500);
  frameRate(15);

}

void draw() {
  background(255);

  fill(0);
  noStroke();
  
  // Definiert Anzahl der Tiles des Grids
  float tiles = tileCount; // (mouseX/5)
  float tileSize = width/tiles;
  //println(tileCount);
  
  // Startpositions des Grids definieren (zentrieren)
  translate(tileSize/2, tileSize/2);
  
  // Creating the grid
  
  // tiles-mal gezeichnet pro framerate; liste 0 bis tiles > hochzählen
  for (int x = 0; x < tiles; x++) { 
    
    // nested for loop für y-Position
    for (int y = 0; y < tiles; y++) { 
    
    // Pick color of image pixel 
    // int = convert float back to int
    color c = img.get(int(x*tileSize),int(y*tileSize)); 
    
    // converts color to brightness value+ maps/inverts value to tileSize
    float size = map(brightness(c),0, 255, tileSize, 0); 
    
    // *tileSize is offset damit die Ellipsen sich nicht überlappen
    ellipse(x*tileSize , y*tileSize, size, size); 
    }
  }
}

void keyPressed(){
  if (keyCode == RIGHT){
    d = d +1;
    i = i +1;
    println(" value: " + data[d] + " index " + i);
    tileCount = data[d];
    if (i > data.length -2){
      println("Restart" + " value: " + data[d] + " index " + i);
      d = 1;
      i = 1;
    }
   }
  if (keyCode == LEFT){
    d = d -1;
    i = i -1;
    tileCount = data[d];
    println(" value: " + data[d] + " index " + i);
    if (i < 1){
      println("Restart" + " value: " + data[d] + " index " + i);
      d = data.length -1;
      i = data.length -1;
    }
  }
}
