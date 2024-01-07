/// player_handle_badniks()
// Used to handle the badnik interaction.
var badnik;
badnik = instance_nearest(x, y, par_badnik);
if (badnik != noone)
{
    // General collision:
    if (player_collision_check(COL_MAIN_OBJECT, MASK_MAIN, x, y, badnik))
    {
        if (state == STATE_JUMP || state == STATE_ROLL || state == STATE_SPINDASH || state == STATE_GLIDE || state == STATE_SLIDE || state == STATE_HOMING
        || invincibility_type == 2 || amy_hammer_attack == 2 || (amy_hammer_attack == 3 && animation_frame < 5) || (amy_hammer_attack == 1 && animation_frame > 5) || boosting)
        {
            // Regular rebound:
            if (state != STATE_HOMING)
            {
                // Downwards rebound:
                if ((state != STATE_GLIDE && y_speed >= 0) || (state == STATE_GLIDE && y_speed >= 0.5))
                {
                    y_speed *= -1;
                    ground   = false;
                    if (!roll_rebounce && amy_hammer_attack != 2 && amy_hammer_attack != 3)
                    {
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
                else // Upwards rebound.
                {
                    y_speed -= sign(y_speed);
                }
            }
            else // Homing Attack rebound.
            {
                jump_action   = true;
                ground        = false;
                state         = STATE_JUMP;

                if (homing_mode == 0)
                {
                    x_speed = 0;
                }
                else
                {
                    x_speed *= 0.5;
                }

                y_speed        = -6;
                jump_completed = false;
            }

            // Increase score & boost meter:
            player_add_score(badnik.x, badnik.y);
            boost_amount += 20;

            // Destroy the badnik:
            with (badnik) instance_destroy();
        }
        else // Get hit.
        {
            if (invincibility_timer <= 0)
            {
                player_state_hurt(badnik);
            }
        }
    }

    // Check separately for collision whilst flying:
    if (state == STATE_FLY && invincibility_type < 2)
    {
        // Check if the blades of Tails' tails have hit the badnik:
        if (player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, badnik))
        {
            // Rebound if moving upwards:
            if (y_speed < 0) y_speed -= sign(y_speed);
            
            // Destroy the badnik:
            player_add_score(badnik.x, badnik.y);
            with (badnik) instance_destroy();
        }
        else if (player_collision_check(COL_MAIN_OBJECT, MASK_MAIN, x, y, badnik)) // Otherwise, get hit.
        {
            if (invincibility_timer <= 0)
            {
                player_state_hurt(badnik);
            }
        }
    }
}
