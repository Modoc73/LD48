// Inherit the parent event
event_inherited();
targetableFish = oFish;

escapeDistance = 300;
maxSpeed = random_range(2.6, 4);
acceleration = random_range(0.2, 0.4);

chasingTimer = room_speed*2;
restTime = room_speed*2;

chaseDistance = 120;
waitChaseTime = waitChaseTimer;