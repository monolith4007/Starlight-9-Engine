/// player_state_hang()
// The player's state when hanging on certain poles.
if (state == STATE_HANG)
{
    // Handle animation & movement.
    switch (hang_type)
    {
        case HANG_STATIC:
        {
            x_speed         = 0;
            animation_index = "HANG";
            break;
        }
        case HANG_SHIMMY:
        {
            animation_index = "HANG_SHIMMY";
            if (input_right && place_meeting(x + sprite_width / 2, y, par_hang))
            {
                x += 0.5;
            }
            else if (input_left && place_meeting(x - sprite_width / 2, y, par_hang))
            {
                x -= 0.5;
            }
            else
            {
                animation_frame = 0;
            }
            break;
        }
        case HANG_DISTANCE:
        {
            if (hang_move_dir == 0)
            {
                var hang_right, hang_left;
                hang_right = instance_place(x + hang_distance, y, par_hang);
                hang_left  = instance_place(x - hang_distance, y, par_hang);
                
                if (hang_right != noone && input_right)
                {
                    with (hang_right)
                    {
                        if (type == HANG_DISTANCE)
                        {
                            other.hang_move_dir = 1;
                        }
                    }
                }
                if (hang_left != noone && input_left)
                {
                    with (hang_left)
                    {
                        if (type == HANG_DISTANCE)
                        {
                            other.hang_move_dir = -1;
                        }
                    }
                }
            }
            else
            {
                if (x < hang_x + hang_distance && hang_move_dir == 1)
                {
                    animation_direction = 1;
                    animation_index     = "HANG_MOVE";
                    x                  += 1.2;
                }
                else if (x > hang_x - hang_distance && hang_move_dir == -1)
                {
                    animation_direction = -1;
                    animation_index     = "HANG_MOVE";
                    x                  -= 1.2;
                }
                else
                {
                    hang_move_dir = 0;
                    hang_x        = x;
                    
                    if (!place_meeting(x + hang_distance, y, par_hang) || !place_meeting(x - hang_distance, y, par_hang) || (!input_left && !input_right))
                    {
                        animation_index = "HANG";
                    }
                    
                    var hang;
                    hang = instance_place(x, y, par_hang);
                    if (hang != noone) x = hang.x;
                }
            }
            break;
        }
    }

    // Stop vertical speed.
    y_speed = 0;

    // Fix y position:
    if (hang_y != 0) y = hang_y;

    // Jump:
    if (input_action_pressed)
    {
        state          = STATE_JUMP;
        hang_timer     = 6;
        jump_completed = false;
        if (input_down)
        {
            y_speed = 0;
        }
        else
        {
            y_speed = jump_strength;
        }
        jump_action = true;
        player_reset_trail();
        audio_play(SFX._player_jump, SFX.sfx_volume, 1, 0, 0);
    }
}

// Reduce hang timer.
if (hang_timer > 0)
{
    hang_timer -= 1;
}

// Make sure the moving direction variable is false if not hanging onto anything.
if (state != STATE_HANG)
{
    hang_move_dir = 0;
}
