shader_type spatial;
render_mode unshaded;

uniform bool use_fog;
uniform sampler2D texture2d : source_color,filter_linear_mipmap,repeat_enable;
uniform vec3 fog_color: source_color = vec3(0.0, 0.0, 0.0);
uniform float fog_distance: hint_range(0.0, 128.0);

void fragment() {
	vec4 albedo_tex = texture(texture2d, UV);
	if (use_fog) {
		float distance_dif = distance(NODE_POSITION_WORLD, CAMERA_POSITION_WORLD);
		distance_dif = distance_dif/fog_distance;
		distance_dif = clamp(distance_dif, 0.0, 1.0);

		ALBEDO = mix(albedo_tex.rgb, fog_color, distance_dif);
	} 
	else {
		ALBEDO =  albedo_tex.rgb;
	}
}
