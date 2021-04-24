 health = 4;
totalHeight = 0;
unlockedLevel = 1;

display_set_gui_size(640, 360);

cameraInit();
spawnerInit();
tasksInit();

particlesInit();

application_surface_draw_enable(false);
uniformTime = shader_get_uniform(shdApplication, "time");
uniformPosition = shader_get_uniform(shdApplication, "position");
shaderTime = 0.0;


repeat(50) {
	particlesDust();	
}

font = font_add_sprite_ext(sprFont, "abcdefghijklmnopqrstuvwxyz1234567890:.", false, 0);
draw_set_font(font);
topText = "";


teethTotalTime = room_speed*5;
teethTimer = teethTotalTime;
teethY = 0;
doTeeth = false;
fadeIn = 1;