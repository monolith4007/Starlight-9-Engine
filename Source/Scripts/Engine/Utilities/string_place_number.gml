/// string_place_number(string, place, number)
// Inserts the given number in the specified place of the supplied string.
var _string, _place;
_string = string(argument0);
_place  = argument1 - string_length(_string);

while (_place > 0)
{
    _string = string(argument2) + _string;
    _place -= 1;
}

return _string;
