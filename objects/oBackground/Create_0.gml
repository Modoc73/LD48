var h = 360;

backgroundLevel[0, 0] = 0;			// Start Y
backgroundLevel[0, 1] = 360*1.5;    // height
backgroundLevel[0, 2] = make_color_rgb(149, 195, 244); // Colour

backgroundLevel[1, 1] = 360*3;    // height
backgroundLevel[1, 2] = make_color_rgb(131, 176, 219); // Colour

backgroundLevel[2, 1] = 360*3;    // height
backgroundLevel[2, 2] = make_color_rgb(121, 159, 205); // Colour

backgroundLevel[3, 1] = 360*3;    // height
backgroundLevel[3, 2] = make_color_rgb(113, 144, 199); // Colour

backgroundLevel[4, 1] = 360*3;    // height
backgroundLevel[4, 2] = make_color_rgb(100, 129, 190); // Colour

backgroundLevel[5, 1] = 360*3;    // height
backgroundLevel[5, 2] = make_color_rgb(74, 89, 140); // Colour

backgroundLevel[6, 1] = 360*3;    // height
backgroundLevel[6, 2] = make_color_rgb(53, 66, 109); // Colour

var height = backgroundLevel[0, 1];
for(var i = 1; i < array_length(backgroundLevel); i++) {
	
	height += backgroundLevel[i, 1];
	
	backgroundLevel[i, 0] = backgroundLevel[i-1, 1];  // y start
	backgroundLevel[i, 1] = height; // yend
}

totalHeight = height;

surface = -1;
surfaceRocks = -1;