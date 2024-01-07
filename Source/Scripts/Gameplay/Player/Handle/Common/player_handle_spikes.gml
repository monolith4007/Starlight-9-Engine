/// player_handle_spikes()
// Used to handle collision with spikes.
var spike_top, spike_bottom, spike_left, spike_right, spike_log;

// Top:
spike_top = player_collision_check(COL_BOTTOM_OBJECT, MASK_BIG, x, y, global.gravity_angle, obj_spike_top);
if (spike_top != noone && ground)
{
    player_state_hurt(spike_top);
}

// Bottom:
spike_bottom = player_collision_check(COL_TOP_OBJECT, MASK_BIG, x, y, global.gravity_angle, obj_spike_bottom);
if (spike_bottom != noone)
{
    player_state_hurt(spike_bottom);
}

// Left:
spike_left = player_collision_check(COL_RIGHT_OBJECT, MASK_BIG, x, y, global.gravity_angle, obj_spike_left);
if (spike_left != noone)
{
    player_state_hurt(spike_left);
}

// Right:
spike_right = player_collision_check(COL_LEFT_OBJECT, MASK_BIG, x, y, global.gravity_angle, obj_spike_right);
if (spike_right != noone)
{
    player_state_hurt(spike_right);
}

// GHZ Log:
spike_log = player_collision_check(COL_MAIN_OBJECT, MASK_MAIN, x, y, obj_spike_log_harm);
if (spike_log != noone)
{
    player_state_hurt(spike_log);
}
