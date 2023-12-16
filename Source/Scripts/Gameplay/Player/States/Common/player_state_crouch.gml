/// player_state_crouch()
// The player's crouching state.

// Crouch down when the player is quiet on the ground:
if (ground && x_speed == 0 && (state == STATE_DEFAULT || state == STATE_GLIDE_DROP) && amy_hammer_attack == 0 && input_down)
{
    state = STATE_CROUCH;
}

// Check if crouching:
if (state == STATE_CROUCH)
{
    // Reset state if moving or not holding down:
    if (x_speed != 0 || y_speed != 0 || !input_down)
    {
        state = STATE_DEFAULT;
    }
}
