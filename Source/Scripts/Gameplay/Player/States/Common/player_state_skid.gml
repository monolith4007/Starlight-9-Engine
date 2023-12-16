/// player_state_skid()
// The player's skidding state.

// Trigger skidding:
if (ground && state == STATE_DEFAULT && input_lock_timer == 0)
{
    if (angle_relative < 45 || angle_relative > 315)
    {
        if ((x_speed <= -4 && input_right) || (x_speed >= 4 && input_left))
        {
            if (sign(x_speed) == animation_direction)
            {
                state = STATE_SKID;
                audio_play(SFX._player_skidding, SFX.sfx_volume, 1, 0, 1);
            }
        }
    }
}

if (state == STATE_SKID)
{
    // Store input direction:
    var input_dir;
    input_dir = input_right - input_left;
    
    // Create dust effect.
    if (animation_timer mod 5 == 0)
    {
        create_effect(spr_skid_dust, 0.25, x, y + 13, -10, 0);
    }
    
    // Return to the default state in the following conditions:
    if ((animation_finished && input_dir == 0) || (angle_relative >= 45 && angle_relative <= 315)
    || input_lock_timer > 0 || !ground || sign(x_speed) != animation_direction || input_dir == animation_direction)
    {
        state = STATE_DEFAULT;
    }
}
