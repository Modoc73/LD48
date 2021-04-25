if (health <=0 ) return;
var dir = point_direction(other.x, other.y, x, y);
vx = lengthdir_x(3, dir);
vy = lengthdir_y(3, dir);

if (hurtTimer <= 0) {
	vx = lengthdir_x(4, dir);
	vy = lengthdir_y(4, dir);
	hurtTimer = hurtTime;
	health--;
}