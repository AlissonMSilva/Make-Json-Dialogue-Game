event_inherited();
if(!is_minimized)
{
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	// Desenha a label "Name:"
	draw_text(title_pos_x, text_box_pos_y + 20, label_text_box);

	// Exibe os textos confirmados no array
	var y_offset = 100; // Posição inicial para exibir os textos
	for (var i = 0; i < array_length(personagens); i++) {

	    draw_text(modal_x + 10, modal_y + y_offset + 16, personagens[i]);
	    draw_sprite_stretched_ext(spr_bin_icon, 0, modal_x + 250, modal_y + y_offset,32,32, c_white, 1);
		if(posicao_do_mouse_igual_posicao_sprite(modal_x + 250, modal_y + y_offset,modal_x + 282, modal_y + y_offset + 32 ))
		{
			if(mouse_check_button_released(mb_left))
			{
				array_delete(personagens, i, 1);
				item_height = array_length(personagens) * modal_item_spacing;
				modal_height = max(modal_min_height, item_height + modal_margin_bottom);
			}
		}
	    y_offset += modal_item_spacing; // Mover a posição para baixo a cada linha
	}
	draw_set_valign(-1);
	draw_set_halign(-1);
	
	if(text_box_obj != noone)
	{
		with(text_box_obj)
		{
			event_perform(ev_draw,0);
		}
	}
}