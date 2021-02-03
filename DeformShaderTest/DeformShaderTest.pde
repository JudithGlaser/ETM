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
int tilesX = 4;

private ArrayList<Deformation> deformations = new ArrayList<Deformation>();

void setup() {
  size(568, 800, P2D);
  frameRate(30);
  textureWrap(REPEAT);
  tex = loadImage("ETM_portrait#1.png");
  tex.resize(width, height);
  
  for (int x= 0; x < tilesX ; x++) {
    Deformation def = new Deformation(tex, x, (width / tilesX) * x, 0, width / tilesX, height);
    deformations.add(def);
  }

}

void draw() {
  for (Deformation def : deformations) {
    def.update();
    def.display();

  }
}
