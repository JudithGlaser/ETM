/**
 * Deform. 
 * 
 * A GLSL version of the oldschool 2D deformation effect, by Inigo Quilez.
 * Ported from the webGL version available in ShaderToy:
 * http://www.iquilezles.org/apps/shadertoy/
 * (Look for Deform under the Plane Deformations Presets)
 * 
 */

PImage tex;
PShader deform;
int tilesX = 10;
int tilesY = 10;

private ArrayList<Deformation> deformations = new ArrayList<Deformation>();

void setup() {
  size(1000, 500, P2D);
  frameRate(30);
  textureWrap(REPEAT);
  tex = loadImage("ETM#2.png");
  tex.resize(width, height);
  
  for (int x= 0; x < tilesX ; x++) {
    for (int y= 0; y < tilesY ; y++) {
      Deformation def = new Deformation(tex, x, y,(width / tilesX) * x, (height/tilesY) * y, width / tilesX, height / tilesY);
      deformations.add(def);
    }
  }

}

void draw() {
  for (Deformation def : deformations) {
    def.update();
    def.display();

  }
}
