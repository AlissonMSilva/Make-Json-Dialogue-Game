function posicao_igual_posicao_sprite(_x, _y, _x2, _y2)
{
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	draw_rectangle_color(_x, _y, _x2, _y2, c_white, c_white, c_white, c_white,true);
	return point_in_rectangle(_mouse_x,_mouse_y, _x, _y, _x2, _y2);
}