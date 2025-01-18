//// Verificar se o botão esquerdo do mouse foi pressionado
//if (mouse_check_button_pressed(mb_left)) {
//    movendo_ponto = false; // Inicialmente assumimos que não estamos movendo um ponto

//    // Verificar se o mouse está sobre algum ponto existente
//    for (var i = 0; i < array_length(pontos_ligacao); i++) {
//        var ponto = pontos_ligacao[i];
        
//        // Se o mouse estiver sobre o ponto (distância menor que 5 pixels)
//        if (point_distance(mouse_x, mouse_y, ponto[0], ponto[1]) < 5) {
//            ponto_selecionado = i; // Armazenar o índice do ponto selecionado
//            movendo_ponto = true; // Ativar a flag de movimento
//            break;
//        }
//    }

//    // Se o mouse não estiver sobre um ponto, verificar se está sobre a linha para adicionar um novo ponto
//    if (!movendo_ponto) {
//        for (var i = 0; i < array_length(pontos_ligacao) - 1; i++) {
//            var ponto_atual = pontos_ligacao[i];
//            var proximo_ponto = pontos_ligacao[i + 1];

//            // Verificar se o clique está na linha entre dois pontos (usando uma tolerância)
//            if (point_in_line(mouse_x, mouse_y, ponto_atual[0], ponto_atual[1], proximo_ponto[0], proximo_ponto[1], tolerancia_linha)) {
//                // Inserir o novo ponto entre o ponto_atual e o proximo_ponto
//                array_insert(pontos_ligacao, i + 1, [mouse_x, mouse_y]);
//                break;
//            }
//        }
//    }
//}

//// Se estiver movendo o ponto, atualize sua posição para a posição do mouse
//if (movendo_ponto && ponto_selecionado != noone) {
//    pontos_ligacao[ponto_selecionado] = [mouse_x, mouse_y];
//}

//// Parar de mover o ponto quando o botão do mouse for solto
//if (mouse_check_button_released(mb_left)) {
//    movendo_ponto = false;
//    ponto_selecionado = noone;
//}
