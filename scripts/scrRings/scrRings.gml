function activateRing(obj){
	if (isActive == false) {
		if (hitLeft > 0 && hitRight > 0) {
			isActive = true;	
			with (oController) {
				taskTime += room_speed*2.5;	
			}
			var r = 0;
			with (oRing) {
				if (isActive) r++;	
			}
			audio_stop_sound(sndRing);
			var s = audio_play_sound(sndRing, 2, false);
			audio_sound_pitch(s, 1 + (0.02*r));
			
					if (!audio_is_playing(sndTick) ) {
						tickSound = audio_play_sound(sndTick, 9, true);	
					}
		}
	}

}
function deactivateRing(obj){
	if (isActive == true) {
		isActive = false;
	}
}