shader_type canvas_item;
render_mode blend_mix;

uniform float radius = 2.0;
uniform vec2 offset = vec2(0.0, 0.0);
uniform vec4 color: hint_color;

void fragment(){
	vec2 uv_offset = UV + offset * TEXTURE_PIXEL_SIZE;
	vec4 shadow = texture(TEXTURE, uv_offset + vec2(-radius, -radius) * TEXTURE_PIXEL_SIZE);
	shadow += texture(TEXTURE, uv_offset + vec2(-radius, 0) * TEXTURE_PIXEL_SIZE);
	shadow += texture(TEXTURE, uv_offset + vec2(-radius, radius) * TEXTURE_PIXEL_SIZE);
	shadow += texture(TEXTURE, uv_offset + vec2(0, -radius) * TEXTURE_PIXEL_SIZE);
	shadow += texture(TEXTURE, uv_offset + vec2(0, radius) * TEXTURE_PIXEL_SIZE);
	shadow += texture(TEXTURE, uv_offset + vec2(radius, -radius) * TEXTURE_PIXEL_SIZE);
	shadow += texture(TEXTURE, uv_offset + vec2(radius, 0) * TEXTURE_PIXEL_SIZE);
	shadow += texture(TEXTURE, uv_offset + vec2(radius, radius) * TEXTURE_PIXEL_SIZE);
	shadow /= 8.0;

	shadow *= color;
	vec4 color_input = texture(TEXTURE, UV);
	COLOR = mix(shadow, color_input, color_input.a);
}