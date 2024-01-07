/// player_handle_springs()
// Used to handle collision with various springs.

// Find nearest non-diagonal spring.
var spring;
spring = instance_nearest(x, y, par_spring);
if (spring != noone)
{
    switch (spring.spring_direction)
    {
        // Left:
        case "LEFT":
        {
            if (!player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, spring) && player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, spring))
            {
                // Animate spring:
                spring.image_speed = 0.5;

                // Reset angle:
                player_set_angle(global.gravity_angle);

                // Set input lock and speed.
                input_lock_timer    = 16;
                x_speed             = -spring.spring_strength;
                animation_direction = -1;

                // Revert to the default state:
                if (state == STATE_SPINDASH || state == STATE_GLIDE || state == STATE_GLIDE_DROP || state == STATE_SLIDE)
                {
                    state = STATE_DEFAULT;
                    if (!ground) animation_index = "RUN";
                }

                // Play spring sound:
                audio_play(SFX._general_spring, SFX.sfx_volume, 1, 0, 0);
            }
            break;
        }

        // Right:
        case "RIGHT":
        {
            if (!player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, spring) && player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, spring))
            {
                // Animate spring:
                spring.image_speed = 0.5;

                // Reset angle:
                player_set_angle(global.gravity_angle);

                // Set input lock and speed.
                input_lock_timer    = 16;
                x_speed             = spring.spring_strength;
                animation_direction = 1;

                // Revert to the default state:
                if (state == STATE_SPINDASH || state == STATE_GLIDE || state == STATE_GLIDE_DROP || state == STATE_SLIDE)
                {
                    state = STATE_DEFAULT;
                    if (!ground) animation_index = "RUN";
                }

                // Play spring sound:
                audio_play(SFX._general_spring, SFX.sfx_volume, 1, 0, 0);
            }
            break;
        }

        // Up:
        case "UP":
        {
            if (player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, spring) && y_speed >= 0)
            {
                // Stop homing.
                if (instance_exists(obj_homing_reticle))
                {
                    if (place_meeting(x, y, obj_homing_reticle) && state == STATE_HOMING)
                    {
                        with (obj_homing_reticle) instance_destroy();

                        if (homing_mode == 0)
                        {
                            x_speed = 0;
                        }
                        else
                        {
                            x_speed *= 0.5;
                        }
                    }
                }

                // Animate spring:
                spring.image_speed = 0.5;

                // Reset angle:
                player_set_angle(global.gravity_angle);

                // Disable certain flags and change state.
                ground            = false;
                amy_hammer_attack = 0;
                state             = STATE_SPRING;

                // Set speed.
                y_speed = -spring.spring_strength;

                // Play spring sound:
                audio_play(SFX._general_spring, SFX.sfx_volume, 1, 0, 0);
            }
            break;
        }

        // Down:
        case "DOWN":
        {
            if ((player_collision_check(COL_TOP_OBJECT,   MASK_BIG, x, y, angle, spring) && y_speed <= 0 && (angle_relative <  45 || angle_relative > 315))
            ||  (player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, spring) && x_speed >= 0 &&  angle_relative >= 45)
            ||  (player_collision_check(COL_LEFT_OBJECT,  MASK_BIG, x, y, angle, spring) && x_speed <= 0 &&  angle_relative <= 315))
            {
                // Animate spring:
                spring.image_speed = 0.5;

                // Reset angle:
                player_set_angle(global.gravity_angle);

                // Set speed.
                ground  = false;
                y_speed = spring.spring_strength;

                // Play spring sound:
                audio_play(SFX._general_spring, SFX.sfx_volume, 1, 0, 0);
            }
            break;
        }
    }
}

// Find nearest diagonal spring.
var spring_diagonal;
spring_diagonal = instance_nearest(x, y, par_spring_diagonal);
if (spring_diagonal != noone)
{
    switch (spring_diagonal.spring_direction)
    {
        // Diagonal Up Right:
        case "UP_RIGHT":
        {
            if ((player_collision_check(COL_BOTTOM_OBJECT, MASK_LARGE, x, y, angle, spring_diagonal) && y_speed >= 0) || (player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, spring_diagonal) && x_speed <= 0))
            {
                // Animate spring.
                spring_diagonal.image_speed = 0.5;

                // Reset angle and disable certain flags.
                player_set_angle(global.gravity_angle);
                ground            = false;
                amy_hammer_attack = 0;

                // Set speed and state.
                x_speed             =  spring_diagonal.spring_strength;
                y_speed             = -spring_diagonal.spring_strength;
                animation_direction =  1;
                state               =  STATE_SPRING;
                animation_index     =  "CORKSCREW";

                // Play spring sound:
                audio_play(SFX._general_spring, SFX.sfx_volume, 1, 0, 0);
            }
            break;
        }

        // Diagonal Up left:
        case "UP_LEFT":
        {
            if ((player_collision_check(COL_BOTTOM_OBJECT, MASK_LARGE, x, y, angle, spring_diagonal) && y_speed >= 0) || (player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, spring_diagonal) && x_speed <= 0))
            {
                // Animate spring.
                spring_diagonal.image_speed = 0.5;

                // Reset angle and disable certain flags.
                player_set_angle(global.gravity_angle);
                ground            = false;
                amy_hammer_attack = 0;

                // Set speed and state.
                x_speed             = -spring_diagonal.spring_strength;
                y_speed             = -spring_diagonal.spring_strength;
                animation_direction = -1;
                state               =  STATE_SPRING;
                animation_index     =  "CORKSCREW";

                // Play spring sound:
                audio_play(SFX._general_spring, SFX.sfx_volume, 1, 0, 0);
            }
            break;
        }

        // Diagonal Down Right:
        case "DOWN_RIGHT":
        {
            if ((player_collision_check(COL_TOP_OBJECT, MASK_LARGE, x, y, angle, spring_diagonal) && y_speed >= 0) || (player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, spring_diagonal) && x_speed <= 0))
            {
                // Animate spring.
                spring_diagonal.image_speed = 0.5;

                // Reset angle and disable certain flags.
                player_set_angle(global.gravity_angle);
                ground            = false;
                amy_hammer_attack = 0;

                // Set speed and state.
                x_speed             = spring_diagonal.spring_strength;
                y_speed             = spring_diagonal.spring_strength;
                animation_direction = 1;
                state               = STATE_SPRING;

                // Play spring sound:
                audio_play(SFX._general_spring, SFX.sfx_volume, 1, 0, 0);
            }
            break;
        }

        // Diagonal Down left:
        case "DOWN_LEFT":
        {
            if ((player_collision_check(COL_TOP_OBJECT, MASK_LARGE, x, y, angle, spring_diagonal) && y_speed >= 0) || (player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, spring_diagonal) && x_speed <= 0))
            {
                // Animate spring.
                spring_diagonal.image_speed = 0.5;

                // Reset angle and disable certain flags.
                player_set_angle(global.gravity_angle);
                ground            = false;
                amy_hammer_attack = 0;

                // Set speed and state.
                x_speed             = -spring_diagonal.spring_strength;
                y_speed             =  spring_diagonal.spring_strength;
                animation_direction = -1;
                state               =  STATE_SPRING;

                // Play spring sound:
                audio_play(SFX._general_spring, SFX.sfx_volume, 1, 0, 0);
            }
            break;
        }
    }
}
