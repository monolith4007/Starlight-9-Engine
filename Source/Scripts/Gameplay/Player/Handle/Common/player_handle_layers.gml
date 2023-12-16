/// player_handle_layer()
// Script that handles layer switching.

// Low Layer:
if (place_meeting(x, y, obj_layer_switch_low))
{
    collision_layer = 0;
}

// High Layer:
if (place_meeting(x, y, obj_layer_switch_high))
{
    collision_layer = 1;
}

// Switch Layer:
if (place_meeting(x, y, obj_layer_switch) && ground)
{
    if (x_speed > 0)
    {
        collision_layer = 1;
    }
    if (x_speed < 0)
    {
        collision_layer = 0;
    }
}
