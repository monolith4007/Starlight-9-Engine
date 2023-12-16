/// player_state_fly()
// Tails' flight ability.
if (state == STATE_FLY)
{
    // Gain height:
    if (tails_flight_timer > 0)
    {
        tails_flight_timer -= 1;
        if (input_action_pressed && y_speed >= -1)
        {
            y_acceleration = -0.125;
        }
    }
    else // Drop if we flew too long.
    {
        if (y_speed <= 0) y_speed = 0.03125;
        y_acceleration = 0.03125;
    }

    // Reset gravity.
    if (y_speed < -1 || player_collision_check(COL_TOP, MASK_LARGE, x, y, angle))
    {
        y_acceleration = 0.03125;
    }
    
    // Cancel flight.
    if (input_special_pressed)
    {
        state = STATE_JUMP;
        player_reset_trail();
    }
}

// Trigger flight:
if (state == STATE_JUMP && input_action_pressed && jump_action)
{
    state            = STATE_FLY;
    animation_angle  = 0;
    tails_tail_angle = 0;
    y_acceleration   = 0.03125;
}

// Reset flight timer.
if ((ground || state == STATE_HANG || state == STATE_SPRING) && tails_flight_timer < 480)
{
    tails_flight_timer = 480;
}

// Handle sound effects.
if (state == STATE_FLY && !underwater)
{
    // Flying:
    if (tails_flight_timer > 0)
    {
        // Stop the dropping sound if it was playing:
        if (audio_is_playing(SFX._player_flying_drop))
        {
            audio_stop(SFX._player_flying_drop);
        }
        
        // Play the flight sound.
        if (!audio_is_playing(SFX._player_flying))
        {
            audio_play(SFX._player_flying, SFX.sfx_volume, 1, 1, 1);
        }
    }
    else // Dropping.
    {
        // Stop the flight sound if it's playing:
        if (audio_is_playing(SFX._player_flying))
        {
            audio_stop(SFX._player_flying);
        }

        // Play the dropping sound.
        if (!audio_is_playing(SFX._player_flying_drop))
        {
            audio_play(SFX._player_flying_drop, SFX.sfx_volume, 1, 1, 1);
        }
    }
}
else
{
    if (audio_is_playing(SFX._player_flying))
    {
        audio_stop(SFX._player_flying);
    }
    if (audio_is_playing(SFX._player_flying_drop))
    {
        audio_stop(SFX._player_flying_drop);
    }
}
