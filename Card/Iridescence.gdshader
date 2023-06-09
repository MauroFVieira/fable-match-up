shader_type canvas_item;

uniform float level : hint_range(0.0, 1.0);
uniform sampler2D noise_texture;

// from https://ask.godotengine.org/53831/using-hsv-values-in-shaders-instead-of-rgb?show=99084#a99084
vec4 hsv_to_rgb(float h, float s, float v, float a){
    //based on 
    //https://stackoverflow.com/questions/51203917/math-behind-hsv-to-rgb-conversion-of-colors
    // So it needs values from 0 to 1
    float r;
    float g;
    float b;

    float i = floor(h*6.0);
    float f = h*6.0 -i;
    float p = v*(1.0-s);
    float q = v*(1.0-f*s);
    float t = v* (1.0-(1.0-f)*s);

    int cond = int(i)%6;

    if (cond == 0){
        r = v; g = t; b = p;
    }
    else if (cond == 1){
        r = q; g = v; b = p;
    }
    else if (cond == 2){
        r = p; g = v; b = t;
    }
    else if (cond == 3){
        r = p; g = q; b = v;
    }
    else if (cond == 4){
        r = t; g = p; b = v;
    }
    else if (cond == 5){
        r = v; g = p; b = q;
    }
    else {
        // THIS SHOULD NEVER HAPPEN
        r = 0.0; g = 0.0; b = 0.0;
    }
    return vec4(r,g,b,a);
}

void fragment() {
	vec4 current_noise = texture(noise_texture, UV);

	if (level > 0.99999)
		COLOR.a = 0.0;
	else
	{
		float alpha = (level - current_noise.r) / 0.2;
		COLOR.a = 1.0 - alpha;
		if (COLOR.a < 1.0)
		{
			vec4 rgba = hsv_to_rgb(COLOR.a, 1.0, 1.0, 1.0);
			COLOR.r = rgba.r;
			COLOR.g = rgba.g;
			COLOR.b = rgba.b;
		}
	}
}
