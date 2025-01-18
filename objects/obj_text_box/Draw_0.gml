//// Desenha a caixa de texto (pode usar uma sprite ou apenas um retângulo)
//draw_set_color(c_white);
//draw_sprite_stretched_ext(spr_textbox_backgorund, 0, x_pos, y_pos, width, height, c_white, 1);

//// Desenha o texto dentro da caixa de texto
//draw_set_color(c_white);
//var _text_display = text;

//if(active)
//	_text_display += cursor
	
//draw_text_ext(x_pos + 5 - deslocamento, y_pos + 10, _text_display, -1, largura_caixa - margem_texto * 2);


// Verifica se a surface existe, se não, cria uma nova
if (surface_texto == -1 || !surface_exists(surface_texto)) {
    surface_texto = surface_create(largura_caixa, width); // Surface do tamanho da caixa
}

// Desenha na surface
surface_set_target(surface_texto);
draw_clear_alpha(c_white, 0); // Limpa a surface para desenhar o texto

// Desenha o texto com deslocamento (se houver)
draw_text(margem_texto - deslocamento, 5, text);

if (active) {
    var largura_texto = string_width(text);
    var pos_cursor_x = margem_texto + largura_texto - deslocamento; // Posição do cursor final
    if (pos_cursor_x <= largura_caixa) {
        draw_text(pos_cursor_x, 5, "|"); // Desenha o cursor dentro da área visível
    }
}

// Volta o desenho ao canvas normal
surface_reset_target();

// Desenha a caixa de texto como um retângulo
draw_sprite_stretched_ext(spr_textbox_backgorund, 0, x_pos, y_pos, width, height, c_white, 1);

// Desenha a surface com o texto dentro da área da caixa de texto
draw_surface(surface_texto, x_pos + 2, y_pos);