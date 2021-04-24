//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	float alpha = 1.0;
	
	alpha = 0.1+abs(0.6-(v_vTexcoord.y));
	alpha *= alpha;
	alpha += 0.3*abs(0.5-alpha);
	alpha = min(1.0, 0.2+alpha);
	
	vec4 colour = vec4(v_vColour.rgb, alpha);
	
	
    gl_FragColor = colour * texture2D( gm_BaseTexture, v_vTexcoord );
}
