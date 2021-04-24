
draw_set_alpha(0.1);
gpu_set_blendmode(bm_subtract);
var c1 = make_color_rgb(0, 0, 0);
var c2 = make_color_rgb(160,160,160);
draw_rectangle_color(0, 0, room_width, room_height, c1, c1, c2, c2, false);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);