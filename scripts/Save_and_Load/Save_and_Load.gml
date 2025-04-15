function save_game(){
	var _file_path = "gameSave.sav";

	var _save_data = 
	{
		personagens: obj_modal_personagens.personagens,
		modal_dialogues: obter_modal_dialogue_info()
	};
	
	var _json_saves = json_stringify(_save_data);
	show_debug_message(_json_saves);
	var _buffer = buffer_create(string_byte_length(_json_saves) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json_saves);
	buffer_save(_buffer, _file_path);
	buffer_delete( _buffer);
}

function obter_modal_dialogue_info()
{
	var _modal_dialogues = [];
	for(var _i = 0; _i <= array_length(global.dialogues_created) - 1; _i++)
	{
		var _element = global.dialogues_created[_i];
        
		var _dialogue_info = 
		{
			x_pos: _element.modal_x,
			y_pos: _element.modal_y,
			text_dialogo:
			{
				personagem: _element.select_box.obj.valor_selecionado,
				text: _element.dialogue_text.text_box.obj.text_confirmado,
			},
            output:
            {
                obj_pin: _element.output.pin,
            },
            input:
            { 
                obj_pin: _element.input
            }    
		};
		array_push(_modal_dialogues, _dialogue_info);
	}
	return _modal_dialogues;
}

function auto_save(_timer_auto_save, _start_timer_save)
{
	_timer_auto_save--;
	if(_timer_auto_save <= 0)
	{
		save_game();
		_timer_auto_save = _start_timer_save;
	}
	
	return _timer_auto_save;
}


function load_save_file()
{
	var _file_path = "gameSave.sav";
	
	if(file_exists(_file_path))
	{
		var _file_buffer = buffer_load(_file_path);
		
		var _json_string = buffer_read(_file_buffer, buffer_text);
		
		var _saves = json_parse(_json_string);
		
		return _saves;
	}
	return noone;
}