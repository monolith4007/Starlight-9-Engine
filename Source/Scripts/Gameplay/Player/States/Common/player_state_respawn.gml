/// player_state_respawn(trigger)
// Used for the CPU to respawn.
if (instance_exists(global.player_id[0]))
{
    // Trigger respawn.
    if (argument0)
    {
        state               = STATE_RESPAWN;
        animation_angle     = 0;
        tails_tail_angle    = 0;
        if (invincibility_type != 2)
        {
            invincibility_type  =  1;
            invincibility_timer = -1;
        }
        player_reset_trail();

        // Reset speeds.
        x_speed     = 0;
        y_speed     = 0;
        tunnel_lock = false;

        // Set initial position.
        if (character_id == CHAR_TAILS || character_id == CHAR_KNUCKLES)
        {
            if (global.player_id[0].x > view_xview[0] + view_wview[0] / 2)
            {
                x = view_xview[0] - 50;
                y = view_yview[0] - 50;
            }
            else
            {
                x = view_xview[0] + view_wview[0] + 50;
                y = view_yview[0] - 50;
            }
        }
        else
        {
            x = global.player_id[0].x;
            y = view_yview[0] + view_hview[0] + 50;
        }
    }

    if (state == STATE_RESPAWN)
    {
        switch (character_id)
        {
            // Tails / Knuckles:
            case CHAR_TAILS:
            case CHAR_KNUCKLES:
            {
                // Reposition if outside the view.
                if (x < view_xview[0] - 96)
                {
                    x = view_xview[0] - 50;
                    y = view_yview[0] - 50;
                }
                else if (x > view_xview[0] + view_wview[0] + 96)
                {
                    x = view_xview[0] + view_wview[0] + 50;
                    y = view_yview[0] - 50;
                }

                // Move towards player.
                var _dir;
                _dir = point_direction(x, y, global.player_id[0].x, global.player_id[0].y);
                x   += lengthdir_x(3, _dir);
                y   += lengthdir_y(3, _dir);

                // Finish respawn.
                if (!global.player_id[0].tunnel_lock)
                {
                    if (instance_place(x, y, global.player_id[0]) && in_view(id))
                    {
                        if (character_id == CHAR_TAILS)
                        {
                            state = STATE_ROLL;
                            player_reset_trail();
                        }
                        else
                        {
                            state = STATE_GLIDE_DROP;
                        }
                    }
                }
                break;
            }

            // Sonic / Amy:
            default:
            {
                if (!global.player_id[0].tunnel_lock)
                {
                    // Move towards player.
                    x  = global.player_id[0].x;
                    y += (jump_strength + y_acceleration);

                    // Finish respawn.
                    if (y < global.player_id[0].y - 30 && in_view(id))
                    {
                        state   = STATE_ROLL;
                        ground  = false;
                        y_speed = jump_release;
                        x_speed = global.player_id[0].x_speed;
                    }
                }
            }
        }
    }
}
