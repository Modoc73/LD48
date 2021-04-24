function particlesInit(){
	
	partSys = part_system_create();
	
	dust = part_type_create();
	part_type_shape(dust, pt_shape_cloud);
	part_type_color1(dust, c_white);
	part_type_alpha3(dust, 0, random_range(0.6, 0.9), 0);
	
	part_type_scale(dust, 0.1, 0.1);
	part_type_size(dust, 0.5, 2, -0.01, 0);
	part_type_speed(dust, 0.05, 2, -0.01, 0);
	part_type_direction(dust, 50, 130, 0, 10);
	
	part_type_life(dust, room_speed, room_speed*10);
	
}

function particlesDust() {
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	
	var cw = camera_get_view_width(view_camera[0]);
	var ch = camera_get_view_height(view_camera[0]);
	
	
	var rx = cx + random(cw);
	var ry = cy + random(ch);
	
	part_particles_create(partSys, rx, ry, dust, 1);
}