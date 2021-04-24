/// @description Insert description here
// You can write your code in this editor


image_angle += angle_difference(facing_direction, image_angle) * 0.1;
var newYScale = 1;
if (facing_direction > 90 && facing_direction < 270) {
	newYScale = -1;	
}

var diffY = max(0.1, abs(newYScale-scaleY)*0.2);
if (newYScale < scaleY) {
	scaleY = max(scaleY - diffY, newYScale);	
} else {
	scaleY = min(scaleY + diffY, newYScale);	
}

image_yscale = max(0.75, abs(scaleY))*sign(scaleY);



draw_self();
