function followPoint(px, py){
	var dir = point_direction(x, y, px, py);
	var dist = point_distance(x, y, px, py);
	
	facing_direction = dir;
	
	if (dist > minDistance) {
		var spdx = sqr(abs(x-px)/dist) * acceleration;
		var spdy = sqr(abs(y-py)/dist) * acceleration;
		vx += lengthdir_x(spdx, dir);
		vy += lengthdir_y(spdy, dir);
		
		var mx = maxSpeed;
		if (chasing != noone) {
			mx *= 1.2;	
		}
		vx = clamp(vx, -mx, mx);
		vy = clamp(vy, -mx, mx);
	}
	
	var percent = min(dist, (minDistance*2))/(minDistance*2);
	var slowFactor = lerp(0.95, 1, percent);
	
	vx *= slowFactor;
	vy *= slowFactor;
}

function evadePoint(px, py){
	var dir = point_direction(px, py, x, y);
	var dist = point_distance(x, y, px, py);
	
	facing_direction = dir;
	
	if (dist > minDistance) {
		var spdx = sqr(abs(x-px)/dist) * acceleration;
		var spdy = sqr(abs(y-py)/dist) * acceleration;
		vx += lengthdir_x(spdx, dir);
		vy += lengthdir_y(spdy, dir);
	
		var mx = maxSpeed;
		if (beingChased != noone) {
			mx *= 1.4;	
		}
		vx = clamp(vx, -mx, mx);
		vy = clamp(vy, -mx, mx);
	}
	
}


function stopChasing() {
	endChaseX = x;
	endChaseY = y;
	chaseTick = 0;

	
	isChasing = false;
}


function addWaterFriction() {
	vx *= 0.99;
	vy *= 0.99;
}


function getCurrentDepth(obj) {
	if (!instance_exists(oBackground)) return 0;
	if (!instance_exists(obj)) return 0;
	
	var level = 0;
	
	for (var i = 0; i < array_length(oBackground.backgroundLevel); i++) {
		if (obj.y > oBackground.backgroundLevel[i, 0] && obj.y <= oBackground.backgroundLevel[i, 1]) {
			level = i;
			break;
		}
	}
	return level;
}

function getDepthTop(obj) {
	if (!instance_exists(oBackground)) return 0;
	if (!instance_exists(obj)) return 0;
	
	var level = 0;
	
	for (var i = 0; i < array_length(oBackground.backgroundLevel); i++) {
		if (obj.depthZone > oBackground.backgroundLevel[i, 0] && obj.depthZone <= oBackground.backgroundLevel[i, 1]) {
			level = i;
			break;
		}
	}
	return oBackground.backgroundLevel[level, 0];
}

function getDepthBottom(obj) {
	if (!instance_exists(oBackground)) return 0;
	if (!instance_exists(obj)) return 0;
	
	var level = 0;
	
	for (var i = 0; i < array_length(oBackground.backgroundLevel); i++) {
		if (obj.depthZone > oBackground.backgroundLevel[i, 0] && obj.depthZone <= oBackground.backgroundLevel[i, 1]) {
			level = i;
			break;
		}
	}
	return oBackground.backgroundLevel[level, 1];
}