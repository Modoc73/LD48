with (other) {
	if (canEat) {
		eat();	
		if (object_index == oFishFood) {
			other.foodEaten++;	
		}
	}
}