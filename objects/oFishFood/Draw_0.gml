if (time < room_speed) {
	image_alpha = time/room_speed;
	
	if (time mod 3 == 0) image_alpha*=0.8;
	if (time mod 7 == 0) image_alpha*=0;
}
draw_self();