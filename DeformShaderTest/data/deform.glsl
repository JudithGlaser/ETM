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
  vec2 frag = gl_FragCoord.xy / resolution.xy;
  frag.x *= 1.0;
  frag.y *= 1.0;
  frag = fract(frag);

  float w = sin((time + (frag.x * frag.y)) * 0.1) / 6;

  vec2 vertexPos = vertTexCoord.st;

  vertexPos.x += w;

  gl_FragColor = texture2D(texture, vertexPos);
}