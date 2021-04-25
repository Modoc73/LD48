if (mouse_check_button_released(mb_left)) {
	if (currentTextIndex+1 < array_length(tutorialText)) {
		if (instance_exists(oText)) {
			if (oText.textEnded) {
				with (oText) instance_destroy();
				currentTextIndex++;
				currentText = instance_create_depth(0, 0, depth, oText);
				currentText.text = tutorialText[currentTextIndex];	
			}
		}
	} else {
		if (instance_exists(oText)) {
			if (oText.textEnded) {
				tutorialEnded = true;
				with(oText) instance_destroy();
			}
		} else {
			tutorialEnded = true;	
		}
	
	}
} 