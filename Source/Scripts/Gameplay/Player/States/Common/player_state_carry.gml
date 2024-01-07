/// player_state_carry()
// Handles Tails' ability to carry other players whilst flying.
// Credit to TsukiruP.

// Get the ID of the second player:
var partner;
partner = instance_nth_nearest(x, y, par_player, 2);

if (character_id == CHAR_TAILS)
{
    // Trigger carry whilst flying.
    if (state == STATE_FLY && !underwater)
    {
        if (partner != noone)
        {
            if (partner.state == STATE_JUMP && !partner.input_down)
            {
                // Check if Tails is colliding with the partner below him:
                if (partner.y >= y + 31 && player_collision_check(COL_BOTTOM_OBJECT, MASK_MAIN, x, y, global.gravity_angle, partner))
                {
                    with (partner)
                    {
                        x_speed       = 0;
                        y_speed       = 0;
                        jump_action   = false;
                        state         = STATE_CARRY;
                    }
                    audio_play(SFX._player_grab, SFX.sfx_volume, 1, 0, 0);
                }
            }

            // Carry the partner and lock their position:
            with (partner)
            {
                if (state == STATE_CARRY)
                {
                    x = other.x;
                    y = other.y + 31;
                }
            }
        }
    }

    // Set animation frame.
    if (animation_index == "FLY_CARRY")
    {
        if (y_speed <= 0)
        {
            animation_frame = 1;
        }
        else
        {
            animation_frame = 0;
        }
    }
}
else
{
    // While being carried...
    if (state == STATE_CARRY)
    {
        if (partner != noone)
        {
            // When nearing the ground, detach from Tails.
            if (player_collision_check(COL_BOTTOM, MASK_MAIN, x, y, angle))
            {
                x_speed = partner.x_speed;
                y_speed = abs(partner.y_speed);
                state   = STATE_DEFAULT;
            }
            
            // If Tails is no longer flying or underwater, or the positions don't match anymore, return to normal.
            if (partner.state != STATE_FLY || partner.underwater || underwater || x != partner.x || y != partner.y + 31)
            {
                x_speed = 0;
                y_speed = 0;
                state   = STATE_DEFAULT;
            }
        }

        // Jump:
        if (input_action_pressed && input_down)
        {
            state          = STATE_JUMP;
            y_speed        = jump_release;
            jump_completed = false;
            jump_action    = true;
            player_reset_trail();
            audio_play(SFX._player_jump, SFX.sfx_volume, 1, 0, 0);
        }
    }
}
