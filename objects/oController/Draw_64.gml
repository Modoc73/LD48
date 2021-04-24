var w = display_get_gui_width();
var h = display_get_gui_height();
var padding = 8;


// Draw Life
var sprW = sprite_get_width(sprBubble);
for(var i = 0; i < health; i++) {
	draw_sprite(sprBubble, 0, w - (sprW*0.5) - padding -((sprW*1.1)*i), (sprW*0.5) + padding);	
}

draw_set_font(font);
draw_set_halign(fa_left);
// Draw Tasks
var sprW = 48;
var xpos = (sprW*0.5) + padding;
var ypos = (24*0.5) + padding;
draw_sprite(sprTasks, currentTask, xpos , ypos);	

draw_text(xpos + 24, ypos, string(taskName) + " " + string(taskText));


// Draw top text
if (string_length(topText) > 0) {
	draw_set_halign(fa_center);
	var xpos = w/2;
	var ypos = (sprW*0.5) + padding;

	draw_text(xpos + 24, ypos, topText);
}