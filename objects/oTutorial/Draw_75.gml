if (tutorialEnded) {
	fadeTimer+=0.005;
	draw_set_alpha(fadeTimer);
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
	
	if (fadeTimer >= 1) {
		room_goto(game);
	}
}