/// player_state_roll()
// The player's rolling state.
if (state == STATE_ROLL)
{
    if (ground)
    {
        if (input_lock_timer == 0)
        {
            // Decelerate depending on input and direction:
            if (input_left && x_speed > 0)
            {
                x_speed = max(x_speed - roll_deceleration, 0);
            }
            if (input_right && x_speed < 0)
            {
                x_speed = min(x_speed + roll_deceleration, 0);
            }
        }

        // Friction:
        x_speed -= min(abs(x_speed), roll_friction) * sign(x_speed);

        // Uncurl.
        if (abs(x_speed) < 0.5 && !tunnel_lock)
        {
            state = STATE_DEFAULT;
        }
    }
    else
    {
        jump_completed = true;
        jump_action    = false;
        roll_rebounce  = true;
        state          = STATE_JUMP;
    }
}

// Trigger roll by pressing down:
if (state == STATE_DEFAULT && ground && abs(x_speed) >= 1.03125 && input_down && !input_left && !input_right && !boosting)
{
    // Change state:
    state = STATE_ROLL;
    player_reset_trail();
    audio_play(SFX._player_roll, SFX.sfx_volume, 1, 0, 0);
    if (audio_is_playing(SFX._player_peelout_release))
    {
        audio_stop(SFX._player_peelout_release);
    }
}
