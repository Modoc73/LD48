//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 position;

void main()
{
	int divisions = 20;
	vec3 distMap = v_vColour.rgb;
	vec3 colour = v_vColour.rgb;
	
	vec2 distort = v_vTexcoord;
	
	
	for (int i = 0; i < divisions; i++) {
		float interval = float(i);
		distMap += sin(time*0.001)*0.1 + sin(interval*(v_vTexcoord.x + (time*0.001)))*(1.0+sin(time*0.0001)*0.2) - (sin((time*0.005) / (v_vTexcoord.y/0.5))*0.1);
		distMap /= 3.0;
		distMap += cos((interval*2.2)*(sin(v_vTexcoord.x + v_vTexcoord.y+(time*0.005)) + (time*0.0001)))*sin(time*0.002);
	}	
	
	distMap *= distMap*1.2;
	
	distMap =( 1.0 + distMap) * 0.1;
	
	distMap.b *= 1.5;
	
	
	
	distort.x += sin((distort.y*30.0) + (time*0.1))*0.002;
	distort.y += cos((distort.x*13.0) - (time*0.16))*0.003;
	
	distort += vec2(((distMap.r + distMap.b + distMap.g)/3.0))*0.003;
	
	
	colour += distMap*0.1;
	
	
    gl_FragColor = vec4(colour, 1.0) * texture2D( gm_BaseTexture,  distort);
}
