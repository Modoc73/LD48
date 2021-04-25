image_index = isActive;

draw_self();

gpu_set_blendmode(bm_add);
draw_set_alpha(0.1);
draw_circle_color(x, y, 32, c_white, c_black, false);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);