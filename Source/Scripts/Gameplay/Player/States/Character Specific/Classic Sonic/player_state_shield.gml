/// player_state_shield()
// Classic Sonic's shield abilities.

// Insta-shield:
if (!cpu_flag && shield_index == 0 && invincibility_type < 2 && dropdash_state < 2)
{
    if (state == STATE_JUMP && jump_action && input_action_pressed)
    {
        jump_action = false;
        instance_create(x, y, obj_shield_insta);
    }
}

// Elemental shields:
if (shield_index != 0 && invincibility_type < 2)
{
    switch (shield_index)
    {
        // Fire Dash.
        case SHIELD_FIRE:
        {
            if (state == STATE_JUMP && jump_action && input_action_pressed)
            {
                x_speed                    = animation_direction * 8;
                y_speed                    = 0;
                shield_object.sprite_index = spr_shield_fire_dash;
                shield_action              = 1;
                jump_action                = false;
                obj_camera.alarm[0]        = 16;
                audio_play(SFX._shield_use_flame, SFX.sfx_volume, 1, 0, 0);
            }
            if (shield_action == 1)
            {
                if (state != STATE_JUMP || obj_camera.alarm[0] == -1 || x_speed == 0)
                {
                    shield_object.sprite_index = spr_shield_fire;
                    shield_action              = 0;
                }
            }
            break;
        }

        // Bubble Bounce.
        case SHIELD_BUBBLE:
        {
            if (state == STATE_JUMP && jump_action && input_action_pressed)
            {
                x_speed                    = 0;
                y_speed                    = 8;
                shield_action              = 1;
                jump_action                = false;
                shield_object.sprite_index = spr_shield_bubble_bounce;
                jump_lock                  = false;
            }
            if (shield_action == 1 && ground)
            {
                // Set speeds:
                y_speed = -(dsin(angle_relative) * x_speed) - (dcos(angle_relative) * 7.5);
                x_speed =  (dcos(angle_relative) * x_speed) - (dsin(angle_relative) * 7.5);
                if (underwater)
                {
                    y_speed *= 0.5;
                    x_speed *= 0.5;
                }
                
                // Change flags:
                ground                    = false;
                state                     = STATE_JUMP;
                jump_completed            = false;
                shield_action             = 2;
                jump_action               = true;
                shield_object.image_index = 0;
                audio_play(SFX._shield_use_bubble, SFX.sfx_volume, 1, 0, 0);
            }
            if (shield_action > 0 && state != STATE_JUMP)
            {
                shield_action              = 0;
                jump_action                = false;
                shield_object.sprite_index = spr_shield_bubble;
            }
            break;
        }

        // Electric Double Jump.
        case SHIELD_ELECTRIC:
        {
            if (state == STATE_JUMP && jump_action && input_action_pressed)
            {
                y_speed        = -5.5;
                jump_completed = true;
                jump_action    = false;
                jump_lock      = false;
                audio_play(SFX._shield_use_electric, SFX.sfx_volume, 1, 0, 0);

                // Create sparks.
                var _spark, i;
                for (i = 0; i < 4; i += 1)
                {
                    _spark            = instance_create(floor(x), floor(y), obj_electric_spark);
                    _spark._direction = i * 90 + 45;
                }
            }
            break;
        }
    }

    // Destroy the fire/electric shields underwater.
    if ((shield_index == SHIELD_FIRE || shield_index == SHIELD_ELECTRIC) && underwater)
    {
        with (shield_object) instance_destroy();
    }
}
