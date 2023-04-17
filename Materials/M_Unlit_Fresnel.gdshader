shader_type spatial;
render_mode unshaded;

uniform float rim_amount: hint_range(0.0, 10.0);
uniform vec3 base_color: source_color = vec3(0.0, 0.0, 0.0);
uniform vec3 rim_color: source_color = vec3(1.0, 1.0, 1.0);



float fresnel(float amount, vec3 normal, vec3 view)
{
	return pow((1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0 )), amount);
}

void fragment() {
	float fresnel = fresnel(rim_amount, NORMAL, VIEW);
	ALBEDO = base_color + fresnel * rim_color;
}
