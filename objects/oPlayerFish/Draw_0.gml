draw_set_alpha(0.15);
draw_set_color(c_white);
gpu_set_blendmode(bm_add);
draw_circle_color(x, y, 24, c_white, c_black, false);
gpu_set_blendmode(bm_normal);


draw_set_alpha(1);
event_inherited();

