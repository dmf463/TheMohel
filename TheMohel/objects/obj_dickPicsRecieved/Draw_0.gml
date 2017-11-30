var posX = camera_get_view_x(view_camera[0]);
var posY = camera_get_view_y(view_camera[0]);
var camWidth = camera_get_view_width(view_camera[0]);
var DickPics = "Dick Pics Recieved";

draw_set_font(hitFont);
draw_set_color(c_red);
draw_text(posX - 500 + camWidth / 2, posY + 25, string(DickPics));
draw_text(posX + camWidth / 2, posY + 25, string(pics));