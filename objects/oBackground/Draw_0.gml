var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);


if (!surface_exists(surface)) {
	surface = surface_create(cw, ch);	
}
if (!surface_exists(surfaceRocks)) {
	surfaceRocks = surface_create(cw, ch);	
}

if (surface_exists(surface) && surface_exists(surfaceRocks)) {
	
	surface_set_target(surface);
	draw_clear(c_white);
	
	
	surface_set_target(surfaceRocks);
	draw_clear_alpha(c_white, 0);
	gpu_set_blendmode_ext(bm_src_alpha, bm_normal);
	var lay_id = layer_get_id("Rocks");
	var map_id = layer_tilemap_get_id(lay_id);
	draw_tilemap(map_id, -cx, -cy);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	
	for (var i = 0; i < array_length(backgroundLevel); i++) {
	
		if (cy > backgroundLevel[i, 1] || cy+ch < backgroundLevel[i, 0]) continue;
		var col1 = backgroundLevel[i, 2];
	
		if (i != 0) {
			col1 = backgroundLevel[i-1, 2];	
		}
		var col2 = backgroundLevel[i, 2];
	
		//draw_rectangle_color(cx, backgroundLevel[i, 0], cx+cw, backgroundLevel[i, 1], col1, col1, col2, col2, false);
		
		var y1, y2; 
		y1 = backgroundLevel[i, 0] - cy;
		y2 = backgroundLevel[i, 1] - cy;
		
		draw_rectangle_color(0, y1, cw, y2, col1, col1, col2, col2, false);
	
	
	}
	draw_set_alpha(0.9);
	draw_surface(surfaceRocks, 0, 0);
	draw_set_alpha(1);
	
	surface_reset_target();
	
	


	shader_set(shdWater);
	draw_surface(surface, cx, cy);
	draw_set_alpha(0.05);
	draw_surface(surfaceRocks, cx, cy);
	draw_set_alpha(1);
	shader_reset();
}

draw_set_color(c_white);



for (var i = 1; i < array_length(backgroundLevel); i++) {
	if (oController.unlockedLevel <= i) {
		var yy = backgroundLevel[i, 0];
		draw_line(0, yy, room_width, yy);
		draw_sprite(sprLocked, 0, cx + (cw*0.5), yy);
	}
}