/// player_state_swap()
// Handles the swapping between the main player and the CPU player.
// Credit to TsukiruP.
if (global.player_id[0] == id && instance_exists(global.player_id[1]))
{
    if (global.player_id[1].state != STATE_RESPAWN && global.player_id[1].state != STATE_DEATH && global.player_id[1].state != STATE_HURT && global.player_id[1].invincibility_type != 1)
    {
        if (state != STATE_HURT && state != STATE_DEATH && input_swap_pressed && swap_timer == 0)
        {
            if (in_view(global.player_id[1]))
            {
                // Store current player IDs:
                var player, cpu;
                player = global.player_id[0];
                cpu    = global.player_id[1];

                // Swap players.
                global.player_id[0] = cpu;
                with (global.player_id[0])
                {
                    cpu_flag   = false;
                    depth      = 0;
                    swap_timer = 45;
                }

                global.player_id[1] = player;
                with (global.player_id[1])
                {
                    cpu_flag = true;
                    depth    = 1;
                }

                // Create pointer:
                instance_create(x, y, obj_player_pointer);

                // Reset camera handle.
                with (obj_camera)
                {
                    // Check if the camera is already focusing on the main player:
                    if (cam_handle.object_index == par_player)
                    {
                        cam_handle = global.player_id[0];
                    }
                }

                // Update HUD:
                with (obj_hud)
                {
                    player_name = global.player_id[0].character_id;
                }

                // Update the life monitor's icon:
                instance_activate_object(obj_monitor_life); // Temporarily activate all life monitors in case they were deactivated by the culling controller.
                with (obj_monitor_life)
                {
                    icon = global.player_id[0].character_id + 8;
                }
            }
            else
            {
                // Force the CPU to respawn when offscreen.
                with (global.player_id[1])
                {
                    cpu_offscreen_timer = 0;
                }
            }
        }
    }

    // Decrease swap timer.
    if (swap_timer > 0) swap_timer -= 1;
}
