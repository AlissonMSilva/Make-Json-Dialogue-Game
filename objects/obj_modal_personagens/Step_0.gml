event_inherited();

if(text_box_obj != noone)
{
	if(text_box_obj.text_confirmado != "")
	{
		array_push(personagens, text_box_obj.text_confirmado);
		text_box_obj.text_confirmado = "";
	}
}
alterar_posicao_text_box();

item_height = array_length(personagens) * modal_item_spacing;