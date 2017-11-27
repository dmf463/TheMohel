//update destination
if(instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//update object position
x += (xTo - x) / 25; //moves us 1/25th of the position we want to be in. allows for smooth motion, fast when far, slow when close
y += (yTo - y) / 25; //moves us 1/25th of the position we want to be in. allows for smooth motion, fast when far, slow when close

x = clamp(x, view_width_half, room_width - view_width_half); //half the view is where the player will be. x is far left, room_width is far right
y = clamp(y, view_height_half, room_height - view_height_half); // same as above

//update camera position
camera_set_view_pos(cam, x - view_width_half, y - view_height_half);