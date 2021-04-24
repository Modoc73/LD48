function tasksInit() {
	taskTick = 0;
}

function doTasks() {
	taskTick++;
	switch(unlockedLevel) {
		case(0):
			dropFood();
		
			break;
	}
}

function dropFood() {
	if (taskTick mod (room_speed*2) == 0 || taskTick mod (room_speed*5) == 0) {
		var rx = random_range(100, room_width-100);
		instance_create_layer(rx, -50, "Instances", oFishFood);	
	}
}