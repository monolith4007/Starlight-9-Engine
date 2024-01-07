/// player_handle_list()
// Stores all of the player's NPC handling scripts.
player_handle_launch_sensor();
player_handle_falling_tiles();
player_handle_layers();
player_handle_tunnels();
player_handle_springs();
player_handle_watersurface();

if (!cpu_flag || in_view(id))
{
    player_handle_rings();
    player_handle_monitors();
    player_handle_badniks();
    player_handle_spikes();
    player_handle_projectiles();
    player_handle_hangs();
    player_handle_breakable_walls();
    player_handle_corkscrews();
}
