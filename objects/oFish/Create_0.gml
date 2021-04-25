vx = random(10);
vy = random(10);
maxSpeed = random_range(1, 3.5);
acceleration = random_range(0.03, 0.2);
minDistance = 48;

chaseX = x;
chaseY = y;
endChaseX = x;
endChaseY = y;
chaseTick = 0;

chasing = noone;
beingChased = noone;
escapeDistance = 200;

chasingTimer = room_speed*5;
restTime = room_speed*5;
waitChaseTimer = room_speed*0.5;
waitChaseTime = 0;
biteFish = false;

isChasing = false;

isFollowing = true;


facing_direction = 0;
prev_direction = 0;
image_speed = 0.2;
image_index = random(image_number);
scaleY = 1;


randomize();
randomX = random_range(0.005, 0.04);
randomY = random_range(0.005, 0.04);

randomDistX = random_range(1.5, 2);
randomDistY = random_range(1.5, 2);

depthZone = floor(y/(360*2));