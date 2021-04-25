function tasksInit() {
	taskTick = 0;
	currentTask = 0;
	taskName = "EAT";
	taskText = "0";
	
	// Task 2
	isTiming = false;
	taskTime = 0;
	tickSound = -1;
}

function doTasks() {
	taskTick++;
	switch(unlockedLevel) {
		case(1):
			taskName = "eat";
			dropFood();
			if (instance_exists(oPlayerFish)) {
				var eatFood = 5 - min(5,global.deaths);
				if (oPlayerFish.foodEaten >= eatFood) {
					taskDone();	
				}
				taskText = eatFood-oPlayerFish.foodEaten;
			}
			
			
			break;
		case(2):
			taskName = "navigate";
			instance_activate_object(oRing);
				var rings = instance_number(oRing);
				var tRings = rings;
			if (isTiming) {
			
				if (taskTime > 0) {
					taskTime--;
					
					var sec = taskTime/room_speed;
					
					
					topText = string(sec);
					
					
				} else {
					stopTaskTimer();	
					audio_stop_sound(sndTick);
				}
				
				var allDone = true;
				
				for (var i = 0; i < rings; i++) {
					var inst = instance_find(oRing, i);
					if (inst.isActive) {
						tRings--;	
					} else {
						allDone = false;	
					}
				}
				
				if (allDone) {
					with (oRing) instance_destroy();
					taskDone();
					audio_stop_sound(sndTick);
				}
				
			}
			var p = 1 + (1-(tRings/rings))*0.2;
			audio_sound_pitch(tickSound, p);
			taskText = tRings;
			break;
			
		case(3):
			instance_activate_object(oKey);
			var keys = instance_number(oKey);
			taskName = "collect";
			taskText = keys;
			
			if (keys <= 0) {
				taskDone();	
				currentTask++;
				unlockedLevel++;
				
				var t = instance_create_depth(0, 0, depth, oText);
				t.text = "just keep swimming...";
				t.autoRemove = true;
			}
		break;
		case(4): // skipped break;
		case(5):
		
		
		break;
	}
}

function startTaskTimer() {
	with (oController) {
		if (isTiming == false) {
			isTiming = true;
			taskTime = room_speed * 18;
		}
	}
}
function stopTaskTimer() {
	with (oController) {
		isTiming = false;	
		topText = "";
		audio_play_sound(sndTaskFail, 10, 0);
	}
	with (oRing) {
		deactivateRing(self);	
	}
}

function dropFood() {
	if (taskTick mod (room_speed*2) == 0 || taskTick mod (room_speed*5) == 0) {
		var rx = random_range(100, room_width-100);
		instance_create_layer(rx, -50, "Tasks", oFishFood);	
	}
}

function taskDone() {
	currentTask++;
	unlockedLevel++;
	taskTick = 0;
	taskText = "";
	topText = "";
	
	audio_play_sound(sndNextLevel, 10, false);
}