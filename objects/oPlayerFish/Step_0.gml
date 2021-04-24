event_inherited();

isChasing = mouse_check_button(mb_left);

if (mouse_check_button_released(mb_left)) {
	isChasing = false;
	stopChasing();
}

if (isChasing) {
	chaseX = mouse_x;
	chaseY = mouse_y;
} 