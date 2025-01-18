draw_sprite(spr_pin, pin._connect, pin._x_pos, pin._y_pos);
desenhar_linha_guia_criar_novo_modal();

if(!instance_exists(pin._node_connect))
{
	pin._node_connect = noone;
	pin._line_connect = noone;
}