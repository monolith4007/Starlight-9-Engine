/// player_get_angle(x, y, angle)
// Calculates and returns the angle of the colliding surface, at the given position & angle.
var maskTemp, angleInit, xPoint, yPoint, i;

// Store current mask and switch it.
maskTemp   = mask_index;
mask_index = MASK_DOT;

// Limit the given angle to 36 directions:
angleInit = floor(argument2 / 10 + 0.5) * 10; // Manually round instead of using banker's rounding (this fixes the failed ramp launch bug).

// Set the starting position of each sensor:
xPoint[0] = argument0 - dcos(angleInit) * 4;
xPoint[1] = argument0 + dcos(angleInit) * 4;
yPoint[0] = argument1 + dsin(angleInit) * 4;
yPoint[1] = argument1 - dsin(angleInit) * 4;

// Repeatedly push down the sensors in order to calculate the angle:
repeat (25)
{
    for (i = 0; i <= 1; i += 1)
    {
        if (!player_collision(floor(xPoint[i]), floor(yPoint[i]), collision_layer))
        {
            xPoint[i] += dsin(angleInit);
            yPoint[i] += dcos(angleInit);
        }
    }
}

// Restore old mask:
mask_index = maskTemp;

// Return calculation:
return floor(point_direction(xPoint[0], yPoint[0], xPoint[1], yPoint[1]));
