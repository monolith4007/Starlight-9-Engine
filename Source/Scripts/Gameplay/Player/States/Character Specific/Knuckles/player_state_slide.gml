/// player_state_slide()
// Knuckles' sliding ability.
if (state == STATE_SLIDE)
{
    // Slide sound.
    if (!audio_is_playing(SFX._player_slide))
    {
        audio_play(SFX._player_slide, SFX.sfx_volume, 1, 1, 1);
    }

    // Apply friction.
    x_speed -= min(abs(x_speed), 0.125) * sign(x_speed);
    
    // Come to a halt when no longer holding the action key.
    if (!input_action && x_speed != 0)
    {
        x_speed = 0;
    }

    // Dust effect.
    if (animation_timer mod 5 == 0 && x_speed != 0)
    {
        create_effect(spr_skid_dust, 0.25, x, y + 13, -10, 0);
    }

    // Get up.
    if (x_speed == 0)
    {
        if (animation_frame == 0)
        {
            animation_frame = 1;
        }
        
        if (animation_frame < 2)
        {
            animation_frame += 0.10;
        }
        else
        {
            state = STATE_DEFAULT;
        }
    }

    // Fall if no longer grounded.
    if (!ground) state = STATE_GLIDE_DROP;
    
    // Begin running if the angle is within the "slipping" range:
    if (angle_relative >= 45 && angle_relative <= 315)
    {
        state            = STATE_DEFAULT;
        input_lock_timer = 30;
    }
}
else
{
    // Stop slide sound.
    if (audio_is_playing(SFX._player_slide))
    {
        audio_stop(SFX._player_slide);
    }
}
