/// @description draw black bars
if(mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, w, percent * half_height, false);
	draw_rectangle(0, h, w, h - (percent * half_height), false);
}

