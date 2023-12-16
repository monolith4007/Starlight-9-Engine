/// player_handle_tunnels()
// Used to go through tunnels.

// Re-apply horizontal speed if it ever drops to 0.
if (ground && tunnel_lock)
{
    state = STATE_ROLL;
    if (x_speed == 0)
    {
        x_speed = 4;
    }
}

// Trigger the Tunnel Lock:
if (!tunnel_lock)
{
    if (player_collision_check(COL_MAIN_OBJECT, x, y, obj_sensor_lock_tunnel_right) && x_speed >= 0)
    {
        tunnel_lock = true;
        if (state != STATE_ROLL)
        {
            player_reset_trail();
            audio_play(SFX._player_roll, SFX.sfx_volume, 1, 0, 0);
        }
    }
    else if (player_collision_check(COL_MAIN_OBJECT, x, y, obj_sensor_lock_tunnel_left) && x_speed <= 0)
    {
        tunnel_lock = true;
        if (state != STATE_ROLL)
        {
            player_reset_trail();
            audio_play(SFX._player_roll, SFX.sfx_volume, 1, 0, 0);
        }
    }
}

// Disable the Tunnel Lock:
if (tunnel_lock)
{
    if (player_collision_check(COL_MAIN_OBJECT, x, y, obj_sensor_lock_tunnel_right) && x_speed < 0)
    {
        tunnel_lock = false;
        state       = STATE_ROLL;
    }
    else if (player_collision_check(COL_MAIN_OBJECT, x, y, obj_sensor_lock_tunnel_left) && x_speed > 0)
    {
        tunnel_lock = false;
        state       = STATE_ROLL;
    }
}
