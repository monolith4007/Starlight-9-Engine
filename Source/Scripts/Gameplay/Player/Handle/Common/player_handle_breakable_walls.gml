/// player_handle_breakable_walls()
// Handles collision with breakable walls.
var breakable_wall, breakable_wall_knux;

// All characters.
breakable_wall = instance_nearest(x, y, par_breakable_wall);
if (breakable_wall != noone && (character_id == CHAR_KNUCKLES || state == STATE_ROLL || shield_action == 1 || state == STATE_GLIDE || state == STATE_SLIDE || (amy_hammer_attack == 1 && animation_frame > 5) || (amy_hammer_attack == 3 && animation_frame < 5) || boosting))
{
    if (player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, breakable_wall))
    {
        with (breakable_wall)
        {
            broken     = true;
            pieces_dir = -1;
            instance_destroy();
        }
    }
    if (player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, breakable_wall))
    {
        with (breakable_wall)
        {
            broken     = true;
            pieces_dir = 1;
            instance_destroy();
        }
    }
}

// Knuckles only.
breakable_wall_knux = instance_nearest(x, y, par_breakable_wall_knuckles);
if (breakable_wall_knux != noone && character_id == CHAR_KNUCKLES)
{
    if (player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, angle, breakable_wall_knux))
    {
        with (breakable_wall_knux)
        {
            broken     = true;
            pieces_dir = -1;
            instance_destroy();
        }
    }
    if (player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, angle, breakable_wall_knux))
    {
        with (breakable_wall_knux)
        {
            broken     = true;
            pieces_dir = 1;
            instance_destroy();
        }
    }
}
