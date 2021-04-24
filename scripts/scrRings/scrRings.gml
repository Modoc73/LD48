function activateRing(obj){
	if (isActive == false) {
		if (hitLeft > 0 && hitRight > 0) {
			isActive = true;	
			with (oController) {
				taskTime += room_speed;	
			}
		}
	}

}
function deactivateRing(obj){
	if (isActive == true) {
		isActive = false;
	}
}