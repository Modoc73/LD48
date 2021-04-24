var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);

for (var i = 0; i < array_length(backgroundLevel); i++) {
	
	if (cy > backgroundLevel[i, 1] || cy+ch < backgroundLevel[i, 0]) continue;
	var col1 = backgroundLevel[i, 2];
	
	if (i != 0) {
		col1 = backgroundLevel[i-1, 2];	
	}
	var col2 = backgroundLevel[i, 2];
	
	draw_rectangle_color(cx, backgroundLevel[i, 0], cx+cw, backgroundLevel[i, 1], col1, col1, col2, col2, false);
}

draw_set_color(c_white);