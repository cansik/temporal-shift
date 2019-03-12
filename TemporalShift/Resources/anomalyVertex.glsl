uniform float noiseX = 200.0;
uniform float noiseY = 20.0;

uniform float PI = 3.1415926535897932384626433832795;

// 2D Random
float random (in vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

float noiseSine(float x, float PI, float phase) {
    return 0.5 * (1 + sin(2 * PI * x - (PI / phase)));
}

#pragma transparent
#pragma body
// apply ground noise x
float dx = random(_geometry.position.xz);
float phaseX = random(_geometry.position.yz);
_geometry.position.x += noiseX * dx * noiseSine(u_time, PI, phaseX);

// apply ground noise y
float dy = random(_geometry.position.xy);
float phaseY = random(_geometry.position.xz);
_geometry.position.y += noiseY * dy * noiseSine(u_time, PI, phaseY);
