text = "hello world";

font = font_add_sprite_ext(sprFont, "abcdefghijklmnopqrstuvwxyz1234567890:.", false, 0);

displayText = "";
characters = 0;
textSpeed = 0.15;
textEnded = false;

delay = 0;
autoRemove = 0;
removeTimer = room_speed*1.5;