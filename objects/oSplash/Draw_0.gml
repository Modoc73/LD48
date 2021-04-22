/*
   Very rubbish quick splash fading stuff
*/
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
var colour = make_color_rgb(black, black, black);

layer_background_blend(back_id, colour);

if (isFadingIn > 0) {
black = min(black+1, 58);
	if (black == 58) {
		image_alpha = min(image_alpha + max(0.05, (1-abs(image_alpha))*0.05), 1);
		if (image_alpha == 1) {
			image_speed = 0.4;
		}

		image_index = min(image_index, image_number-1);
		if (image_index == image_number-1) {
			isFadingIn-=0.05;	
		}
		draw_self();
	}
} else {
	image_alpha-=0.1;
	image_speed = 0;
	black = max(black-1, 0);
	draw_self();
	
	if (black == 0) {
		room_goto(game);	
	}
}