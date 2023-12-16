/// player_handle_monitors()
// Handles the collision between monitors and the player.
var monitor;
monitor = instance_nearest(x, y, par_monitor);
if (monitor != noone)
{
    if (!cpu_flag)
    {
        // Check if we collide with the top:
        if (player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, monitor) && y_speed >= 0)
        {
            if ((state == STATE_JUMP && amy_hammer_attack == 0) || state == STATE_GLIDE || shield_action == 1 || state == STATE_HOMING || amy_hammer_attack == 2 || (amy_hammer_attack == 3 && animation_frame < 5))
            {
                // Destroy monitor:
                with (monitor) instance_destroy();

                // Rebound:
                if (state != STATE_HOMING)
                {
                    if (state != STATE_GLIDE || (state == STATE_GLIDE && y_speed > 0.5))
                    {
                        y_speed *= -1;
                        ground   = false;
                        if (!roll_rebounce && amy_hammer_attack != 2 && amy_hammer_attack != 3)
                        {
                            jump_completed = false;
                        }
                    }
                }
                else
                {
                    jump_action    = true;
                    ground         = false;
                    state          = STATE_JUMP;
                    x_speed        = 0;
                    y_speed        = -6;
                    jump_completed = false;
                }

                // Reset bubble shield:
                if (shield_index == SHIELD_BUBBLE && shield_action > 0)
                {
                    shield_action              = 0;
                    jump_action                = true;
                    shield_object.sprite_index = spr_shield_bubble;
                }
            }
        }

        // Check if we collide with the side:
        if (player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, monitor) || player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, monitor))
        {
            if (state == STATE_ROLL || shield_action == 1 || state == STATE_GLIDE || state == STATE_SLIDE || state == STATE_HOMING || (amy_hammer_attack == 1 && animation_frame > 5) || boosting)
            {
                // Destroy monitor:
                with (monitor) instance_destroy();

                // Rebound (homing attack):
                if (state == STATE_HOMING)
                {
                    jump_action    = true;
                    ground         = false;
                    state          = STATE_JUMP;
                    x_speed        = 0;
                    y_speed        = -6;
                    jump_completed = false;
                }
            }
        }
    }

    // Check if we collide with the bottom:
    if (y_speed <= 0 && state != STATE_CLIMB)
    {
        if (state != STATE_CROUCH && state != STATE_SPINDASH)
        {
            if (state == STATE_JUMP || state == STATE_ROLL)
            {
                // Bump the monitor.
                if (player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, monitor))
                {
                    monitor.bumped  = true;
                    monitor.y_speed = -2;
                    if (y_speed < 0) y_speed = 0;
                }
            }
            else
            {
                // Allow the monitor to bounce on our head.
                if (player_collision_check(COL_TOP_OBJECT, MASK_MAIN, x, y, angle, monitor))
                {
                    monitor.bumped  = true;
                    monitor.y_speed = -2;
                }
            }
        }
        else
        {
            if (player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y - 2, angle, monitor))
            {
                if (state == STATE_SPINDASH && !cpu_flag)
                {
                    // Destroy the monitor.
                    with (monitor) instance_destroy();
                }
                else
                {
                    monitor.bumped  = true;
                    monitor.y_speed = -2;
                }
            }
        }
    }
}
