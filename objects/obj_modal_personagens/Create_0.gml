event_inherited();

top_color = c_red;
definir_cor_top_modal(top_color);
personagens = [];
array_foreach(global.save_file.personagens, function(_element)
{
	array_push(personagens, _element);
});
is_node_other_modal = false;

modal_min_height = 240; // Altura mínima do modal
modal_item_spacing = 50;
item_height = array_length(personagens) * modal_item_spacing;
modal_height = max(modal_min_height, item_height + modal_margin_bottom);


title = "Characters";
definir_titulo_modal(title);

// Criando o text_box_obj dentro do modal
label_text_box = "Name";
distancia_label_text_box = 0;
distancia_label_text_box = string_width(label_text_box) + 20;
text_box_pos_x = modal_x + distancia_label_text_box;
text_box_pos_y = modal_y + 20;

text_box_obj = instance_create_layer(text_box_pos_x, text_box_pos_y, "Instances", obj_text_box);
objetos = [text_box_obj];

function alterar_posicao_text_box()
{
	if(text_box_obj != noone)
	{
		text_box_obj.x_pos = modal_x + distancia_label_text_box;
		text_box_obj.y_pos = modal_y + 20;
		text_box_pos_y = text_box_obj.y_pos;
		text_box_obj.visible = !is_minimized;
	}
}

function deletar_personagem_selecionado_por_index(_posicao, _lista_personagens, _y_pos)
{
	if(posicao_do_mouse_igual_posicao_sprite(modal_x + 250, modal_y + _y_pos,modal_x + 282, modal_y + _y_pos + 32 ))
	{
		if(mouse_check_button_released(mb_left))
		{
			array_delete(_lista_personagens, _posicao, 1);
			item_height = array_length(_lista_personagens) * modal_item_spacing;
			modal_height = max(modal_min_height, item_height + modal_margin_bottom);
		}
	}
}