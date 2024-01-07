/// player_handle_falling_tiles()
// Handles collision with falling terrain.

// Handle collision with collapsible platforms:
var collapse_id;
collapse_id = player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, par_collapsing_platform);
if (collapse_id != noone && ground)
{
    if (collapse_id.alarm[0] == -1)
    {
        collapse_id.alarm[0] = 30;
    }
}

// Handle collision with falling tiles:
if (player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, par_collapsing_tile))
{
    with (par_collapsing_tile)
    {
        if (y_spd == 0) other.y_speed = 0;
    }
}
