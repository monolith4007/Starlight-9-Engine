/// player_state_dropdash()
// Sonic's dropdash ability.

// Initialize dropdash.
if (state == STATE_JUMP && (shield_index == 0 || shield_index == SHIELD_NORMAL) && input_special_pressed && jump_action)
{
    dropdash_state = 1;
}

// Charge dropdash.
if (input_special && dropdash_state == 1)
{
    if (dropdash_timer > 0)
    {
        dropdash_timer -= 1;
    }
    else
    {
        dropdash_state = 2;
        audio_play(SFX._player_dropdash, SFX.sfx_volume, 1, 0, 0);
    }
}

// Release.
if (ground && dropdash_state == 2)
{
    if (angle_relative < 90 || angle_relative > 270)
    {
        // Change state and apply camera lag effect.
        state               = STATE_ROLL;
        obj_camera.alarm[0] = 16;
        
        // Set dropdash speeds.
        var dropdash_speed, dropdash_max_speed;
        dropdash_speed     = 8;
        dropdash_max_speed = 12;
        if (underwater)
        {
            dropdash_speed     *= 0.5;
            dropdash_max_speed *= 0.5;
        }
        
        // Set release speed based on animation direction, angle and current speed.
        if (x_speed == 0 || sign(x_speed) == animation_direction)
        {
            x_speed = clamp(animation_direction * dropdash_speed + (x_speed / 4), -dropdash_max_speed, dropdash_max_speed);
        }
        else
        {
            x_speed = animation_direction * dropdash_speed + (x_speed / 2) * (angle != 0);
        }
        
        // Reset action keys to fix being able to jump immediately as you land, preventing launching forward.
        input_action         = false;
        input_action_pressed = false;
        
        // Create dust effect.
        create_effect(spr_dropdash_dust, 0.5, floor(x - animation_direction), floor(y), -10, 0, animation_direction, angle);
        
        // Play release sound.
        audio_play(SFX._player_spindash_release, SFX.sfx_volume, 1, 0, 0);
    }
}

// Reset dropdash state.
if (dropdash_state != 0 && (!input_special || !jump_action || state != STATE_JUMP || (shield_index != 0 && shield_index != SHIELD_NORMAL)))
{
    dropdash_state = 0;
    dropdash_timer = 20;
    audio_stop(SFX._player_dropdash);
}
