// Array para armazenar os pontos de ligação (x, y)
pontos_ligacao = [];

// Adicionando dois pontos iniciais (início e fim da linha)
array_push(pontos_ligacao, [x, y]); // Ponto inicial
_pos_final = noone;

ponto_selecionado = noone; // Ponto atualmente selecionado para mover
movendo_ponto = false; // Flag para saber se está movendo o ponto
tolerancia_linha = 5; // Tolerância para clicar na linha e adicionar pontos

function point_in_line(_x, _y, _x1, _y1, _x2, _y2, _tolerance) {
    var dist_to_line = abs(((_y2 - _y1) * _x) - ((_x2 - _x1) * _y) + (_x2 * _y1) - (_y2 * _x1)) / point_distance(_x1, _y1, _x2, _y2);
    return dist_to_line <= _tolerance;
}