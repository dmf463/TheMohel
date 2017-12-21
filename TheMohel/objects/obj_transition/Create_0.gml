w = display_get_gui_width();
h = display_get_gui_height();
half_height = h / 2;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	INTRO,
	RESTART
}
mode = TRANS_MODE.INTRO;
percent = 1;
target = room;