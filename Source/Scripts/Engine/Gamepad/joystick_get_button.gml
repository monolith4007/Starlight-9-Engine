/// joystick_get_button()
// Returns a joystick button press.
var i;
for (i = 0; i <= joystick_buttons(0); i += 1)
{
    if (joystick_check_button(0, i))
    {
        return i;
    }
}
return -1;
