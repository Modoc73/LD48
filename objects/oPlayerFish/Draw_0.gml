if (health <=0) {
	modifier -= 0.01;
	modifier = max(0, modifier);
	
	image_xscale = max(image_xscale - 0.1*modifier, -1);
	if (modifier <= 0) {
		room_restart();
	}
}
draw_set_alpha(0.15*modifier);
draw_set_color(c_white);
gpu_set_blendmode(bm_add);
var hurtField = min(0, (hurtTimer-(hurtTimer*0.5))/hurtTime)*6;
draw_circle_color(x, y, 24 + hurtField, c_white, c_black, false);
gpu_set_blendmode(bm_normal);


draw_set_alpha(1);

if (hurtTimer > 0) {
	image_alpha = hurtTimer mod 3 == 0;
	hurtTimer--;
} else {
	image_alpha = 1;	
}

event_inherited();

