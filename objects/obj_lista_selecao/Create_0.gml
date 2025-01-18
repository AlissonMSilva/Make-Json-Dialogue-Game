lista = [];
sprite = spr_background_list_show;
is_select = false;
pos_x = x;
pos_y = y;
width_box = 200;
heigth_box = 32;
valor_selecionado = "";

function exibir_lista_personagens(_lista_personagens, _is_actived, _pos_x_list, _pos_y_list)
{
	if(_is_actived)
	{
		var _separator = 0;
		var _color = c_white;
		var _x_select = _pos_x_list;
		var _x_select_two = _pos_x_list + 184;
		var _y_select = _pos_y_list + 49;
		
		for(var _personagem = 0; _personagem <= array_length(_lista_personagens) - 1; _personagem++)
		{
			if(posicao_igual_posicao_sprite(_pos_x_list, _y_select + _separator,_x_select_two, _y_select + _separator + 28))
			{
				_color = c_gray;
				if(mouse_check_button(mb_left))
				{
					valor_selecionado = _lista_personagens[_personagem];
					is_select = false;
				}
			}else
			{
				_color = c_white;
			}
			draw_sprite_stretched_ext(spr_background_list,0,_pos_x_list, _pos_y_list + 49 + _separator, 184, 32, _color, 1 );
			draw_set_valign(fa_middle);
			draw_text(_pos_x_list + 8, _pos_y_list + 61 + _separator, _lista_personagens[_personagem]);
			_separator += 32;
			draw_set_valign(-1);
		}
	}
}
