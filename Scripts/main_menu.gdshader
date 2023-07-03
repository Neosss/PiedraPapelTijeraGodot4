shader_type canvas_item;

uniform vec2 direccion = vec2(0.0,-1.0);
uniform float velocidad = 0.08;
void fragment() {
	// Place fragment code here.
	COLOR = texture(TEXTURE, UV + (direccion * TIME * velocidad));
}
