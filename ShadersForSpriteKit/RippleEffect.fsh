
// Ripple Effect

#define M_PI 3.1415926535897932384626433832795

void main() {
    
    vec2 uv = v_tex_coord - vec2(0.5, 0.5);
    
    uv *= 1.0 + sin( 2.0 * M_PI * (length(uv) / 0.1 - mod(u_time, 1.0))) * 0.1;
    
    gl_FragColor = texture2D(u_texture, uv + vec2(0.5, 0.5));
}