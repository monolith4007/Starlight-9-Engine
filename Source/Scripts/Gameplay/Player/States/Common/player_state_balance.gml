/// player_state_balance()
// The player's balancing state.
if (ground && x_speed == 0 && angle == global.gravity_angle)
{
    if (state == STATE_DEFAULT || state == STATE_CROUCH || state == STATE_LOOKUP)
    {
        // Store the angles the edge sensors should collide at.
        var angle_left, angle_right;
        angle_left  = wrap_angle(angle + 8);
        angle_right = wrap_angle(angle + 350);
        
        // Trigger the balancing state on tile edges.
        if (player_collision_check(COL_LEFT_EDGE, x, y, angle_left) && !player_collision_check(COL_RIGHT_EDGE, x, y, angle_right))
        {
            state             = STATE_BALANCE;
            balance_direction = 1;
        }
        else if (!player_collision_check(COL_LEFT_EDGE, x, y, angle_left) && player_collision_check(COL_RIGHT_EDGE, x, y, angle_right))
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
