choices = [];
pos_x = x;
pos_y = y;

action_buttons = 
{
	add:
	{
		sprite: spr_plus,
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