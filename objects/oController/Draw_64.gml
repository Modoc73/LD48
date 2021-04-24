var w = display_get_gui_width();
var h = display_get_gui_height();
var padding = 8;


// Draw Teeth
if (doTeeth) {
	if (teethTimer >= 0) {
		teethTimer--;	
		var ry = 0.1 + (sin(taskTick*0.08)*0.15);
		
		if (teethTimer < room_speed*1.1) {
			teethTimer -= abs(teethTimer*0.03);	
			teethTimer--;
			ry = 0;
		}
		if (teethTimer < room_speed*0.5) {
			teethTimer*=0.9;
			
		}
		var percent = 1-(teethTimer/teethTotalTime);
		teethY = ((power(percent, 6))*1.1);
		
		
		teethY = min(teethY+ry, 1);
	
	} else {
		room_restart();	
	}
} else {
	teethTimer = min(teethTimer + (teethTotalTime-teethTimer)*0.15, teethTotalTime);
	teethY = max(0, teethY - 0.01 - (power(teethY, 2)*0.03));
	
}
var y1 = -96-60 + (270*teethY);
var col1 = make_color_rgb(52, 52, 50);
var col2 = make_color_rgb(0, 0, 0);
draw_rectangle_color(0, 0, w, y1, col2, col2, col1, col1, false);


var xTimes = w/48;
for (var i = 0; i < xTimes; i++) {
	draw_sprite(sprTeeth, 0, i*48, y1);
}

var y2 = h +20 - (240*teethY);
draw_rectangle_color(0, h, w, y2+95, col1, col1, col2, col2, false);

for (var i = 0; i < xTimes; i++) {
	draw_sprite(sprTeeth, 1, i*48, y2);
}



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


if (fadeIn > 0) {
	fadeIn -= min(0.02, power(fadeIn*0.8, 2))*0.7;
	draw_set_color(c_black);
	draw_set_alpha(fadeIn);
	draw_rectangle(0, 0, w, h, false);
}
	draw_set_alpha(1);
