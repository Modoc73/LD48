vx = random(10);
vy = random(10);
maxSpeed = random_range(0.5, 2);
acceleration = random_range(0.03, 0.15);
minDistance = 48;

chaseX = x;
chaseY = y;
endChaseX = x;
endChaseY = y;
chaseTick = 0;

isChasing = false;

isFollowing = true;


facing_direction = 0;
image_speed = 0.2;
scaleY = 1;


randomize();
randomX = random_range(0.005, 0.04);
randomY = random_range(0.005, 0.04);

randomDistX = random_range(1.5, 2);
randomDistY = random_range(1.5, 2);