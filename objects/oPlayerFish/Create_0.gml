event_inherited();
vx = 0;
vy = 0;
maxSpeed = 5;
acceleration = 0.3;
minDistance = 48;

chaseX = x;
chaseY = y;
endChaseX = x;
endChaseY = y;
chaseTick = 0;

isChasing = false;


facing_direction = 0;
image_speed = 0.2;
scaleY = 1;

randomX = 0.02;
randomY = 0.03;

randomDistX = 2;
randomDistY = 1.6;

foodEaten = 0;

hurtTime = room_speed*2;
hurtTimer = 0;
modifier = 1;
health = 1;