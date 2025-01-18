event_inherited();

if(instance_exists(obj_modal_personagens))
	select_box.obj.lista = obj_modal_personagens.personagens;

if(is_dragging)
{
	array_foreach(global.dialogues_created,function(_element, _index)
	{
		if(_element == self)
		{
			array_set(global.dialogues_created, _index, self);
		}
	});
}
output.visible = !array_length(choice.obj.choices) > 0;
if(array_length(choice.obj.choices) >= 0)
{
	item_height = array_length(choice.obj.choices) * modal_item_spacing;
	modal_height = max(modal_min_height, item_height + modal_margin_bottom);
}
atualizar_posicao_dinamicamente_elementos();