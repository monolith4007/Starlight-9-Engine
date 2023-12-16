/// player_state_peelout()
// Sonic's figure 8 ability.

// Trigger.
if (state == STATE_LOOKUP && input_action_pressed)
{
    state         = STATE_PEELOUT;
    peelout_flag  = false;
    peelout_timer = 0;
    audio_play(SFX._player_peelout_charge, SFX.sfx_volume, 1, 0, 0);
}

if (state == STATE_PEELOUT && ground)
{
    // Charge:
    if (input_up)
    {
        peelout_timer = min(peelout_timer + 1, 30);
    }
    else // Release.
    {
        state = STATE_DEFAULT;
        audio_stop(SFX._player_peelout_charge);
        if (peelout_timer >= 15)
        {
            // Set release speed:
            if (peelout_timer >= 30 && !underwater)
            {
                x_speed      = animation_direction * 12;
                peelout_flag = true;
            }
            else if (peelout_timer < 30 ^^ underwater)
            {
                x_speed = animation_direction * 6;
            }
            else
            {
                x_speed = animation_direction * 3;
            }
            audio_play(SFX._player_peelout_release, SFX.sfx_volume, 1, 0, 0);
        }
    }
}

// Reset peelout animation flag.
if (peelout_flag)
{
    if (abs(x_speed) < 10 || state != STATE_DEFAULT || animation_index != "PEELOUT")
    {
        peelout_flag = false;
    }
}
