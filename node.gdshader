shader_type spatial;

void fragment () {
	ALBEDO = vec3(1.0, 0.8, 0.0);
	EMISSION = vec3(abs(sin(TIME)), abs(sin(TIME + 5.0)), abs(sin(TIME + 5.0))) * 2.0;
	}