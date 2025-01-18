is_node_other_modal = false;

// Configurações do modal
modal_width = 300;
modal_min_height = 240; // Altura mínima do modal
modal_margin_bottom = 120; // Margem fixa do final do modal
modal_item_spacing = 25;  // Espaçamento entre os itens
modal_resize_height = 60;
top_color = c_white;

modal_height = max(modal_min_height, modal_item_spacing + modal_margin_bottom);
item_height = 0;
modal_x = x;
modal_y = y;

top_modal_height = 30;
top_modal_pos_y =  modal_y - top_modal_height;

title = "";
title_pos_x = modal_x + 10;
title_pos_y = modal_y - 40;

// Posições do botão de fechar "-"
close_button_size = 20;
close_button_x = modal_x + modal_width - close_button_size - 10; // Canto superior direito
close_button_y = modal_y + 10;
_color_closed = c_white;

minimazed_button_x = modal_x + modal_width - close_button_size - 25; // Canto superior direito
minimazed_button_y = modal_y + 10;
_color_minimazed = c_white;

is_dragging = false;
is_minimized = false;
is_closed = false;
drag_offset_x = modal_x/2;
drag_offset_y = 0;

objetos = [];

function atualizar_modal_height(_modal_height)
{
	modal_height = _modal_height;
}

function definir_cor_top_modal(_color)
{
	top_color = _color
}

function definir_titulo_modal(_title)
{
	title = _title;
}

function desenhar_titulo_modal()
{	
	top_modal_height = 30;
	top_modal_pos_y =  modal_y - top_modal_height;
	title_pos_x = modal_x + 10;
	title_pos_y = top_modal_pos_y + 5;
	close_button_x = modal_x + modal_width - close_button_size - 5;
	close_button_y = title_pos_y;
	minimazed_button_x = modal_x + modal_width - close_button_size - 25; // Canto superior direito
	minimazed_button_y = title_pos_y;
}

function dragging_obj()
{
	
	if(posicao_do_mouse_igual_posicao_sprite(modal_x, top_modal_pos_y, modal_x + modal_width - 45, top_modal_pos_y + top_modal_height))
	{
		if(mouse_check_button_pressed(mb_left) && is_dragging == false)
		{
			is_dragging = true;
		}
	}

	if (is_dragging) 
	{
	    modal_x = mouse_x;
	    modal_y = mouse_y + top_modal_height;
		event_perform(ev_draw, -1);
	}
	
	if(mouse_check_button_released(mb_left) && is_dragging)
		is_dragging = false;

}


function closed_modal(_item_height)
{
	_color_closed = c_white;
	if(posicao_do_mouse_igual_posicao_sprite(close_button_x - 5, close_button_y + 5, close_button_x + close_button_size - 5, close_button_y + close_button_size))
	{
		_color_closed = c_gray;
		if(mouse_check_button_pressed(mb_left))
		{
			is_closed = true;
			instance_destroy(self);
		}
	}
}

function minimizar_modal(_item_height)
{
	_color_minimazed = c_white;
	if(posicao_do_mouse_igual_posicao_sprite(minimazed_button_x - 5, minimazed_button_y + 5, minimazed_button_x + close_button_size - 5, minimazed_button_y + close_button_size))
	{
		_color_minimazed = c_gray;
		if(mouse_check_button_pressed(mb_left))
		{
			is_minimized = !is_minimized;
		}
	}
	
	if(is_minimized)
	{
	
		if(modal_height > 0)
		{
			modal_height -= 10;
		}
	}
	else
	{
		if(modal_height < max(modal_min_height, _item_height + modal_margin_bottom))
		modal_height += 10;
	}
}

function posicao_do_mouse_igual_posicao_sprite(_x, _y, _x2, _y2)
{
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	draw_rectangle_color(_x, _y, _x2, _y2, c_white, c_white, c_white, c_white,true);
	return point_in_rectangle(_mouse_x,_mouse_y, _x, _y, _x2, _y2);
}