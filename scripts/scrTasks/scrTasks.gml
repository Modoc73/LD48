function tasksInit() {
	taskTick = 0;
	currentTask = 0;
	taskName = "EAT";
}

function doTasks() {
	taskTick++;
	switch(unlockedLevel) {
		case(0):
			taskName = "eat";
			dropFood();
			if (instance_exists(oPlayerFish)) {
				if (oPlayerFish.foodEaten > 7) {
					taskDone();	
				}
			}
			break;
	}
}

function dropFood() {
	if (taskTick mod (room_speed*2) == 0 || taskTick mod (room_speed*5) == 0) {
		var rx = random_range(100, room_width-100);
		instance_create_layer(rx, -50, "Instances", oFishFood);	
	}
}

function taskDone() {
	currentTask++;
	unlockedLevel++;
	taskTick = 0;
}