cursor = "_";
delay_cursor = 20;
alarm[0]= delay_cursor;

// Variáveis para o TextBox
text = ""; // Texto digitado
text_confirmado = "";
	
exibir_texto_continuamente = true;
max_length = 20; // Máximo de caracteres permitidos
active = false; // Começa inativo até clicar

// Configurações da posição e do tamanho da caixa de texto
x_pos = x;
y_pos = y;
width = 200;
height = 32;

// Controle de deslocamento do texto (scroll)
deslocamento = 0;
largura_caixa = width; // Largura da caixa de texto
margem_texto = 5; // Espaçamento entre o texto e a borda da caixa
surface_texto = -1;
function ativar_desativar_text_box()
{
	if(mouse_check_button(mb_left))
	{
		if (mouse_x > x_pos && mouse_x < x_pos + width &&
		mouse_y > y_pos && mouse_y < y_pos + height)
		{
			active = true; // Ativa o textBox ao clicar nele
			if(!exibir_texto_continuamente)
			{
				if(text == "")
				{
					text_confirmado = "";
					keyboard_string = "";
				}
			}else
			{
				keyboard_string = text;
			}
		}
		else 
		{
			adicionar_texto_digitado_na_variavel_desejada();
			active = false; // Desativa o textBox se clicar fora dele
		}
	}
}

function limitar_quantidade_maxima_caracters()
{
	if (string_length(text) > max_length) {
        text = string_copy(text, 1, max_length);
    }
}

function adicionar_texto_digitado_na_variavel_desejada()
{
	// Desativa a captura de entrada
	text_confirmado = text;
	active = false;
}