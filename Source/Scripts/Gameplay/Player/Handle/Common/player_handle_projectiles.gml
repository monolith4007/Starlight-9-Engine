/// player_handle_projectiles()
// Handles collision with harmful projectiles such as those from the Crabmeat.
// Credit to the Flicky Engine developers.
var projectile;
projectile = instance_nearest(x, y, par_projectile);
if (projectile != noone)
{
    if (state != STATE_FLY && state != STATE_GLIDE)
    {
        // Get the active barrier:
        var barrier;
        if (shield_index != 0)
        {
            barrier = shield_object;
        }
        else if (instance_exists(obj_shield_insta))
        {
            barrier = instance_place(x, y, obj_shield_insta);
        }
        else if (instance_exists(obj_boost))
        {
            barrier = instance_place(x, y, obj_boost);
        }
        else barrier = noone;

        // Deflect projectiles off an existing barrier.
        if (barrier != noone)
        {
            with (barrier)
            {
                if (place_meeting(x, y, projectile))
                {
                    var _speed, _angle;
                    _speed = sqrt(sqr(projectile.hspeed) + sqr(projectile.vspeed));
                    _angle = point_direction(x, y, projectile.x, projectile.y);
                    projectile.hspeed =  dcos(_angle) * _speed;
                    projectile.vspeed = -dsin(_angle) * _speed;
                }
            }
        }
        else // Otherwise, get hit.
        {
            if (player_collision_check(COL_MAIN_OBJECT, MASK_MAIN, x, y, projectile))
            {
                player_state_hurt(projectile);
            }
        }
    }
    else // Deflect projectiles while flying/gliding.
    {
        // Check if we're colliding with the projectile above us to deflect it:
        if (player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, angle, projectile))
        {
            var _speed, _angle;
            _speed = sqrt(sqr(projectile.hspeed) + sqr(projectile.vspeed));
            _angle = point_direction(x, y, projectile.x, projectile.y);
            projectile.hspeed =  dcos(_angle) * _speed;
            projectile.vspeed = -dsin(_angle) * _speed;
        }
        else if (player_collision_check(COL_MAIN_OBJECT, MASK_MAIN, x, y, projectile)) // Otherwise, get hit.
        {
            player_state_hurt(projectile);
        }
    }
}
