if (isChasing) {
	event_inherited();
} else {
	biteFish = true;
	if (other.object_index == oPlayerFish) {
		with(oPlayerFish) {
			if (hurtTimer <= 0) {
				health--;
				hurtTimer = hurtTime;
				var dir = point_direction(other.x, other.y, x, y);
				vx = lengthdir_x(3, dir);
				vy = lengthdir_y(3, dir);
			}
		}
	}
}


