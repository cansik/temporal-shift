#pragma body
//RADIUS of our vignette, where 0.5 results in a circle fitting the screen
const float RADIUS = 0.50;

//softness of our vignette, between 0.0 and 1.0
const float SOFTNESS = 0.65;

// calculate transformed position
vec4 transformed_position = u_inverseModelTransform * u_inverseViewTransform * vec4(_surface.position, 1.0);

// calculate normalized position
vec3 model_size = u_boundingBox[1] - u_boundingBox[0];
vec3 normalized_position = (transformed_position.xyz + (model_size * 0.5)) / model_size;

// apply vigniette
vec2 center = normalized_position.xy - vec2(0.5);
float len = length(center);
float vignette = smoothstep(RADIUS, RADIUS-SOFTNESS, len);
_surface.diffuse = mix(vec4(0.0, 0.0, 0.0, 0.0), _surface.diffuse, vignette);

// apply distance filter
float dist = length(_surface.view - _surface.position);
float nd = dist / 1.0;
_surface.diffuse = mix(_surface.diffuse, vec4(0.0, 0.0, 0.0, 0.0), nd);
