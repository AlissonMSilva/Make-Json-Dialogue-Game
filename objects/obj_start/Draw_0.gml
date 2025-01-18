draw_sprite_stretched_ext(spr_modal_top, 1, modal_x, modal_y, modal_width, modal_height, color, 1);
draw_set_color(c_white);
draw_set_halign(fa_center);

draw_text(modal_x + string_length(title)*2 + 20, modal_y + 10, title);

draw_set_halign(-1);