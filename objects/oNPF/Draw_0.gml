if (isDead) image_xscale =-1;
event_inherited();

if (isDead) {
	draw_sprite_ext(sprPlasticBag, 0, x, y, -1, -1, 90+facing_direction, c_white, 0.6);	
}