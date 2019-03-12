uniform float saturation = 0.0;
uniform float overlayColorLevel = 0.0;
uniform vec3 overlayColor = vec3(1.0, 1.0, 1.0);

#pragma transparent
#pragma body

// apply gray
vec3 gray = vec3(dot(vec3(0.3, 0.59, 0.11), _output.color.rgb));
_output.color = mix(vec4(gray, 1.0), _output.color, saturation);

// fadeout level
_output.color = mix(_output.color, vec4(overlayColor, 1.0), overlayColorLevel);
