#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define M_PI 3.1415926535897932384626433832795

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;
uniform vec4 offset;

varying vec4 vertTexCoord;
varying vec4 vertColor;

void main(void) {
  vec2 v = vertTexCoord.st;
  vec2 st = vertTexCoord.st;
  st.x *= 1;
  st.y *= 3;
	// st.x += step(0.5, mod(st.x,.000)) * 0.500;
  st = fract(st);


  float t = time;
  float x = smoothstep(0.0, 1.0, st.x);
  float y = smoothstep(0.0, 1.0, st.y);
  x = st.x + step(0.5, st.x);
  y = st.y + step(0.5, st.y);
  // x = step(0.5, st.x) * 4;
  // y = step(0.5, st.y) * 4;
  // x *= mouse.x / 10000; 
  t *= 0.25;
  float w = sin((t + (x * y) * mouse.x) * 0.1) * (0.08 * mouse.y) ;
  //float w = sin((t + (x * y) * mouse.x) * 0.1) * (0.25 * mouse.y) ;



  v.x += w;

  gl_FragColor = texture2D(texture, v);
}