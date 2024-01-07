/// player_state_grind()
// The player's state whilst moving along rails.
// Credit to John-Kun.
if (player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, angle, obj_rail))
{
    // Create grind effect:
    if (state != STATE_GRIND)
    {
        var spark;
        spark        = instance_create(x, y, obj_grind_spark);
        spark.handle = id;
        player_reset_trail();
        audio_play(SFX._player_grind, SFX.sfx_volume, 1, 0, 0);
    }
    
    // Set speed and change state.
    state = STATE_GRIND;
    if (abs(x_speed) < 6)
    {
        x_speed = animation_direction * 6;
    }
}
else
{
    if (state == STATE_GRIND)
    {
        state  = STATE_JUMP;
    }
}
