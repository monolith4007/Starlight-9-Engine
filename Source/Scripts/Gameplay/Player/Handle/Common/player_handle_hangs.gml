/// player_handle_hangs()
// Handles collision with poles that the player can hang onto.
if (hang_timer == 0 && (state == STATE_JUMP || (state == STATE_DEFAULT && !ground) || state == STATE_SPRING || state == STATE_FLY || state == STATE_GLIDE || state == STATE_GLIDE_DROP))
{
    var hang;
    hang = collision_rectangle(x - 4, y - 2, x + 4, y + 2, par_hang, false, false);
    if (hang != noone)
    {
        // Stop movement and change state.
        x_speed         = 0;
        y_speed         = 0;
        state           = STATE_HANG;
        audio_play(SFX._player_grab, SFX.sfx_volume, 1, 0, 0);

        // Set 'hang' variables.
        hang_x        = hang.x;
        hang_type     = hang.type;
        hang_distance = hang.distance;

        // Set vertical position.
        y = hang.bbox_top + hang.offset;

        // Set horizontal position depending on whether the 'hang' is "shimmy" or not.
        if (hang_type == HANG_SHIMMY)
        {
            if (hang.left && x < hang_x)
            {
                x = hang.bbox_left + 5;
            }
            if (hang.right && x > hang_x)
            {
                x = hang.bbox_left - 5;
            }
            if (hang.middle)
            {
                if (x > hang_x + 4)
                {
                    x = hang.bbox_left - 5;
                }
                if (x < hang_x - 4)
                {
                    x = hang.bbox_left + 5;
                }
            }
        }
        else x = hang.x;
    }
}
