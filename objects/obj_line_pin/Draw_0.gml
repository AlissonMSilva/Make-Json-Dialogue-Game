// Desenhar a linha conectando todos os pontos
for (var i = 0; i < array_length(pontos_ligacao) - 1; i++) {
    var ponto_atual = pontos_ligacao[i];
    var proximo_ponto = pontos_ligacao[i + 1];
	
	if(!instance_exists(ponto_atual._node_connect))
		instance_destroy(self);
		
    draw_line_width(ponto_atual._x_pos, ponto_atual._y_pos, proximo_ponto._x_pos, proximo_ponto._y_pos, 4);
}

//// Desenhar os pontos de ligação
//for (var i = 0; i < array_length(pontos_ligacao); i++) {
//    var ponto = pontos_ligacao[i];
//    draw_circle(ponto[0], ponto[1], 5, false); // Desenhar um círculo para indicar o ponto
//}
