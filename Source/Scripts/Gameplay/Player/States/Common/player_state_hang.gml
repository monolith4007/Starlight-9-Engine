/// player_state_hang()
// The player's state when hanging on certain poles.
if (state == STATE_HANG)
{
    // Handle animations & movement.
    switch (hang_type)
    {
        case HANG_STATIC:
        {
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
                // Set animation:
                animation_index = "HANG";
                
                // Get the nearest hang handles to the left/right of us:
                var hang_right, hang_left;
                hang_right = instance_place(x + hang_distance, y, par_hang);
                hang_left  = instance_place(x - hang_distance, y, par_hang);
                
                if (hang_right != noone && input_right)
                {
                    if (hang_right.type == HANG_DISTANCE)
                    {
                        hang_move_dir = 1;
                    }
                }
                if (hang_left != noone && input_left)
                {
                    if (hang_left.type == HANG_DISTANCE)
                    {
                        hang_move_dir = -1;
                    }
                }
            }
            else
            {
                // Movement:
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
                    // Stop moving:
                    hang_move_dir = 0;
                    hang_x        = x;
                    
                    // Reset animation:
                    if (!place_meeting(x + hang_distance, y, par_hang) || !place_meeting(x - hang_distance, y, par_hang) || (!input_left && !input_right))
                    {
                        animation_index = "HANG";
                    }
                    
                    // Lock X position:
                    var hang;
                    hang = instance_place(x, y, par_hang);
                    if (hang != noone) x = hang.x;
                }
            }
            break;
        }
    }

    // Jump:
    if (input_action_pressed)
    {
        state          = STATE_JUMP;
        hang_timer     = 6;
        jump_completed = false;
        y_speed        = jump_strength * (!input_down);
        jump_action    = true;
        player_reset_trail();
        if (!input_down) audio_play(SFX._player_jump, SFX.sfx_volume, 1, 0, 0);
    }
}

// Reduce hang timer.
if (hang_timer > 0) hang_timer -= 1;

// Reset the moving direction if not hanging onto anything.
if (state != STATE_HANG && hang_move_dir != 0)
{
    hang_move_dir = 0;
}
