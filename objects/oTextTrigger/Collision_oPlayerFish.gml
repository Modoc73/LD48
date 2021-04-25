if (!instance_exists(oText)) {
	var t = instance_create_depth(x, y, depth, oText);
	t.text = text;
	t.autoRemove = true;
	instance_destroy();
}