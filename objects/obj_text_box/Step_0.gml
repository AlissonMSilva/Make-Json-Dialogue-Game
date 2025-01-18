ativar_desativar_text_box();

if(active)
{
    text = keyboard_string; // Atualiza o texto com o que foi digitado

    // Limita o tamanho do texto
    limitar_quantidade_maxima_caracters();

    // Para capturar a tecla Enter ou outra tecla específica
	if (keyboard_check_pressed(vk_enter))
		adicionar_texto_digitado_na_variavel_desejada();
	
	var _largura_texto = string_width(text);
	// Se o texto for maior que a caixa, ajusta o deslocamento
	if (_largura_texto > largura_caixa - margem_texto * 2) {
	    deslocamento = _largura_texto - (largura_caixa - margem_texto * 2 - 4);
	} else {
	    deslocamento = 0; // Reseta o deslocamento quando o texto se encaixa na caixa
	}
}