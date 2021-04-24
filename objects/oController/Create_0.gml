health = 4;
totalHeight = 0;

display_set_gui_size(640, 360);

cameraInit();
spawnerInit();

application_surface_draw_enable(false);
uniformTime = shader_get_uniform(shdApplication, "time");
uniformPosition = shader_get_uniform(shdApplication, "position");
shaderTime = 0.0;