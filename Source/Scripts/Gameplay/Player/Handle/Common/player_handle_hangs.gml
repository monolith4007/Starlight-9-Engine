/// player_handle_hangs()
// Used for colliding with grabbable objects.
if (hang_timer == 0 && (state == STATE_JUMP || (state == STATE_DEFAULT && !ground) || state == STATE_SPRING || state == STATE_FLY || state == STATE_GLIDE || state == STATE_GLIDE_DROP))
{
    var hang;
    hang = collision_rectangle(x - 4, y - 2, x + 4, y + 2, par_hang, false, false);
    if (hang != noone)
    {
        // Change variables.
        x_speed         = 0;
        y_speed         = 0;
        state           = STATE_HANG;
        animation_index = "HANG";
        audio_play(SFX._player_grab, SFX.sfx_volume, 1, 0, 0);

        with (hang)
        {
            // Set hang variables:
            other.hang_y        = bbox_top + bbox;
            other.hang_type     = type;
            other.hang_distance = distance;
            other.hang_x        = x;

            // Set horizontal position for the "shimmy" hang.
            if (type == HANG_SHIMMY)
            {
                if (left)
                {
                    if (other.x < x)
                    {
                        other.x = bbox_left + 5;
                    }
                }
                if (right)
                {
                    if (other.x > x)
                    {
                        other.x = bbox_right - 5;
                    }
                }
                if (middle)
                {
                    if (other.x > x + 4)
                    {
                        other.x = bbox_right - 5;
                    }
                    if (other.x < x - 4)
                    {
                        other.x = bbox_left + 5
                    }
                }
            }
            else
            {
                other.x = x;
            }
        }
    }
}
