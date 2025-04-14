draw_text(pos_x, pos_y, "Choice");
var _plus_button_color = c_white;


if(posicao_igual_posicao_sprite(pos_x - 32, pos_y, pos_x - 32 + 24,pos_y + 24))
{
	_plus_button_color = c_gray;
	if(mouse_check_button_released(mb_left))
	{
		var text_box_choice = criar_text_box_choice(pos_x - 28, pos_y + 20);
        array_push(choices, text_box_choice);
        show_debug_message(choices);
	}
}

draw_sprite_stretched_ext(action_buttons.add.sprite, 1, pos_x - 32, pos_y, 24, 24, _plus_button_color, 1);
var _separador = 0;
for(var _choice = 0; _choice <= array_length(choices) - 1; _choice++)
{
	var _selected_choice = choices[_choice];
	var _color_remove_button = c_white;
	_selected_choice.pos_x = pos_x - 28;
	_selected_choice.pos_y = pos_y + 32;
	_selected_choice.text_box.x_pos = _selected_choice.pos_x;
	_selected_choice.text_box.y_pos = _selected_choice.pos_y + _separador;
	_selected_choice.pin.pin._x_pos = _selected_choice.pos_x + 250;
	_selected_choice.pin.pin._y_pos = _selected_choice.pos_y + 16 + _separador;
	if(posicao_igual_posicao_sprite(_selected_choice.pos_x + 200, _selected_choice.pos_y + _separador,_selected_choice.pos_x + 200 + 32, _selected_choice.pos_y + _separador + 32))
	{
		_color_remove_button = c_gray;
		if(mouse_check_button_released(mb_left))
		{
			action_buttons.remove.action(_choice, choices);
		}
	}
	draw_sprite_stretched_ext(action_buttons.remove.sprite, 1, _selected_choice.pos_x + 200, _selected_choice.pos_y + _separador, 32, 32, _color_remove_button, 1);
	_separador += 64;
}
