/// player_state_climb()
// Knuckles' climbing ability.
if (state == STATE_CLIMB)
{
    // Keep our horizontal speed at 0.
    x_speed = 0;

    // If the x position doesn't match the position given in the variable climb_ox, stop climbing. We do the same if we ground or our angle changes.
    if (x != climb_ox || ground || angle != 0)
    {
        if (ground)
        {
            state = STATE_DEFAULT;
        }
        else
        {
            state = STATE_GLIDE_DROP;
        }
        climb_ox = 0;
    }

    // If we're not grabbing onto anything, or we're grabbing onto an obstacle, fall.
    if ((!player_collision_check(COL_RIGHT, MASK_BIG, x, y, angle) && !player_collision_check(COL_LEFT, MASK_BIG, x, y, angle))
    || (player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, par_obstacle) || player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, par_obstacle)))
    {
        if (!ground)
        {
            state = STATE_GLIDE_DROP;
        }
    }

    // If we're grabbing onto a ledge, climb up.
    if (y_speed <= 0 && !ledge_grabbing)
    {
        if ((animation_direction == 1 && !player_collision_check(COL_RIGHT, spr_mask_ledge_climb, x, y, angle))
        || (animation_direction == -1 && !player_collision_check(COL_LEFT,  spr_mask_ledge_climb, x, y, angle)))
        {
            y_speed         = 0;
            ledge_grabbing  = true;
            animation_frame = 0;
            input_up        = false;
        }
    }

    if (ledge_grabbing)
    {
        if (floor(animation_frame) > 2)
        {
            state           = STATE_DEFAULT;
            animation_index = "IDLE";
            input_up        = false;
            ledge_grabbing  = false;
            y              -= 22;
            x              += animation_direction * 24;
        }
    }

    // When pressing up or down, climb and animate.
    if (!ledge_grabbing)
    {
        if (input_up)
        {
            if (!player_collision_check(COL_TOP, MASK_MAIN, x, y, angle))
            {
                y_speed         = -climb_speed;
                animation_speed = 0.15;
            }
            else
            {
                y_speed         = 0;
                animation_speed = 0;
                animation_frame = 0;
            }
        }
        else if (input_down)
        {
            if (!ground)
            {
                y_speed         = climb_speed;
                animation_speed = 0.15;
            }
        }
        else // Stop movement.
        {
            y_speed         = 0;
            animation_speed = 0;
            animation_frame = 0;
        }

        // Jump off walls.
        if (input_action_pressed)
        {
            state   = STATE_JUMP;
            x_speed = animation_direction * -4;
            y_speed = -4;
            if (underwater)
            {
                x_speed *= 0.5;
                y_speed *= 0.5;
            }
            animation_direction = -animation_direction;
            player_reset_trail();
            audio_play(SFX._player_jump, SFX.sfx_volume, 1, 0, 1);
        }
    }
}

// Reset ledge climb flag when not climbing.
if (state != STATE_CLIMB && ledge_grabbing)
{
    ledge_grabbing = false;
}
