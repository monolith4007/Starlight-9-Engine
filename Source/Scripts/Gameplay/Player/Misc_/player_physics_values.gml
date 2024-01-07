/// player_physics_values()
// Stores the player's physics values.

// Horizontal:
x_speed_top    = 6;
x_acceleration = 0.046875;
x_deceleration = 0.5;

// Vertical:
if (state == STATE_HURT)
{
    y_acceleration = 0.1875;
}
else if (state != STATE_FLY)
{
    y_acceleration = 0.21875;
}
jump_strength = -6.5 + (character_id == CHAR_KNUCKLES) * 0.5;
jump_release  = -4;

// Rolling:
roll_deceleration = 0.125;
roll_friction     = 0.0234375;
roll_fric_up      = 0.078125;
roll_fric_down    = 0.3125;

// Superspeed modification.
if (superspeed_timer > 0)
{
    x_speed_top    *= 2;
    x_acceleration *= 2;
    roll_friction  *= 2;
}

// Underwater modification.
if (underwater)
{
    // Horizontal:
    x_speed_top    *= 0.5;
    x_acceleration *= 0.5;
    x_deceleration *= 0.5;
    roll_friction  *= 0.5;
    
    // Vertical:
    if (state == STATE_HURT)
    {
        y_acceleration = 0.09375;
    }
    else if (state != STATE_FLY)
    {
        y_acceleration = 0.0625;
    }
    jump_strength += 3;
    jump_release  *= 0.5;
}
