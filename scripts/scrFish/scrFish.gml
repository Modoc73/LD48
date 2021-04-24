function followPoint(px, py){
	var dir = point_direction(x, y, px, py);
	var dist = point_distance(x, y, px, py);
	
	if (dist > minDistance) {
		var spdx = sqr(abs(x-px)/dist) * acceleration;
		var spdy = sqr(abs(y-py)/dist) * acceleration;
		vx += lengthdir_x(spdx, dir);
		vy += lengthdir_y(spdy, dir);
	
		vx = clamp(vx, -maxSpeed, maxSpeed);
		vy = clamp(vy, -maxSpeed, maxSpeed);
	}
	
	var percent = min(dist, (minDistance*2))/(minDistance*2);
	var slowFactor = lerp(0.95, 1, percent);
	
	vx *= slowFactor;
	vy *= slowFactor;
}

function stopChasing() {
	chaseX = x;
	chaseY = y;
	isChasing = false;
}


function addWaterFriction() {
	vx *= 0.99;
	vy *= 0.99;
}