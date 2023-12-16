/// player_state_homing()
// Modern Sonic's homing attack ability.
if (jump_action && state == STATE_JUMP && !boosting)
{
    // Find nearest NPC that we can target.
    var homing_target_id, i;
    if (animation_direction == 1)
    {
        homing_target_id[0] = instance_nearest_dir_x(x, y, par_badnik,    ">=", homing_distance);
        homing_target_id[1] = instance_nearest_dir_x(x, y, par_monitor,   ">=", homing_distance);
        homing_target_id[2] = instance_nearest_dir_x(x, y, obj_spring_up, ">=", homing_distance);
    }
    else
    {
        homing_target_id[0] = instance_nearest_dir_x(x, y, par_badnik,    "<=", homing_distance);
        homing_target_id[1] = instance_nearest_dir_x(x, y, par_monitor,   "<=", homing_distance);
        homing_target_id[2] = instance_nearest_dir_x(x, y, obj_spring_up, "<=", homing_distance);
    }

    // Spawn the homing reticle. If you want to add more targets, replace the '2' in the looping condition with your desired maximum number.
    for (i = 0; i <= 2; i += 1)
    {
        if (homing_target_id[i] != noone)
        {
            // Check if we're close to the target, facing them and above them.
            if (distance_to_object(homing_target_id[i]) <= homing_distance && sign(homing_target_id[i].x - x) == animation_direction && y < homing_target_id[i].bbox_bottom)
            {
                if (!instance_exists(obj_homing_reticle))
                {
                    var reticle;
                    reticle        = instance_create(homing_target_id[i].x, homing_target_id[i].y, obj_homing_reticle);
                    reticle.target = homing_target_id[i];
                }
            }
        }
    }

    // Destroy the reticle if it no longer meets its initial spawning conditions:
    if (instance_exists(obj_homing_reticle))
    {
        if (distance_to_object(obj_homing_reticle) > homing_distance || sign(obj_homing_reticle.x - x) != animation_direction || y >= obj_homing_reticle.bbox_bottom)
        {
            with (obj_homing_reticle) instance_destroy();
        }
    }

    // Perform a homing attack/dash.
    if (input_action_pressed)
    {
        if (instance_exists(obj_homing_reticle))
        {
            if (obj_homing_reticle.visible)
            {
                state = STATE_HOMING;
            }
            else
            {
                if (homing_mode == 1)
                {
                    x_speed = clamp(animation_direction * (abs(x_speed) + 4), -12, 12);
                }
                else
                {
                    x_speed = animation_direction * 8;
                }
                y_speed = 0;
            }
        }
        else
        {
            if (homing_mode == 1)
            {
                x_speed = clamp(animation_direction * (abs(x_speed) + 4), -12, 12);
            }
            else
            {
                x_speed = animation_direction * 8;
            }
            y_speed = 0;
        }

        // Disable the jump lock & action flags, and play the homing sound.
        jump_lock     = false;
        jump_action   = false;
        audio_play(SFX._player_spindash_release, SFX.sfx_volume, 1, 0, 0);
    }
}
else if (state != STATE_HOMING)
{
    if (instance_exists(obj_homing_reticle))
    {
        with (obj_homing_reticle) instance_destroy();
    }
}
else
{
    if (instance_exists(obj_homing_reticle)
    && !player_collision_check(COL_RIGHT,  MASK_BIG, x, y, angle) && !player_collision_check(COL_LEFT, MASK_BIG, x, y, angle)
    && !player_collision_check(COL_BOTTOM, MASK_BIG, x, y, angle) && !player_collision_check(COL_TOP,  MASK_BIG, x, y, angle))
    {
        // Move towards the target.
        var _dir;
        _dir    = point_direction(x, y, obj_homing_reticle.x, obj_homing_reticle.y);
        x_speed = lengthdir_x(homing_speed, _dir);
        y_speed = lengthdir_y(homing_speed, _dir);
    }
    else
    {
        state = STATE_JUMP;
    }
}
