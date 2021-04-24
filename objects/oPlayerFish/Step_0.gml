isChasing = mouse_check_button(mb_left);

if (mouse_check_button_released(mb_left)) {
	isChasing = false;
	stopChasing();
}

if (isChasing) {
	chaseX = mouse_x;
	chaseY = mouse_y;
} else {
	if (chaseTick < 1) {
		chaseTick+=0.01;	
	} else {
		chaseTick++;
	}
	chaseX = endChaseX + sin(chaseTick*0.03)*(minDistance*2.5);
	chaseY = endChaseY + cos(chaseTick*0.01)*(minDistance*1.5);
	
}
followPoint(chaseX, chaseY);



addWaterFriction();


x += vx;
y += vy;