shader_type spatial;
render_mode unshaded;

uniform vec3 base_color: source_color = vec3(1.0, 0.0, 0.0);

void fragment() {
	ALBEDO = base_color;
}
