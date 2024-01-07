/// player_state_glide()
// Knuckles' gliding ability.

// Stop gliding.
if (!input_action && state == STATE_GLIDE)
{
    // Multiply horizontal speed by 0.25.
    x_speed *= 0.25;

    // Switch the state.
    state = STATE_GLIDE_DROP;

    // Reset glide turning variables.
    glide_turn_angle = 0;
    glide_turn_speed = 0;
}

// Finish a drop.
if (state == STATE_GLIDE_DROP && ground)
{
    // Check if the angle is not within the "slipping" range in order to land properly:
    if (angle_relative < 45 || angle_relative > 315)
    {
        // Set the horizontal speed to 0.
        x_speed = 0;

        // Switch the animation to the crouching one.
        if (animation_index != "CROUCH")
        {
            audio_play(SFX._player_land, SFX.sfx_volume, 1, 0, 1);
        }
        animation_index = "CROUCH";

        // Decrease the glide crouch timer.
        if (glide_crouch_timer > 0)
        {
            glide_crouch_timer -= 1;
        }
        else
        {
            state              = STATE_DEFAULT;
            glide_crouch_timer = 15;
        }
    }
    else // Otherwise, begin running and temporarily lock input.
    {
        state              = STATE_DEFAULT;
        input_lock_timer   = 30;
        glide_crouch_timer = 15;
    }
}

// Reset the glide crouch timer.
if (state != STATE_GLIDE_DROP && glide_crouch_timer != 15)
{
    glide_crouch_timer = 15;
}

// Trigger glide and set initial speeds.
if (state == STATE_JUMP && input_action_pressed && jump_action)
{
    state   = STATE_GLIDE;
    x_speed = animation_direction * 4;
    if (y_speed < 0) y_speed = 0;
}

// While gliding...
if (state == STATE_GLIDE)
{
    if (!ground)
    {
        // Apply gravity:
        if (y_speed < 0.5)
        {
            y_speed += glide_gravity;
        }
        if (y_speed > 0.5)
        {
            y_speed -= glide_gravity;
        }
        
        // Accelerate:
        if (glide_turn_speed <= 0 && abs(x_speed) < glide_top_speed)
        {
            x_speed += glide_acceleration * animation_direction;
            if (abs(x_speed) > glide_top_speed)
            {
                x_speed = glide_top_speed * animation_direction;
            }
        }
        
        // Glide turning, big chunk of code (credit to Tpot).
        if (animation_direction == 1 && input_left && glide_turn_speed == 0)
        {
            glide_turn_speed = abs(x_speed);
            glide_turn_angle = 0;
        }
        else if (input_right && glide_turn_speed != 0 && glide_turn_angle < 180)
        {
            glide_turn_angle = 360 - glide_turn_angle;
        }
        else if (animation_direction == -1 && input_right && glide_turn_speed == 0)
        {
            glide_turn_speed = abs(x_speed);
            glide_turn_angle = 180;
        }
        else if (input_left && glide_turn_speed != 0 && glide_turn_angle > 180)
        {
            glide_turn_angle = 360 - glide_turn_angle;
        }
    
        if (glide_turn_speed != 0)
        {
            glide_turn_angle = floor(wrap_angle(glide_turn_angle + 3.8125));
            x_speed          = glide_turn_speed * dcos(glide_turn_angle);
    
            // Set animation frame.
            if (abs(dcos(glide_turn_angle)) >= 1)
            {
                animation_frame = 0;
            }
            else if (abs(dcos(glide_turn_angle)) >= 0.6 && abs(dcos(glide_turn_angle)) < 1)
            {
                animation_frame = 1;
            }
            else if (abs(dcos(glide_turn_angle)) >= 0 && abs(dcos(glide_turn_angle)) < 0.6)
            {
                animation_frame = 2;
            }
    
            // Change facing direction.
            if (glide_turn_angle == 90 || glide_turn_angle == 270)
            {
                animation_direction *= -1;
            }
    
            if (glide_turn_angle == 0 || glide_turn_angle == 180)
            {
                glide_turn_speed = 0;
                animation_frame  = 0;
            }
        }
        
        // Grab onto a wall.
        var grav_angle;
        grav_angle = global.gravity_angle;
        if ((animation_direction ==  1 && player_collision_check(COL_RIGHT, MASK_BIG, x, y, grav_angle) && player_collision_check(COL_RIGHT, spr_mask_ledge_climb, x, y, grav_angle) && !player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, grav_angle, par_obstacle))
        ||  (animation_direction == -1 && player_collision_check(COL_LEFT,  MASK_BIG, x, y, grav_angle) && player_collision_check(COL_LEFT,  spr_mask_ledge_climb, x, y, grav_angle) && !player_collision_check(COL_LEFT_OBJECT,  MASK_BIG, x, y, grav_angle, par_obstacle)))
        {
            if (!player_collision_check(COL_TOP, MASK_MAIN, x, y, grav_angle))
            {
                if (player_get_angle(x, y, angle) == grav_angle && !player_collision_check(COL_BOTTOM, MASK_MAIN, x, y, grav_angle) && !player_collision_check(COL_LEFT_EDGE, x, y, angle) && !player_collision_check(COL_RIGHT_EDGE, x, y, angle))
                {
                    // Change state.
                    state = STATE_CLIMB;
    
                    // Reset action keys.
                    input_action         = false;
                    input_action_pressed = false;
    
                    // Reset movement values.
                    x_speed = 0;
                    y_speed = 0;
    
                    // Play wall grab sound.
                    audio_play(SFX._player_grab, SFX.sfx_volume, 1, 0, 1);
                }
                else
                {
                    state = STATE_GLIDE_DROP;
                }
    
                // Reset turn values.
                glide_turn_speed = 0;
                glide_turn_angle = 0;
            }
        }
    }
    else // Slide.
    {
        if (angle_relative < 45 || angle_relative > 315)
        {
            state = STATE_SLIDE;
        }
        else
        {
            state = STATE_DEFAULT;
            if (animation_index == "GLIDE")
            {
                animation_index  = "WALK";
            }
            input_lock_timer = 30;
        }
    }
}

// Reset glide turn values.
if (state != STATE_GLIDE && glide_turn_speed != 0)
{
    glide_turn_speed = 0;
    glide_turn_angle = 0;
}
