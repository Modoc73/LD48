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
		if(doTeeth == false) {
			doTeeth = true;
			
			if (audio_is_playing(jawsSound)) {
				audio_sound_gain(jawsSound, 0, 0.1);
			}
			jawsSound = audio_play_sound(sndJaws, 20, false);
			
			audio_sound_gain(jawsSound, 1, room_speed*4);
			audio_sound_pitch(jawsSound, 1);
		}
	} else {
		if (doTeeth == true) {
			if (audio_is_playing(jawsSound)) {
				audio_sound_gain(jawsSound, 0, room_speed*4);	
				audio_sound_pitch(jawsSound, 1.1);
			}
		}
		doTeeth = false;	
	}
}