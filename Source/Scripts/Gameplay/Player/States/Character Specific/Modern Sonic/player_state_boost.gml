/// player_state_boost()
// Modern Sonic's boosting state.
// Credit to PVic.

// Stop boosting.
if (boosting && (!input_special || boost_amount <= 0 || tunnel_lock || abs(x_speed) < 1))
{
    boosting = false;
}

// Trigger boost.
if (!boosting && input_special && !tunnel_lock && boost_amount > 0 && abs(x_speed) >= 1)
{
    if ((animation_direction == 1 && !player_collision_check(COL_RIGHT, MASK_BIG, x, y, angle)) || (animation_direction == -1 && !player_collision_check(COL_LEFT, MASK_BIG, x, y, angle)))
    {
        if ((state == STATE_DEFAULT && ground && sign(x_speed) == animation_direction) || state == STATE_JUMP || state == STATE_ROLL || state == STATE_CORKSCREW || state == STATE_CORKSCREW_ROLL)
        {
            // Set boosting flag.
            boosting = true;
            
            // If rolling, change to the default state.
            if (state == STATE_ROLL) state = STATE_DEFAULT;
            if (state == STATE_CORKSCREW_ROLL) state = STATE_CORKSCREW;
            
            // Apply miscellaneous effects.
            if (obj_camera.alarm[0] == -1)
            {
                obj_camera.alarm[0] = 16;
            }
            instance_create(x, y, obj_boost);
            audio_play(SFX._player_boost_start, SFX.sfx_volume, 1, 0, 0);
        }
    }
}

// While boosting...
if (boosting)
{
    // Check if we're not skidding and facing the direction we're moving towards:
    if (state != STATE_SKID && sign(x_speed) == animation_direction)
    {
        // Decrease boost amount.
        boost_amount -= 0.2;
        
        // Set speed:
        if (!underwater)
        {
            if (abs(x_speed) < 12)
            {
                x_speed = animation_direction * 12;
            }
        }
        else
        {
            if (abs(x_speed) < 6)
            {
                x_speed = animation_direction * 6;
            }
        }
    }
    else if (state != STATE_JUMP) // Otherwise, stop boosting.
    {
        boosting = false;
    }
}

// Destroy the boost effect if not boosting.
if (instance_exists(obj_boost) && !boosting)
{
    with (obj_boost) instance_destroy();
}

// Cap boosting amount.
boost_amount = clamp(boost_amount, 0, 120);
