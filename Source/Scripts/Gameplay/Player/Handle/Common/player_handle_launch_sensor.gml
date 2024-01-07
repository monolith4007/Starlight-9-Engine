/// player_handle_launch_sensor()
// Handles collision with the launch sensor, which is used in case the normal launching method fails (credit to SoniKast).
// To use the launch sensor, place it in the desired room and add the variables "launch_direction" and "launch_angle" to its creation code.
// "launch_direction" indicates the direction the player should be launched at.
// "launch_angle" indicates the angle the player should be launched at.
var launch_sensor;
launch_sensor = player_collision_check(COL_BOTTOM_OBJECT, MASK_LARGE, x, y, angle, obj_launch_sensor);
if (launch_sensor != noone)
{
    if (ground && angle != 0)
    {
        if (state == STATE_DEFAULT || state == STATE_ROLL)
        {
            if (abs(x_speed) >= 1 && sign(x_speed) == launch_sensor.launch_direction)
            {
                // Disable stopping at walls to properly launch:
                disable_wallstop = true;
                if (alarm[0] == -1)
                {
                    alarm[0] = 15;
                }

                // Set new angles:
                player_set_angle(sign(x_speed) * launch_sensor.launch_angle);

                // Set speeds:
                y_speed = -dsin(angle_relative) * x_speed;
                x_speed =  dcos(angle_relative) * x_speed;
                ground  =  false;
            }
        }
    }
}
