if (surface_exists(application_surface)) {
	shaderTime++;
	
	shader_set(shdApplication);
	var t = sin(shaderTime*0.001)*1000;
	shader_set_uniform_f(uniformTime, t);
	shader_set_uniform_f(uniformPosition, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
	//draw_surface(application_surface, 0, 0);
	draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());
	shader_reset();
	
}