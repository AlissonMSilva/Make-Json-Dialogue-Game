choices = [];
pos_x = x;
pos_y = y;

action_buttons = 
{
	add:
	{
		sprite: spr_plus,
		action: function(_lista_de_escolhas, _pos_x, _pos_y)
		{
			array_push(_lista_de_escolhas,criar_text_box_choice(_pos_x, _pos_y));
		}	
	},
	remove: 
	{
		sprite: spr_bin_icon,
		action: function(_index_choice, _choice_array)
		{
			instance_destroy(_choice_array[_index_choice].text_box);
			instance_destroy(_choice_array[_index_choice].pin);
			array_delete(_choice_array, _index_choice, 1);
		}
	}
};