
if (health <= 0) {
	x+=vx;
	y+=vy;
	
	vy-=0.02;
	vy = clamp(vy, -1, abs(vy));
	addWaterFriction();
	return;
}

event_inherited();

isChasing = mouse_check_button(mb_left);

if (mouse_check_button_released(mb_left)) {
	isChasing = false;
	stopChasing();
}

if (isChasing) {
	chaseX = clamp(mouse_x, 10, room_width-10);
	chaseY = mouse_y;
}

