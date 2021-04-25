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
	
	bubble = part_type_create();
	part_type_shape(bubble, pt_shape_ring);
	part_type_color1(bubble, c_white);
	part_type_alpha3(bubble, 0.7, 0.7, 0);
	
	part_type_scale(bubble, 0.1, 0.1);
	part_type_size(bubble, 0.2, 1, -0.01, 0);
	part_type_speed(bubble, 0.05, 2, -0.01, 0);
	part_type_direction(bubble, 50, 130, 0, 10);
	
	part_type_life(bubble, room_speed, room_speed*2);
	
	bigDust = part_type_create();
	part_type_shape(bigDust, pt_shape_cloud);
	part_type_color1(bigDust, c_white);
	part_type_alpha3(bigDust, 0.0, 0.4, 0);
	
	part_type_scale(bigDust, 0.8, 0.8);
	part_type_size(bigDust, 1, 6, -0.01, 0);
	part_type_speed(bigDust, 0.05, 2, -0.03, 0);
	part_type_direction(bigDust, 360, 0, 3, 0);
	
	part_type_orientation(bigDust, 0, 360, 1, 0, false);
	
	part_type_life(bigDust, room_speed*6, room_speed*14);
	
	
}

function particlesDust() {
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	
	var cw = camera_get_view_width(view_camera[0]);
	var ch = camera_get_view_height(view_camera[0]);
	
	
	var rx = cx + random(cw);
	var ry = cy + random(ch);
	
	part_particles_create(partSys, rx, ry, dust, 1);
	
	
	if (random(1) > 0.98) {
		part_particles_create(partSys, cx + random(cw), ry, bigDust, 1);
	
	}
}

function particleBubbles() {
	with (oFish) {
		if (abs(x-xprevious) >= maxSpeed || abs(y-yprevious) >= maxSpeed) {
			with(oController) {
				part_particles_create(partSys, other.x + random_range(-2, 2), other.y, bubble, 1);
				
			}
		}
	}
}