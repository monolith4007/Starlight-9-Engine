/// player_state_hammer()
// Amy's hammer abilities.
// Credit to SoniKast & the Flicky Engine developers.
switch (amy_hammer_attack)
{
    // Trigger one of four attacks:
    case 0:
    {
        // Hammer punch:
        if (((state == STATE_DEFAULT && ground) || state == STATE_LOOKUP) && input_special_pressed)
        {
            if (angle_relative < 45 || angle_relative > 315)
            {
                amy_hammer_attack = 1;
                if (state != STATE_DEFAULT)
                {
                    state  = STATE_DEFAULT;
                }
            }
        }
        
        if (state == STATE_JUMP && input_special_pressed)
        {
            // Hammer spin:
            if (input_down)
            {
                amy_hammer_attack = 2;
                x_speed           = 0;
                
                // Dive down:
                y_speed = 8;
                if (underwater) y_speed *= 0.5;
            }
            else // Hammer air dash.
            {
                amy_hammer_attack = 3;
                audio_play(SFX._shield_use_insta, SFX.sfx_volume, 1, 0, 0);
                
                // Dash forwards.
                if (abs(x_speed) < x_speed_top || sign(x_speed) != animation_direction)
                {
                    x_speed = animation_direction * x_speed_top;
                }
            }
        }
        
        // Hammer flip:
        if (state == STATE_CROUCH && input_special_pressed)
        {
            state   = STATE_DEFAULT;
            y_speed = -8;
            if (underwater) y_speed *= 0.5;
            
            ground            = false;
            amy_hammer_attack = 4;
        }
        break;
    }
    
    // Return to normal after performing hammer attacks.
    
    // Hammer punch:
    case 1:
    {
        // Stop horizontal speed.
        x_speed = 0;
        
        // Finish.
        if (animation_finished || (angle_relative >= 45 && angle_relative <= 315))
        {
            amy_hammer_attack = 0;
            audio_play(SFX._general_bump, SFX.sfx_volume, 1, 0, 0);
            
            // Create hearts.
            var _heart, i;
            for (i = 0; i < 4; i += 1)
            {
                _heart            = instance_create(floor(x + animation_direction * 18), floor(y), obj_amy_heart);
                _heart._direction = i * 90 + 45;
            }
        }
        break;
    }
    
    // Hammer spin:
    case 2:
    {
        if (ground)
        {
            state             = STATE_DEFAULT;
            amy_hammer_attack = 0;
        }
        break;
    }
    
    // Hammer air punch & flip:
    case 3:
    case 4:
    {
        if ((!ground && animation_finished) || ground)
        {
            amy_hammer_attack = 0;
            if (state != STATE_DEFAULT)
            {
                state  = STATE_DEFAULT;
            }
        }
    }
}
