/// player_state_lookup()
// The player's looking up state.

// Look up when the player is quiet on the ground:
if (ground && x_speed == 0 && state == STATE_DEFAULT && amy_hammer_attack == 0 && input_up)
{
    state = STATE_LOOKUP;
}

// Check if looking up:
if (state == STATE_LOOKUP)
{
    // Reset state if moving or not holding up:
    if (x_speed != 0 || y_speed != 0 || !input_up)
    {
        state = STATE_DEFAULT;
    }
}
