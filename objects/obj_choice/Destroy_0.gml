var _destroy_elements = function(_element)
{
	instance_destroy(_element.text_box);
	instance_destroy(_element.pin);
}

array_foreach(choices, _destroy_elements);