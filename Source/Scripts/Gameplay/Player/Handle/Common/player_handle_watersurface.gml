/// player_handle_watersurface()
// Used to change speeds after entering or exiting water.

// Only run if there's water.
if (STG.zone_water_height != -1)
{
    // Entering the water. 
    if (y > STG.zone_water_height && yprevious < STG.zone_water_height)
    {
        x_speed *= 0.5;
        y_speed *= 0.25;
        create_effect(spr_water_splash, 0.25, x, STG.zone_water_height - 8, -999996, 0);
        audio_play(SFX._general_water_splash, SFX.sfx_volume, 1, 0, 1);
    }
    else if (y < STG.zone_water_height && yprevious > STG.zone_water_height) // Exiting the water.
    {
        y_speed *= 2;
        create_effect(spr_water_splash, 0.25, x, STG.zone_water_height - 8, -999996, 0);
        audio_play(SFX._general_water_splash, SFX.sfx_volume, 1, 0, 1);
    }
}
