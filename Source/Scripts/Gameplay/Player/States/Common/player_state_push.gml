/// player_state_push()
// Used for pushing against walls.
var wall_left, wall_right;
wall_left  = player_collision_check(COL_LEFT,  MASK_BIG, x, y, angle);
wall_right = player_collision_check(COL_RIGHT, MASK_BIG, x, y, angle);

// Trigger pushing.
if (state == STATE_DEFAULT && ground)
{
    if (push_timer >= push_timer_max)
    {
        state = STATE_PUSH;
    }
    else
    {
        if ((wall_right && input_right) || (wall_left && input_left))
        {
            push_timer = min(push_timer + 1, push_timer_max);
        }
    }
}

// Stop pushing.
if (state == STATE_PUSH)
{
    if (((wall_left && !input_left && !wall_right) || (wall_right && !input_right && !wall_left) || (!wall_right && !wall_left)))
    {
        state      = STATE_DEFAULT;
        push_timer = 0;
    }
}
