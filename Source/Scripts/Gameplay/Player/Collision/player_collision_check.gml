/// player_collision_check(sensor, [mask], [x], [y], [angle], [object])
// Checks various sensors for collision detecting.
var maskTemp, colTest;
switch (argument[0])
{
    // Main sensor.
    // Usage: player_collision_check(COL_MAIN, x, y);
    case COL_MAIN:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = MASK_MAIN;

        // Test collision:
        colTest = player_collision(floor(argument[1]), floor(argument[2]), collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Slope sensor.
    // Usage: player_collision_check(COL_SLOPE, mask, x, y, angle);
    case COL_SLOPE:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = player_collision(floor(argument[2] + dsin(argument[4]) * 23),
                                   floor(argument[3] + dcos(argument[4]) * 23),
                                   collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Main sensor (object).
    // Usage: player_collision_check(COL_MAIN_OBJECT, x, y, object);
    case COL_MAIN_OBJECT:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = MASK_MAIN;

        // Test collision:
        colTest = instance_place(floor(argument[1]), floor(argument[2]), argument[3]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Top sensor.
    // Usage: player_collision_check(COL_TOP, mask, x, y, angle);
    case COL_TOP:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = player_collision(floor(argument[2] - dsin(argument[4]) * 11),
                                   floor(argument[3] - dcos(argument[4]) * 11),
                                   collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Top sensor (object).
    // Usage: player_collision_check(COL_TOP_OBJECT, mask, x, y, angle, object);
    case COL_TOP_OBJECT:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = instance_place(floor(argument[2] - dsin(argument[4]) * 11),
                                 floor(argument[3] - dcos(argument[4]) * 11),
                                 argument[5]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Bottom sensor.
    // Usage - player_collision_check(COL_BOTTOM, mask, x, y, angle);
    case COL_BOTTOM:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = player_collision(floor(argument[2] + dsin(argument[4]) * 11),
                                   floor(argument[3] + dcos(argument[4]) * 11),
                                   collision_layer);

        // Special case: if there is no collision, check for a collision within platforms.
        if (!colTest && !ground && y_speed >= 0)
        {
            colTest = place_meeting(floor(argument[2] + dsin(argument[4]) * 11),
                                    floor(argument[3] + dcos(argument[4]) * 11),
                                    par_platform)
                  && !place_meeting(floor(argument[2]), floor(argument[3]),
                                    par_platform);
        }

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Bottom sensor (object).
    // Usage: player_collision_check(COL_BOTTOM_OBJECT, mask, x, y, angle, object);
    case COL_BOTTOM_OBJECT:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = instance_place(floor(argument[2] + dsin(argument[4]) * 11),
                                 floor(argument[3] + dcos(argument[4]) * 11),
                                 argument[5]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Left sensor.
    // Usage: player_collision_check(COL_LEFT, mask, x, y, angle);
    case COL_LEFT:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = player_collision(floor(argument[2] - dcos(argument[4]) * 11),
                                   floor(argument[3] + dsin(argument[4]) * 11),
                                   collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Left sensor (object).
    // Usage: player_collision_check(COL_LEFT_OBJECT, mask, x, y, angle, object);
    case COL_LEFT_OBJECT:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = instance_place(floor(argument[2] - dcos(argument[4]) * 11),
                                 floor(argument[3] + dsin(argument[4]) * 11),
                                 argument[5]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Left sensor (edge).
    // Usage: player_collision_check(COL_LEFT_EDGE, x, y, angle);
    case COL_LEFT_EDGE:
    {
        // Store current mask and sprite.
        var spriteTemp;
        maskTemp      = mask_index;
        spriteTemp[0] = sprite_index;
        spriteTemp[1] = image_index;

        // Switch mask and sprite.
        mask_index   = MASK_LINES;
        sprite_index = MASK_LINES;
        image_index  = floor(argument[3]);

        // Test collision:
        colTest = player_collision(floor(argument[1] - dcos(argument[3]) * 8  + dsin(argument[3]) * 11),
                                   floor(argument[2] + dsin(argument[3]) * 11 + dcos(argument[3]) * 11),
                                   collision_layer);

        // Restore previous mask and sprite.
        mask_index   = maskTemp;
        sprite_index = spriteTemp[0];
        image_index  = spriteTemp[1];

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Left sensor (limiter).
    // Usage: player_collision_check(COL_LEFT_LIMITER, angle);
    case COL_LEFT_LIMITER:
    {
        var spriteTemp, tempOffsetX, tempOffsetY;

        // Store current mask and sprite.
        maskTemp      = mask_index;
        spriteTemp[0] = sprite_index;
        spriteTemp[1] = image_index;

        // Wrap the given angle.
        wrap_angle(argument[1]);

        // Switch mask and sprite.
        mask_index   = MASK_LINES;
        sprite_index = MASK_LINES;
        image_index  = floor(argument[1] / 10);

        // Calculate positions:
        tempOffsetX = x - cos(floor(argument[1])) * 8 + sin(floor(argument[1])) * 10;
        tempOffsetY = y + sin(floor(argument[1])) * 8 + cos(floor(argument[1])) * 10;

        // Test collision:
        colTest = player_collision(tempOffsetX, tempOffsetY, par_solid) && !place_meeting(tempOffsetX, tempOffsetY, par_obstacle);

        // Restore previous mask and sprite.
        mask_index   = maskTemp;
        sprite_index = spriteTemp[0];
        image_index  = spriteTemp[1];

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Right sensor.
    // Usage: player_collision_check(COL_RIGHT, mask, x, y, angle);
    case COL_RIGHT:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = player_collision(floor(argument[2] + dcos(argument[4]) * 11),
                                   floor(argument[3] - dsin(argument[4]) * 11),
                                   collision_layer);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Right sensor (object).
    // Usage: player_collision_check(COL_RIGHT_OBJECT, mask, x, y, angle, object);
    case COL_RIGHT_OBJECT:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = argument[1];

        // Test collision:
        colTest = instance_place(floor(argument[2] + dcos(argument[4]) * 11),
                                 floor(argument[3] - dsin(argument[4]) * 11),
                                 argument[5]);

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Right sensor (edge).
    // Usage: player_collision_check(COL_RIGHT_EDGE, x, y, angle);
    case COL_RIGHT_EDGE:
    {
        // Store current mask and sprite.
        var spriteTemp;
        maskTemp      = mask_index;
        spriteTemp[0] = sprite_index;
        spriteTemp[1] = image_index;

        // Switch mask and sprite.
        mask_index   = MASK_LINES;
        sprite_index = MASK_LINES;
        image_index  = floor(argument[3]);

        // Test collision:
        colTest = player_collision(floor(argument[1] + dcos(argument[3]) * 8  + dsin(argument[3]) * 11),
                                   floor(argument[2] - dsin(argument[3]) * 11 + dcos(argument[3]) * 11),
                                   collision_layer);

        // Restore previous mask and sprite.
        mask_index   = maskTemp;
        sprite_index = spriteTemp[0];
        image_index  = spriteTemp[1];

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Right sensor (limiter).
    // Usage: player_collision_check(COL_RIGHT_LIMITER, angle);
    case COL_RIGHT_LIMITER:
    {
        var spriteTemp, tempOffsetX, tempOffsetY;

        // Store current mask and sprite.
        maskTemp      = mask_index;
        spriteTemp[0] = sprite_index;
        spriteTemp[1] = image_index;

        // Limit the given angle.
        wrap_angle(argument[1]);

        // Switch mask and sprite.
        mask_index   = MASK_LINES;
        sprite_index = MASK_LINES;
        image_index  = floor(argument[1] / 10);

        // Calculate positions:
        tempOffsetX = x + cos(floor(argument[1])) * 8 + sin(floor(argument[1])) * 10;
        tempOffsetY = y - sin(floor(argument[1])) * 8 + cos(floor(argument[1])) * 10;

        // Test collision:
        colTest = player_collision(tempOffsetX, tempOffsetY, par_solid) && !place_meeting(tempOffsetX, tempOffsetY, par_obstacle);

        // Restore previous mask and sprite.
        mask_index   = maskTemp;
        sprite_index = spriteTemp[0];
        image_index  = spriteTemp[1];

        // Return collision:
        return colTest;
        break;
    }

    // ########################################################################################################################## //

    // Edge line (exception) sensor.
    // Usage: player_collision_check(COL_EDGE_LINE);
    case COL_EDGE_LINE:
    {
        // Store current mask and switch it.
        maskTemp   = mask_index;
        mask_index = MASK_EDGE_LINE;

        // Test collision:
        if (x_speed != 0)
        {
            colTest  = place_meeting(x + sign(x_speed) * 6, y, par_terrain);
        }
        else colTest = false;

        // Restore previous mask.
        mask_index = maskTemp;

        // Return collision:
        return colTest;
        break;
    }
}
