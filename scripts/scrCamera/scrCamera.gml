function cameraInit() {
	cameraX = 0;
	cameraY = 0;
	cameraXTarget = 0;
	cameraYTarget = 0;
	
	cameraMaxDistance = 200;
}

function cameraFollow(obj){
	if (!instance_exists(obj)) return;
	
	var w = camera_get_view_width(view_camera[0]);
	var h = camera_get_view_height(view_camera[0]);
	cameraXTarget = (obj.x);
	cameraYTarget = (obj.y);
	
	
	var distX = abs(cameraX - obj.x);
	var distY = abs(cameraY - obj.y);
	
	var percentX = min(distX, cameraMaxDistance)/cameraMaxDistance;
	var percentY = min(distY, cameraMaxDistance)/cameraMaxDistance;
	
	
	if (cameraX < cameraXTarget) {
		cameraX = min(cameraX + (distX*0.1*percentX), cameraXTarget);	
	} else if (cameraX > cameraXTarget) {
		cameraX = max(cameraX - (distX*0.1*percentX), cameraXTarget);	
	}
	
	if (cameraY < cameraYTarget) {
		cameraY = min(cameraY + (distY*0.1*percentY), cameraYTarget);	
	} else if (cameraY > cameraYTarget) {
		cameraY = max(cameraY - (distY*0.1*percentY), cameraYTarget);	
	}
	
	
	
	var cx = cameraX - (w*0.5);
	var cy = cameraY - (h*0.5);
	
	cy = clamp(cy, 0, totalHeight - h);
	
	cx = clamp(cx, 0, room_width);
	
	camera_set_view_pos(view_camera[0], cx, cy);
}