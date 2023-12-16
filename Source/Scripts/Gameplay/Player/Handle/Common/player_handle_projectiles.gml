/// player_handle_projectiles()
// Handles collision with harmful projectiles such as those from the Crabmeat.
var projectile;
projectile = player_collision_check(COL_MAIN_OBJECT, x, y, par_projectile);
if (projectile != noone)
{
    if (state != STATE_FLY && state != STATE_GLIDE)
    {
        if (invincibility_type == 0)
        {
            // Deflect the projectile if possible:
            if (shield_index != 0 || instance_exists(obj_shield_insta))
            {
                var _speed, _angle;
                _speed = sqrt(sqr(projectile.hspeed) + sqr(projectile.vspeed));
                _angle = point_direction(x, y, projectile.x, projectile.y);
                projectile.hspeed  =  dcos(_angle) * _speed;
                projectile.vspeed  = -dsin(_angle) * _speed;
                projectile.gravity =  0;
            }
            else // Otherwise, get hit.
            {
                player_state_hurt(projectile);
            }
        }
    }
    else // Deflect projectiles while flying/gliding.
    {
        var _angle;
        _angle = degtorad(round(wrap_angle(point_direction(x, y, projectile.x, projectile.y) - 90) / 22.5) * 24);
        projectile.hspeed = sin(wrap_angle(_angle)) * 4;
        projectile.vspeed = cos(wrap_angle(_angle)) * 4;
    }
}
