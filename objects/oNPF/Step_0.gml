event_inherited();

var closestNPF = noone;
var dist = -1;
if (chasingTimer <= 0) {
for (var i = 0; i < instance_number(oFish); i++) {
	var inst = instance_find(oFish, i);
	if (inst.object_index == object_index) continue;
	
	var instDist = distance_to_object(inst);
	
	if (instDist < dist || dist == -1) {
		closestNPF = inst;
		dist = instDist;
	}
}
}

// Start Chasing
if (closestNPF !=noone ) {
	if (closestNPF.isChasing == false && closestNPF.beingChased == noone && chasing == noone) {
		isChasing = true;
		isFollowing = true;;
		chasing = closestNPF;
		closestNPF.beingChased = self
		closestNPF.isFollowing = false;
		closestNPF.isChasing = true;
		
	}
}
      

var forceStop = false;
if (chasingTimer > room_speed*10) forceStop = true;



var food = instance_nearest(x, y, oFishFood);

if (food != noone) {
	if (distance_to_object(food) < 100) {
		chaseX = food.x;
		chaseY = food.y;
		isChasing = true;
		forceStop = true;
	} 
}




if (y > getDepthBottom(self)) {
	chaseY = getDepthTop(self);
	endChaseY = getDepthTop(self)+random_range(0, 50);
	forceStop = true;
}
if (y < getDepthTop(self)) {
	chaseY = getDepthBottom(self);
	endChaseY = getDepthBottom(self)-random_range(0, 50);
	forceStop = true;
}

if (x < 0) {
	chaseX = 0;
	endChaseX = random_range(200, 300);
	forceStop = true;
}
if (x > room_width ) {
	chaseX = room_width;
	endChaseX = room_width-random_range(200, 300);
	forceStop = true;
}

// Stop chasing if evaded
if (beingChased) {
	if (instance_exists(beingChased)) {
		chaseX = beingChased.x
		chaseY = beingChased.y;
		isFollowing = false;
		
		var distFrom = distance_to_object(beingChased);
		
		if (distFrom > escapeDistance ||  forceStop) {
			with(beingChased) {
				stopChasing();
				chasingTimer = restTime;
				isChasing = false;
				chasing = noone;
				isFollowing = true;
			}
			stopChasing();
			chasingTimer = restTime;
			beingChased = noone;
			chasing = noone;
			isFollowing = true;
		}
	}
}

if (chasing) {
	if (instance_exists(chasing)) {
		var distFrom = distance_to_object(chasing);
		
		chaseX = chasing.x;
		chaseY = chasing.y;
		if (distFrom > escapeDistance || forceStop) {
			with(chasing) {
				stopChasing();
				chasingTimer = restTime;
				beingChased = noone;
				chasing = noone;
				isFollowing = true;
			}
			stopChasing();
			chasingTimer = restTime;
			isChasing = false;
			chasing = noone;
			isFollowing = true;
		}
	}
}

if (beingChased == noone && chasing == noone) {
	chasingTimer--;
} else {
	chasingTimer++;	
}