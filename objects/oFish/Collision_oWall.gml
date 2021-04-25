x = xprevious;
y = yprevious;
vx *= -1;
vy *= -1;
var dir = point_direction(other.x, other.y, x, y);
vx += lengthdir_x(1, dir);
vy += lengthdir_y(1, dir);
