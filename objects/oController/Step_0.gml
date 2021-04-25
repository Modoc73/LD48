if (instance_exists(oBackground)) {
	totalHeight = oBackground.totalHeight;	
}

cameraFollow(oPlayerFish);

spawner();

particlesDust();
particleBubbles();

doTasks();


if (instance_exists(oPlayerFish)) {
	if (getCurrentDepth(oPlayerFish)+1 > unlockedLevel) {
		doTeeth = true;	
	} else {
		doTeeth = false;	
	}
}