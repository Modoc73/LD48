if (oController.currentTask == 1) {
	if (x < other.x-10) other.hitLeft = 1;
	if (x > other.x+10) other.hitRight = 1;

	with(other) activateRing(self);	

	startTaskTimer();
}