
draw_sprite_stretched
(
	spr_background_list_show,
	0,
	pos_x, 
	pos_y + 18,
	width_box, heigth_box
);
draw_set_valign(fa_middle);
draw_text(pos_x + 8, pos_y + 32, valor_selecionado);
draw_set_valign(-1);
exibir_lista_personagens(lista, is_select,pos_x, pos_y);