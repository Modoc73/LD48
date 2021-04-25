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
	if (object_index != oPlayerFish) {
	waitChaseTime = waitChaseTimer;
	}
}


function addWaterFriction() {
	vx *= 0.99;
	vy *= 0.99;
}


function doCollisions() {
	for (var xx = 0; xx < abs(vx); xx++) {
		if (!place_meeting(x + sign(vx), y, oWall)) {
			x += sign(vx);
		} else {
			endChaseX += sign(vx)*-5;
			vx = 0;
			break;
		}
	}
	
	for (var yy = 0; yy < abs(vy); yy++) {
		if (!place_meeting(x, y + sign(vy), oWall)) {
			y += sign(vy);
		} else {
			endChaseY += sign(vy)*-5;
			vy = 0;
			break;
		}
	}
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
	/*
	for (var i = 0; i < array_length(oBackground.backgroundLevel); i++) {
		if (obj.depthZone > oBackground.backgroundLevel[i, 0] && obj.depthZone <= oBackground.backgroundLevel[i, 1]) {
			level = i;
			break;
		}
	}*/
	return oBackground.backgroundLevel[obj.depthZone, 0];
}

function getDepthBottom(obj) {
	if (!instance_exists(oBackground)) return 0;
	if (!instance_exists(obj)) return 0;
	
	var level = 0;
	/*
	for (var i = 0; i < array_length(oBackground.backgroundLevel); i++) {
		if (obj.depthZone > oBackground.backgroundLevel[i, 0] && obj.depthZone <= oBackground.backgroundLevel[i, 1]) {
			level = i;
			break;
		}
	}*/
	return oBackground.backgroundLevel[obj.depthZone, 1];
}