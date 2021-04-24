event_inherited();

isChasing = mouse_check_button(mb_left);

if (mouse_check_button_released(mb_left)) {
	isChasing = false;
	stopChasing();
}

if (isChasing) {
	chaseX = clamp(mouse_x, 100, room_width-100);
	chaseY = mouse_y;
}
