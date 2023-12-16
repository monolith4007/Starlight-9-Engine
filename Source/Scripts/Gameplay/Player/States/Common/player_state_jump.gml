/// player_state_jump()
// The player's jumping state.

// Variable jump:
if (!input_action && y_speed < jump_release && state == STATE_JUMP && !jump_completed)
{
    y_speed = jump_release;
}

// Full jump:
if ((ground || state == STATE_CORKSCREW || state == STATE_CORKSCREW_ROLL) && !player_collision_check(COL_TOP, MASK_BIG, x, y - 6, angle) && input_action_pressed)
{
    if (state != STATE_CROUCH && state != STATE_SPINDASH && state != STATE_PEELOUT && !tunnel_lock && amy_hammer_attack != 1)
    {
        // Reset the player's angle on non-rotatable tiles to prevent gaining any horizontal speed:
        if (!col_rotate_flag) player_set_angle(global.gravity_angle);

        // Set horizontal and vertical speeds depending on the player's jump strength and angle.
        y_speed = -(dsin(angle_relative) * x_speed) - (dcos(angle_relative) * -jump_strength);
        x_speed =  (dcos(angle_relative) * x_speed) - (dsin(angle_relative) * -jump_strength);

        // Roll jump lock (currently disabled):
        // if (state == STATE_ROLL) jump_lock = true;

        // Change flags:
        ground        = false;
        state         = STATE_JUMP;
        jump_action   = true;
        player_set_angle(global.gravity_angle);
        player_reset_trail();

        // Play sound effect:
        audio_play(SFX._player_jump, SFX.sfx_volume, 1, 0, 0);

        // Sprite rendering speed:
        animation_rendering_speed = 1 / max(5 - abs(x_speed), 1);
    }
}

// Complete jump:
if (y_speed > 0)
{
    if (!jump_completed)
    {
        jump_completed = true;
    }
}

// Switch to the jumping state when pressing the jump key whilst ungrounded:
if (((state == STATE_DEFAULT && !ground) || state == STATE_SPRING) && input_action_pressed)
{
    state          = STATE_JUMP;
    jump_action    = true;
    jump_completed = true;
    player_reset_trail();
    animation_rendering_speed = 1 / max(5 - abs(x_speed), 1);
}

// Reset flags we previously changed after landing.
if (ground || state == STATE_HANG)
{
    jump_completed   = false;
    jump_lock        = false;
    jump_action      = false;
    roll_rebounce    = false;
    score_multiplier = 0;
}
