
title = "Start";
color = c_green;

modal_width = 120;
modal_height = 32;
modal_min_height = 32; // Altura mínima do modal
modal_margin_bottom = 120; // Margem fixa do final do modal
modal_item_spacing = 25;  // Espaçamento entre os itens
modal_resize_height = 60;

modal_x = x;
modal_y = y;

output = instance_create_layer(modal_x + modal_width - 20, modal_y + 20, "UI_modal", obj_pin);
output.pin._is_output = true;
