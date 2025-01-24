function criar_propriedade_pin(_x, _y) constructor
{
    _x_pos = _x;
    _y_pos = _y;
    _desenhar_linha = false;
    _connect = false;
    _line_connect = false;
    _node_connect = noone;
    _is_output = false;
}

pin = new criar_propriedade_pin(x, y);

function criar_linha_conexao()
{
	if(pin._node_connect != noone)
	{
		if (!pin._line_connect)
		{
			pin._line_connect = instance_create_layer(pin._x_pos, pin._y_pos, "Instances",obj_line_pin);
			pin._line_connect.pos_final = pin._node_connect.input.pin;
			array_push(pin._line_connect.pontos_ligacao, pin._line_connect.pos_final);
		}
	}
}

function desenhar_linha_guia_criar_novo_modal()
{
	var _node_x = pin._x_pos;
	var _node_y = pin._y_pos;

	if(posicao_igual_posicao_sprite(_node_x - sprite_get_width(spr_pin)/2, _node_y - sprite_get_height(spr_pin)/2, _node_x + sprite_get_width(spr_pin)/2, _node_y + sprite_get_height(spr_pin)/2))
	{
		if(mouse_check_button_pressed(mb_left))
		{
			pin._desenhar_linha = true;
		}
	}
	
	if(pin._desenhar_linha && pin._is_output)
	{
		draw_line(pin._x_pos, pin._y_pos, mouse_x, mouse_y);
		if(mouse_check_button_released(mb_left))
		{
			pin._node_connect = instance_create_layer(mouse_x, mouse_y, "Instances", obj_modal_dialogue);
			pin._desenhar_linha = false;
			pin._node_connect.input.pin._connect = true;
			pin._connect = true;
		}	
	}
	criar_linha_conexao();
	
	if(instance_exists(pin._node_connect))
	{
		if(pin._line_connect)
		{
			var _x = pin._node_connect.input.pin._x_pos;
			var _y = pin._node_connect.input.pin._y_pos;
		
			pin._line_connect.pontos_ligacao[array_length(pin._line_connect.pontos_ligacao) - 1] = pin._node_connect.input.pin;
			pin._line_connect.pontos_ligacao[0] = pin;
		}
	}
}
