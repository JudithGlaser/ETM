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
  vec2 st = gl_FragCoord.xy / resolution.xy;
  st *= 4;
	// st.x += step(0.5, mod(st.x,.000)) * 0.500;
  st = fract(st);


  float t = time;
  float y = smoothstep(0.0, 1.0, st.y);
  float x = smoothstep(0.0, 1.0, st.x);
  // y = step(0.5, st.y);
  // x = step(0.5, st.x);
  x *= mouse.x / 10000;
  t *= 0.1 + mouse.y;
  float w = sin((t + y) * x) / 6;


  vec2 vertexPos = vertTexCoord.st;
  vertexPos.x += w;

  gl_FragColor = texture2D(texture, vertexPos);
}