if (surface_exists(application_surface)) {
	shaderTime++;
	
	shader_set(shdApplication);
	shader_set_uniform_f(uniformTime, shaderTime);
	shader_set_uniform_f(uniformPosition, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
	draw_surface(application_surface, 0, 0);	
	shader_reset();
	
}