/// player_state_brake()
// The player's braking state.

// Store input direction:
var input_dir;
input_dir = input_right - input_left;

// Trigger braking:
if (ground && state == STATE_DEFAULT && input_lock_timer == 0)
{
    if (angle_relative < 45 || angle_relative > 315)
    {
        // Credit to TsukiruP for providing the following input check:
        if (abs(x_speed) >= 4 && input_dir != 0 && sign(x_speed) != input_dir)
        {
            state = STATE_BRAKE;
            audio_play(SFX._player_brake, SFX.sfx_volume, 1, 0, 0);
        }
    }
}

if (state == STATE_BRAKE)
{
    // Create dust effect.
    if (animation_timer mod 4 == 0 && x_speed != 0)
    {
        create_effect(spr_brake_dust, 0.25, x, y + 13, -10, 0);
    }
    
    // Return to the default state.
    if ((animation_finished && input_dir == 0) || !ground || input_lock_timer > 0 || (angle_relative >= 45 && angle_relative <= 315) || sign(x_speed) == input_dir)
    {
        state = STATE_DEFAULT;
    }
}
