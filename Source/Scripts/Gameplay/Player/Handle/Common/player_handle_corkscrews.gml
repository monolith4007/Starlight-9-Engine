/// player_handle_corkscrews()
// Script to handle corkscrew movement from STH2.

// Find nearest corkscrew:
var cork_handle;
cork_handle = player_collision_check(COL_MAIN_OBJECT, MASK_MAIN, x, y, par_corkscrew);

if (state == STATE_CORKSCREW || state == STATE_CORKSCREW_ROLL)
{
    // Move along corkscrews:
    if (abs(x_speed) >= 4 && cork_handle != noone)
    {
        // Set relative position and angle.
        var relativeX, corkAngle;
        relativeX = x - cork_handle.x;
        corkAngle = degtorad((relativeX / 384) * 360);

        // Set Y position according to the relative position.
        y = cork_handle.y + 26 + (1 + cos(corkAngle)) * 75 * 0.5;

        // Change animation frame.
        if (state == STATE_CORKSCREW)
        {
            animation_index = "CORKSCREW";
            animation_speed = 0;
            animation_frame = abs((radtodeg(corkAngle) / 360 * 11) mod 12);
        }
    }
    else
    {
        // Revert back to the default state.
        if (state == STATE_CORKSCREW)
        {
            state = STATE_DEFAULT;
        }
        if (state == STATE_CORKSCREW_ROLL)
        {
            state = STATE_ROLL;
        }
    }
}
else
{
    // Trigger corkscrew state.
    if (abs(x_speed) >= 4 && ground)
    {
        if (cork_handle != noone)
        {
            if (state == STATE_DEFAULT)
            {
                state = STATE_CORKSCREW;
            }
            if (state == STATE_ROLL)
            {
                state = STATE_CORKSCREW_ROLL;
            }
            ground = false;
            player_set_angle(global.gravity_angle);
        }
    }
}
