health = 4;
totalHeight = 0;
unlockedLevel = 0;

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

font = font_add_sprite_ext(sprFont, "abcdefghijklmnopqrstuvwxyz", false, 0);
draw_set_font(font);