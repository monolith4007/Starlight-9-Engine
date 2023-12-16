/// player_state_spindash()
// The player's spindash state.
if (state == STATE_SPINDASH)
{
    if (ground)
    {
        // Release and change to the rolling state if we're no longer holding down:
        if (!input_down)
        {
            state   = STATE_ROLL;
            x_speed = animation_direction * (8 + (spindash_strength div 2));
            if (!cpu_flag) obj_camera.alarm[0] = 16; // Apply camera lag effect.
            player_reset_trail();
            audio_stop(SFX._player_spindash_charge);
            audio_play(SFX._player_spindash_release, SFX.sfx_volume, 1, 0, 0);
        }

        // Add strength to our spindash:
        if (input_action_pressed && spindash_strength < 8)
        {
            spindash_strength = min(spindash_strength + 2, 8);

            // Play charging sound with varying pitch (credit to VectorSatyr for the formula):
            audio_play(SFX._player_spindash_charge, SFX.sfx_volume, 1 + spindash_strength * 0.0625, 0, 0);

            // Reset animation frame.
            animation_frame = animation_start;
        }
    }

    // Decrease spindash strength.
    if (spindash_strength > 0)
    {
        spindash_strength -= floor(spindash_strength / 0.125) / 256;
    }
}

// Trigger Spindash:
if (state == STATE_CROUCH && input_action_pressed)
{
    // Change state and set values:
    state             = STATE_SPINDASH;
    spindash_strength = 0;
    audio_play(SFX._player_spindash_charge, SFX.sfx_volume, 1, 0, 0);
}
