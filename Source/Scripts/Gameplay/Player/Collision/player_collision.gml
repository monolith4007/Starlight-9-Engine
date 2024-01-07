/// player_collision(x, y, layer)
// Checks if we collide with a piece of terrain.

// Solids:
var _solid;
_solid = instance_place(argument0, argument1, par_solid);
if (_solid != noone)
{
    // Set collision flags if we can collide with the solid.
    if (_solid.tile_collision_flag)
    {
        if (collision_point(x, argument1, _solid, true, false))
        {
            col_launch_angle     = _solid.tile_launch_angle;
            col_launch_flag      = _solid.tile_launch_flag;
            col_launch_direction = _solid.tile_launch_direction;
            col_edge_exception   = _solid.tile_edge_exception;
        }
        col_rotate_flag          = _solid.tile_rotate_flag;
        col_edge_skip            = _solid.tile_edge_skip;
        col_ceiling_movement     = _solid.tile_ceiling_movement;
        return true;
    }
}

// Platforms:
if (ground)
{
    var _platform;
    _platform = instance_place(argument0, argument1, par_platform);
    if (_platform != noone)
    {
        // Set collision flags if we can collide with the platform.
        if (_platform.tile_collision_flag)
        {
            if (angle == global.gravity_angle || platform_check)
            {
                if (collision_point(x, argument1, _platform, true, false))
                {
                    col_launch_angle     = _platform.tile_launch_angle;
                    col_launch_flag      = _platform.tile_launch_flag;
                    col_launch_direction = _platform.tile_launch_direction;
                    col_edge_exception   = _platform.tile_edge_exception;
                }
                col_rotate_flag          = _platform.tile_rotate_flag;
                col_edge_skip            = _platform.tile_edge_skip;
                col_ceiling_movement     = _platform.tile_ceiling_movement;
                platform_check           = true;
                return true;
            }
        }
    }
}

// Layers:
if (argument2 == 0)
{
    return place_meeting(argument0, argument1, par_layer_low);
}
if (argument2 == 1)
{
    return place_meeting(argument0, argument1, par_layer_high);
}
