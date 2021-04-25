
display_set_gui_size(640, 360);

currentTextIndex = 0;
tutorialText[0] = "this is flake.^\nyou and him have much in common.^.^.^\n\nclick to continue";
tutorialText[1] = "for example:^\nyou both are easily moved.";
tutorialText[2] = "in flake's case...\nholding the left mouse button down will move him.";
tutorialText[3] = "in your case...^\n you are moved to play silly games.";
tutorialText[4] = "...";
tutorialText[5] = "like flake...\nyour appearance makes everyone think your a clown.";
tutorialText[6] = "but its sad^.^.^. no one even finds you funny.";
tutorialText[7] = "^.^.^.^";
tutorialText[8] = "sorry... getting a bit deep there.\nBack to the game.";
tutorialText[9] = "move: mouse\nexit: esc key\nchange scale: 1 or 2 or 3";




currentText = instance_create_depth(0, 0, depth, oText);
currentText.text = tutorialText[0];

tutorialEnded = false;
fadeTimer = 0;