event_inherited();

modal_min_height = 240; // Altura mínima do modal
modal_item_spacing = 85;
item_height = array_length([]) * modal_item_spacing;
modal_height = max(modal_min_height, item_height + modal_margin_bottom);

is_node_other_modal = false;
top_color = c_dkgray;
definir_cor_top_modal(top_color);

title = "Dialogue";
definir_titulo_modal(title);

// Criando o text_box_obj dentro do modal
dialogue_text = 
{
	label: "Text:",
	
	text_box:
	{
		_x: modal_x + 30,
		_y: modal_y + 50,
		obj: instance_create_layer(modal_x + 30, title_pos_y + 150, "UI_modal", obj_text_box),
	}
};

select_box = 
{
	label: "Personagens:",
	obj: instance_create_layer(modal_x + 30, title_pos_y + 25, "UI_modal", obj_lista_selecao),
	pos_x: modal_x + 30,
	pos_y: modal_y + 25,
};

choice_pos_x = modal_x + 62;
choice_pos_y = modal_y + 160 + 16;

choice = 
{
	label: "choice:",
	pos_x: modal_x + 62,
	pos_y: modal_y + 160 + 16,
	obj: instance_create_layer(choice_pos_x, choice_pos_y, "UI_modal", obj_choice),
}
dialogue_text.text_box.obj.exibir_texto_continuamente = true;
dialogue_text.text_box.obj.max_length = 300;

output = instance_create_layer(close_button_x + 10, title_pos_y + 150, "UI_modal", obj_pin);
output.pin._is_output = true;
input = instance_create_layer(title_pos_x, title_pos_y + 150, "UI_modal", obj_pin);

objetos = [dialogue_text.text_box.obj, select_box.obj,choice.obj, input, output];

array_push(global.dialogues_created, self);



function atualizar_posicao_dinamicamente_elementos()
{		
	if(dialogue_text.text_box.obj != noone)
	{
		dialogue_text.text_box.obj.x_pos = modal_x + 30;
		dialogue_text.text_box.obj.y_pos = title_pos_y + 130;
		dialogue_text.text_box.obj.visible = !is_minimized;
	}
	
	output.pin._x_pos = close_button_x + 10;
	output.pin._y_pos = title_pos_y + 150;
	
	input.pin._x_pos = title_pos_x;
	input.pin._y_pos = title_pos_y + 150;
	
	
	select_box.obj.pos_x = modal_x + 30;
	select_box.obj.pos_y = modal_y + 25;
	select_box.obj.visible = !is_minimized;
	
	if(instance_exists(choice.obj))
	{
		choice.obj.pos_x = modal_x + 62;
		choice.obj.pos_y = modal_y + 160;
		choice.obj.visible = !is_minimized;
	}
}

function alterar_propriedade_nodes()
{
	if(!is_minimized)
	{
		input.pin._x_pos = title_pos_x;
		input.pin._y_pos = title_pos_y + 150;
		
		output.pin._x_pos = close_button_x + 10;
		output.pin._y_pos = title_pos_y + 150;
		
	}else
	{

		output.pin._x_pos = close_button_x + 10;
		output.pin._y_pos = title_pos_y + 10;
	}
	
	if(output.pin._node_connect != noone)
	{
		if(instance_exists(output.pin._node_connect))
		{
			if(output.pin._line_connect && !is_closed)
			{
				var _x = output.pin._node_connect.input.pin._x_pos;
				var _y = output.pin._node_connect.input.pin._y_pos;
		
				output.pin._line_connect.pontos_ligacao[array_length(output.pin._line_connect.pontos_ligacao) - 1] = [_x,_y ];
				output.pin._line_connect.pontos_ligacao[0] = [output.pin._x_pos,output.pin._y_pos];
			}
		}
		else
		{
			instance_destroy(output.pin._line_connect);
			output.pin._connect = false;
			output.pin._line_connect = false;
			output.pin._node_connect = noone;
		}
	}
}