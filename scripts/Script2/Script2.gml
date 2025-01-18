function criar_text_box_choice(_x, _y) constructor
{
	var _choice_text_box = 
	{
		pos_x:_x,
		pos_y:_y,
		text_box: instance_create_layer(_x, _y, "UI_modal", obj_text_box),
		pin: instance_create_layer(_x + 250, _y + 16, "UI_modal", obj_pin),
	};
	_choice_text_box.pin.pin._is_output = true;
	_choice_text_box.text_box.max_length = 300;
	_choice_text_box.text_box.exibir_texto_continuamente = true;
	
	return _choice_text_box;
}