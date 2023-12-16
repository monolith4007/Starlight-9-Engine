/// player_state_hurt(object)
// The player's hurt state.

// Exit in the following states:
if (state == STATE_HURT || state == STATE_DEATH || invincibility_type > 0) exit;

if (global.player_rings > 0 || shield_index != 0 || cpu_flag)
{
    // Switch state and become invulnerable:
    state               = STATE_HURT;
    invincibility_type  = 1;
    invincibility_timer = -1;
    
    // Get the X difference between us and the harmful object:
    var x_diff;
    x_diff = sign(x - argument0.x);
    if (x_diff == 0) x_diff = 1; // This prevents us from being flung upwards if the X difference is 0.

    // Rebound:
    y_speed = -4;
    x_speed = 2 * x_diff;
    if (underwater)
    {
        y_speed *= 0.5;
        x_speed *= 0.5;
    }
    ground = false;
    
    // Stop any special abilities.
    if (amy_hammer_attack != 0)
    {
        amy_hammer_attack  = 0;
    }
    if (boosting)
    {
        boosting = false;
    }

    // Hurt sound:
    if (object_is_ancestor(argument0.object_index, par_spike))
    {
        audio_play(SFX._player_hit_spike, SFX.sfx_volume, 1, 0, 0);
    }
    else
    {
        audio_play(SFX._player_hurt, SFX.sfx_volume, 1, 0, 0);
    }

    // Ring drop:
    if (shield_index == 0)
    {
        if (!cpu_flag) player_ringtoss();
    }
    else
    {
        // Destroy shields:
        with (shield_object) instance_destroy();
    }
}
else
{
    state = STATE_DEATH;
}
