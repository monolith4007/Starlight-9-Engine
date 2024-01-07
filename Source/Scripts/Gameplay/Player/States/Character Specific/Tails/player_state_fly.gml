/// player_state_fly()
// Tails' flight ability.
if (state == STATE_FLY)
{
    // Reduce flight time:
    if (tails_flight_timer > 0)
    {
        tails_flight_timer -= 1;
        
        // Gain height:
        if (input_action_pressed && y_speed >= -1)
        {
            y_acceleration = -0.125;
        }
        
        // Drop if we flew too long.
        if (tails_flight_timer <= 0)
        {
            y_acceleration = 0.03125;
        }
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
        animation_jump_speed = 1 / max(5 - abs(x_speed), 1);
    }
}

// Trigger flight:
if (state == STATE_JUMP && input_action_pressed && jump_action)
{
    state          = STATE_FLY;
    y_acceleration = 0.03125;
}

// Reset flight timer.
if (state != STATE_FLY && state != STATE_JUMP && tails_flight_timer < 480)
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
        if (audio_is_playing(SFX._player_fly_drop))
        {
            audio_stop(SFX._player_fly_drop);
        }
        
        // Play the flight sound.
        if (!audio_is_playing(SFX._player_fly))
        {
            audio_play(SFX._player_fly, SFX.sfx_volume, 1, 1, 1);
        }
    }
    else // Dropping.
    {
        // Stop the flight sound if it's playing:
        if (audio_is_playing(SFX._player_fly))
        {
            audio_stop(SFX._player_fly);
        }

        // Play the dropping sound.
        if (!audio_is_playing(SFX._player_fly_drop))
        {
            audio_play(SFX._player_fly_drop, SFX.sfx_volume, 1, 1, 1);
        }
    }
}
else
{
    if (audio_is_playing(SFX._player_fly))
    {
        audio_stop(SFX._player_fly);
    }
    if (audio_is_playing(SFX._player_fly_drop))
    {
        audio_stop(SFX._player_fly_drop);
    }
}
