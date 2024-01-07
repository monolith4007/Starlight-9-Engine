/// player_handle_platforms()
// Handles collision & movement with moving & swinging platforms.
if (ground)
{
    var platform_id, swing_id;
    platform_id = player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, par_moving_platform);
    swing_id    = player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, par_swinging_platform);

    // Moving platforms:
    if (platform_id != noone)
    {
        x += platform_id.x - platform_id.xprevious;
        y += platform_id.y - platform_id.yprevious;
    }

    // Swinging platforms:
    if (swing_id != noone)
    {
        x += swing_id.x - swing_id.xprevious;
        y += swing_id.y - swing_id.yprevious;
    }
}
