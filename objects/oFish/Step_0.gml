if (!isChasing)  {
	if (chaseTick < 1) {
		chaseTick+=0.01;	
	} else {
		chaseTick++;
	}
	chaseX = endChaseX + sin(chaseTick*randomX)*(minDistance*randomDistX);
	chaseY = endChaseY + cos(chaseTick*randomY)*(minDistance*randomDistY);	
}

if (instance_exists(oController)) {
	chaseY = clamp(chaseY, 100, oController.totalHeight-100);
}



if (isFollowing == false && object_index != oPlayerFish) {
	evadePoint(chaseX, chaseY);
} else {
	followPoint(chaseX, chaseY);
}

addWaterFriction();


x += vx;
y += vy;