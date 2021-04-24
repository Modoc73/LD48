var w = display_get_gui_width();
var h = display_get_gui_height();
var padding = 8;


// Draw Life
var sprW = sprite_get_width(sprBubble);
for(var i = 0; i < health; i++) {
	draw_sprite(sprBubble, 0, w - (sprW*0.5) - padding -((sprW*1.1)*i), (sprW*0.5) + padding);	
}

draw_set_font(font);
// Draw Tasks
var sprW = 12;
var xpos = (sprW*0.5) + padding;
var ypos = (sprW*0.5) + padding;
draw_sprite(sprTasks, currentTask, xpos , ypos);	

draw_text(xpos + 24, ypos, taskName);
