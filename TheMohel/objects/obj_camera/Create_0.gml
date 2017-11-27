cam = view_camera[0]; //we can access the viewport we're using by calling this
follow = obj_player;
view_width_half = camera_get_view_width(cam) / 2; 
view_height_half = camera_get_view_height(cam) / 2;
xTo = xstart; //the x we're moving the cam to; xstart will return the original position of the obj
yTo = ystart; //the y we're moving the cam to; ystart will return the original position of the obj