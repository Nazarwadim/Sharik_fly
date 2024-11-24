shader_type canvas_item;
render_mode blend_mix;

uniform float radius = 4.0;

void fragment() {
	vec2 coord;
	if (UV.x < 0.5f) {
		coord = vec2(2.0f * UV.x, UV.y);
	} else {
		coord = vec2(2.0f * (1.0 - UV.x), UV.y);
	}
	vec4 col = texture(TEXTURE, coord);
	COLOR = col;

	// Blur
	col = texture(TEXTURE, UV);

	vec2 ps = TEXTURE_PIXEL_SIZE;

	col += texture(TEXTURE, UV + vec2(0.0, -radius) * ps);
	col += texture(TEXTURE, UV + vec2(0.0, radius) * ps);
	col += texture(TEXTURE, UV + vec2(-radius, 0.0) * ps);
	col += texture(TEXTURE, UV + vec2(radius, 0.0) * ps);
	col /= 5.0;

	COLOR = mix(col, COLOR, 0.9f);


}
