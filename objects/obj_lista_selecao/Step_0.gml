if(posicao_igual_posicao_sprite(pos_x, pos_y + 18, pos_x + width_box, pos_y + 48))
{
	if(mouse_check_button_released(mb_left))
	{
		is_select = true;
	}
}else
{
	if(mouse_check_button_released(mb_left))
	{
		is_select = false;
	}
}