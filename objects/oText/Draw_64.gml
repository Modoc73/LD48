var w = display_get_gui_width();
var h = display_get_gui_height();

draw_set_font(font);
draw_set_alpha(1);

draw_set_halign(fa_center);

if (delay <= 0) {
	if (mouse_check_button_pressed(mb_left) && autoRemove == false) {
		textSpeed*=1.5;	
	}

	if (characters <= string_length(text)) {
		displayText = string_copy(text, 0, characters);
		if (string_char_at(text, characters) == "^") {
			characters+=textSpeed*0.2;
		} else {
			characters+=textSpeed;
		}
	} else {
		textEnded = true;
		displayText = text;
	}

	if (textEnded && autoRemove) {
		removeTimer--;
		if (removeTimer < 0) instance_destroy();
	}
	draw_text_ext(w*0.5, h*0.5, string_lower(displayText), 26, w*0.8);

} else {
	delay--;	
}
