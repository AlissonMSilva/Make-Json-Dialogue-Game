event_inherited();

//desenhar_node_path();

draw_set_color(c_white);
draw_set_valign(fa_middle);

if(!is_minimized && !is_closed)
{	
	draw_text(dialogue_text.text_box.obj.x_pos, dialogue_text.text_box.obj.y_pos - 12, dialogue_text.label);
	draw_text(select_box.obj.pos_x, select_box.obj.pos_y, select_box.label);
	
}
draw_set_color(-1);
draw_set_valign(-1);


