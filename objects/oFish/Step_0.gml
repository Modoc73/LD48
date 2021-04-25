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
	chaseY = clamp(chaseY, 10, oController.totalHeight-10);
}



if (isFollowing == false && object_index != oPlayerFish) {
	evadePoint(chaseX, chaseY);
} else {
	followPoint(chaseX, chaseY);
}

addWaterFriction();

doCollisions();

if (waitChaseTime > 0 && isChasing) {
	x = xprevious;
	y = yprevious;
}

var d = distance_to_object(oPlayerFish);
var change = abs(angle_difference(prev_direction, facing_direction));
if (change > 10 && d < 300) {
		if (abs(vx/maxSpeed) > 0.8 || abs(vy/maxSpeed) > 0.8) {
			var sounds = irandom(6);
			switch (sounds) {
				case(0): sounds = sndSplash1; break;
				case(1): sounds = sndSplash2; break;
				case(2): sounds = sndSplash3; break;
				case(3): sounds = sndSplash4; break;
				case(4): sounds = sndSplash5; break;	
				case(5): sounds = sndSplash6; break;	
				case(6): sounds = -1; break;
			}
			if (sounds != -1) {
				var snd = audio_play_sound(sounds, 0, false);
				var volume = (1-(d/300) * min(1, (change/100)))*0.8;
				audio_sound_gain(snd, volume, 0);
			}
		}
}