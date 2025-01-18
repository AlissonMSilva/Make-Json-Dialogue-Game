
draw_sprite_stretched_ext(spr_modal_background, 1, modal_x, modal_y, modal_width, modal_height, top_color, 1);
draw_sprite_stretched_ext(spr_modal_top, 1, modal_x, top_modal_pos_y, modal_width, top_modal_height, top_color, 1);

// Desenha o título do modal
draw_set_color(c_white);
draw_text(title_pos_x, title_pos_y, title);
// Desenha o botão "-"
draw_set_color(c_white);
draw_text_color(minimazed_button_x, close_button_y + 2, "-", _color_minimazed, _color_minimazed, _color_minimazed, _color_minimazed, 1);
draw_text_color(close_button_x + 5, close_button_y + 2, "x", _color_closed, _color_closed,_color_closed, _color_closed, 1);

closed_modal(item_height);
minimizar_modal(item_height);