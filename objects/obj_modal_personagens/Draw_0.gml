event_inherited();
if(!is_minimized)
{
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	// Desenha a label "Name:"
	draw_text(title_pos_x, text_box_pos_y + 20, label_text_box);

	// Exibe os textos confirmados no array
	var _y_offset = 100; // Posição inicial para exibir os textos
	for (var i = 0; i < array_length(personagens); i++) {

	    draw_text(modal_x + 10, modal_y + _y_offset + 16, personagens[i]);
	    draw_sprite_stretched_ext(spr_bin_icon, 0, modal_x + 250, modal_y + _y_offset,32,32, c_white, 1);
		deletar_personagem_selecionado_por_index(i, personagens, _y_offset);
	    _y_offset += modal_item_spacing; // Mover a posição para baixo a cada linha
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