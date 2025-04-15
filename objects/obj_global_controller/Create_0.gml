global.is_actived_component = false;
global.dialogues_export_json = [];
global.dialogues_created = [];
export_data = {
texts: []
};
start_time_save = 3600 * 2;//dois minutos
timer_auto_save = start_time_save;

global.save_file = load_save_file();

if(global.save_file != noone)
{
	if(array_length(global.save_file.modal_dialogues) >= 1)
	{
		var _tamanho_array = array_length(global.save_file.modal_dialogues) - 1;
		for(var _i = 0; _i <= _tamanho_array ; _i++)
		{
			try {
            	var _element = global.save_file.modal_dialogues[_i];
    			var _dialogue = instance_create_layer(_element.x_pos,_element.y_pos, "Instances", obj_modal_dialogue);
    			_dialogue.select_box.obj.valor_selecionado = _element.text_dialogo.personagem;
    			_dialogue.dialogue_text.text_box.obj.text = _element.text_dialogo.text;
    			_dialogue.dialogue_text.text_box.obj.text_confirmado = _element.text_dialogo.text;
                show_debug_message(_element.output);
                
                _dialogue.output.pin._node_connect = _element.output.pin._node_connect;
            }
            catch (error) {
            	
            }
		}
	}
}

function mapear_dialogos(_npc_speaker, _text_dialogue, _opcoes_dialogo)
{
	var _dialogue_transfer_obj = 
	{
		author: _npc_speaker,
		text:[_text_dialogue],
		opcoes: _opcoes_dialogo,
	};
	
	array_push(export_data.texts, _dialogue_transfer_obj);
}

function obter_texto_dialogo_modal(_element)
{
	var dialogue_text_box = variable_instance_get(_element,"dialogue_text");
	var text_box = variable_instance_get(dialogue_text_box,"text_box");
	var _texto_box_obj = variable_instance_get(text_box,"obj");
	return _texto_box_obj.text_confirmado;
}
function obter_texto_nome_personagem(_element)
{
	var personagem_selected_box = variable_instance_get(_element,"select_box");
	var _select_box = variable_instance_get(personagem_selected_box,"obj");
	
	return _select_box.valor_selecionado;
}

function obter_text_opcoes_dialogo(_choice_object)
{
	var _opcoes = [];
	for(var i =0; i <= array_length(_choice_object.choices) - 1; i++)
	{
		var _text_box = variable_instance_get(_choice_object.choices[i],"text_box");
		var t = _text_box.text_confirmado;
		show_debug_message(t);
		array_push(_opcoes, {
			opcao: _text_box.text_confirmado
		});
	}
	
	
	return _opcoes;
}

function obter_opcoes_dialogo(_element)
{
	var _choice = variable_instance_get(_element,"choice");
	var _choice_object = variable_instance_get(_choice,"obj");
	
	return obter_text_opcoes_dialogo(_choice_object);
}

dialogue_object = function(_element)
{
	dialogo_text = obter_texto_dialogo_modal(_element);
	nome_personagem = obter_texto_nome_personagem(_element);
	opcoes_escolha = obter_opcoes_dialogo(_element);
	
	mapear_dialogos(nome_personagem, dialogo_text,opcoes_escolha);
}
