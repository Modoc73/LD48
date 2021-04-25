if (!audio_is_playing(sndBackgroundLoop)) {
	var bg = audio_play_sound(sndBackgroundLoop, 50, true);
	audio_sound_gain(bg, 0.6, room_speed*2);
}

if (!audio_is_playing(sndMusic)) {
var bgm = audio_play_sound(sndMusic, 50, true);
audio_sound_gain(bgm, 0.2, room_speed*3);
}

audio_stop_sound(sndTick);
audio_stop_sound(sndTaskFail);