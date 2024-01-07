/// stage_initialization()
// Initializes each level.
switch (room)
{
    case rm_playground:
    {
        stage_set_data("ENGINE TEST", 1, 2, -1, room_height, obj_parallax_ghz);
        break;
    }
    case rm_playground_2:
    {
        stage_set_data("ENGINE TEST", 2, 3, -1, room_height, obj_parallax_ehz);
        global.game_completed = true; // Enable the game completion flag.
        break;
    }
    default:
    {
        stage_set_data("", -1, -1, -1, -1, -1);
    }
}

// Create stage elements:
instance_create(0, 0, obj_hud);
if (zone_background > -1)
{
    instance_create(0, 0, zone_background);
}
if (zone_water_height > -1)
{
    instance_create(0, 0, obj_water);
}

// Create specified title card:
switch (zone_title_card)
{
    case 3:
    {
        instance_create(0, 0, obj_title_card_s3);
        break;
    }
    case 2:
    {
        instance_create(0, 0, obj_title_card_s2);
        break;
    }
    case 1:
    {
        instance_create(0, 0, obj_title_card_s1);
        break;
    }
    default:
    {
        instance_create(0, 0, obj_fade_in);
        add_time = true;
    }
}
