
// Pond Ripples
// https://www.shadertoy.com/view/Xdc3z2

void main()
{
    vec2 uv = v_tex_coord.xy;
    float x = uv.x;
   	uv.x += sin(uv.y*mix(1.0, 200.0, uv.y) + u_time) / 250.0;
    uv.y += cos(uv.x*mix(1.0, 200.0, uv.y) - u_time * 8.0) / 250.0;
    gl_FragColor = texture2D(u_texture, uv) * vec4(1.0, 1.1, 1.0, 1.0);
}