draw_rectangle_color(0,0, view_wport[0], 50, c_black,c_black,c_black,c_black,false);

//export button
if(posicao_igual_posicao_sprite(view_wport[0] - 64, 8, (view_wport[0] - 64) +32, 8 + 32))
{
	if(mouse_check_button_released(mb_left))
	{
		array_foreach(global.dialogues_created, dialogue_object);
		show_debug_message(json_stringify(export_data));
		global.dialogues_export_json = [];
	}
}
draw_sprite_stretched(spr_export_button,0,view_wport[0] - 64, 8, 32, 32);

//dialogue button

if(posicao_igual_posicao_sprite(view_wport[0]/2, 8, view_wport[0]/2 +32, 8 + 32))
{
	if(mouse_check_button_released(mb_left))
	{
		instance_create_layer(view_wport[0]/2 + 32, 128, "Instances", obj_modal_dialogue);
	}
}
draw_sprite_stretched(spr_dialogo_button,0,view_wport[0]/2, 8, 32, 32);
//Save Button
if(posicao_igual_posicao_sprite(view_wport[0] - 120, 8, (view_wport[0] - 120) + 32, 8 + 32))
{
	if(mouse_check_button_released(mb_left))
	{
		save_game();
	}
}

draw_sprite_stretched(spr_save_button,0,view_wport[0] - 120, 8, 32, 32);