instance_deactivate_all(true);
var left = camera_get_view_x(view_camera[0]) - 80;
var top = camera_get_view_y(view_camera[0]) - 80;
var width = camera_get_view_width(view_camera[0]) + 160;
var height = camera_get_view_height(view_camera[0]) +160;
instance_activate_region(left, top, width, height, true);

instance_activate_object(oWall);
instance_activate_object(oPlayerFish)
instance_activate_object(oBackground);