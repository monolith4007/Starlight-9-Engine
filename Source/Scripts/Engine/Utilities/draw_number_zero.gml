/// draw_number_zero(x, y, number, length)
// Draws a given number of zeros at the given position.
var number_string, zero_string, i;
number_string = string(argument2);
zero_string   = "";

for (i = 0; i < (argument3 - string_length(number_string)); i += 1)
{
    zero_string += "0";
}

draw_text(argument0, argument1, zero_string + number_string);
