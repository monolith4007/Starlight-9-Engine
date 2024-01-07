/// player_handle_rings()
// Handles ring collection.
var ring;
ring = player_collision_check(COL_MAIN_OBJECT, MASK_MAIN, x, y, par_ring);
if (ring != noone)
{
    // Continue if not hurt or recovering:
    if (invincibility_type != 1 || (invincibility_timer > -1 && invincibility_timer <= 90))
    {
        // Collect ring:
        with (ring)
        {
            if (!motion) other.boost_amount += 5; // Increase the player's boosting amount.
            create_effect(spr_ring_sparkle, 0.4, x, y, -10, 0);
            instance_destroy();
        }
        global.player_rings += 1;

        // Play and pan ring sound for stereo effect:
        if (global.player_rings mod 2 != 0)
        {
            audio_play(SFX._general_ring_left,  SFX.sfx_volume, 1, 0, 0);
        }
        else
        {
            audio_play(SFX._general_ring_right, SFX.sfx_volume, 1, 0, 0);
        }
    }
}
