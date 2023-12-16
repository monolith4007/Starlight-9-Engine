/// player_state_balance()
// The player's balancing state.
if (ground && x_speed == 0 && angle == 0)
{
    if (state == STATE_DEFAULT || state == STATE_CROUCH || state == STATE_LOOKUP)
    {
        // Trigger the balancing state on tile edges.
        if (player_collision_check(COL_LEFT_EDGE, x, y, 8) && !player_collision_check(COL_RIGHT_EDGE, x, y, 350))
        {
            state             = STATE_BALANCE;
            balance_direction = 1;
        }
        else if (!player_collision_check(COL_LEFT_EDGE, x, y, 8) && player_collision_check(COL_RIGHT_EDGE, x, y, 350))
        {
            state             = STATE_BALANCE;
            balance_direction = -1;
        }
    }
}
else // Stop balancing if moving.
{
    if (state == STATE_BALANCE)
    {
        state             = STATE_DEFAULT;
        balance_direction = 0;
    }
}
