vec4 orig = _surface.diffuse;
vec4 transformed_position = u_inverseModelTransform * u_inverseViewTransform * vec4(_surface.position, 1.0);
if (transformed_position.z < 0.0) {
    _surface.diffuse = mix(vec4(1.0,0.0,0.0,1.0), orig, 0.5);
}
