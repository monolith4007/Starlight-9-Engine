/// animation_data()
// Gets the animation data of each character.
switch (character_id)
{
    // Sonic:
    case CHAR_CLASSIC_SONIC:
    {
        animation_set("IDLE",        spr_sonic_idle,        0, 0,  0,     0,  0, "",        0);
        animation_set("BORED_1",     spr_sonic_idle,        1, 4,  0,     3,  8, "BORED_2", 0);
        animation_set("BORED_2",     spr_sonic_idle,        5, 9,  0,     5,  0, "BORED_1", 3);
        animation_set("CROUCH",      spr_sonic_crouch,      0, 1,  0.15,  0,  0, "",        0);
        animation_set("LOOK_UP",     spr_sonic_lookup,      0, 1,  0.15,  0,  0, "",        0);
        animation_set("WALK",        spr_sonic_walk,        0, 7,  0.125, 0, -1, "",        0);
        animation_set("RUN",         spr_sonic_run,         0, 3,  0.5,   0, -1, "",        0);
        animation_set("PEELOUT",     spr_sonic_peelout,     0, 3,  0,     0, -1, "",        0);
        animation_set("ROLL",        spr_sonic_roll,        0, 7,  0.2,   0, -1, "",        0);
        animation_set("DROPDASH",    spr_sonic_dropdash,    0, 5,  0.5,   0, -1, "",        0);
        animation_set("SPINDASH",    spr_sonic_spindash,    0, 9,  1,     0, -1, "",        0);
        animation_set("SPRING",      spr_sonic_spring,      0, 0,  0,     0,  0, "",        0);
        animation_set("BRAKE",       spr_sonic_brake,       0, 3,  0.25,  3,  0, "",        0);
        animation_set("PUSH",        spr_sonic_push,        0, 4,  0.1,   1, -1, "",        0);
        animation_set("HANG",        spr_sonic_hang,        0, 0,  0.06,  0, -1, "",        0);
        animation_set("HANG_CARRY",  spr_sonic_hang_carry,  0, 2,  0.015, 0, -1, "",        0);
        animation_set("HANG_MOVE",   spr_sonic_hang_move,   0, 5,  0.1,   0, -1, "",        0);
        animation_set("HANG_SHIMMY", spr_sonic_hang_shimmy, 0, 1,  0.15,  0, -1, "",        0);
        animation_set("CORKSCREW",   spr_sonic_corkscrew,   0, 11, 0.2,   0,  0, "",        0);
        animation_set("BALANCE_IN",  spr_sonic_balance_in,  0, 2,  0.15,  0, -1, "",        0);
        animation_set("BALANCE_OUT", spr_sonic_balance_out, 0, 2,  0.12,  0, -1, "",        0);
        animation_set("HURT",        spr_sonic_hurt,        0, 1,  0.1,   0, -1, "",        0);
        animation_set("BREATHE",     spr_sonic_breath,      0, 0,  0,     0,  0, "",        0);
        animation_set("DEATH",       spr_sonic_die,         0, 0,  0,     0,  0, "",        0);
        animation_set("DROWN",       spr_sonic_drown,       0, 0,  0,     0,  0, "",        0);
        animation_set("GOAL",        spr_sonic_goal,        0, 4,  0.1,   1, -1, "",        0);
        break;
    }

    // Tails:
    case CHAR_TAILS:
    {
        animation_set("IDLE",        spr_tails_idle,           0, 0,  0,     0,  0, "",        0);
        animation_set("BORED_1",     spr_tails_idle,           1, 1,  0.05,  1,  6, "BORED_2", 0);
        animation_set("BORED_2",     spr_tails_idle,           2, 13, 0.15,  2,  0, "BORED_1", 0);
        animation_set("CROUCH",      spr_tails_crouch,         0, 0,  0,     0,  0, "",        0);
        animation_set("LOOK_UP",     spr_tails_lookup,         0, 0,  0,     0,  0, "",        0);
        animation_set("WALK",        spr_tails_walk,           0, 7,  0.1,   0, -1, "",        0);
        animation_set("RUN",         spr_tails_run,            0, 2,  0.125, 0, -1, "",        0);
        animation_set("ROLL",        spr_tails_roll,           0, 2,  0.2,   0, -1, "",        0);
        animation_set("SPINDASH",    spr_tails_spindash,       0, 2,  1,     0, -1, "",        0);
        animation_set("SPRING",      spr_tails_spring,         0, 1,  0.1,   0, -1, "",        0);
        animation_set("BRAKE",       spr_tails_brake,          0, 1,  0.25,  1,  0, "",        0);
        animation_set("PUSH",        spr_tails_push,           0, 4,  0.1,   1, -1, "",        0);
        animation_set("HANG",        spr_tails_hang,           0, 3,  0.06,  0, -1, "",        0);
        animation_set("HANG_MOVE",   spr_tails_hang_move,      0, 5,  0.1,   0, -1, "",        0);
        animation_set("HANG_SHIMMY", spr_tails_hang_shimmy,    0, 1,  0.15,  0, -1, "",        0);
        animation_set("CORKSCREW",   spr_tails_corkscrew,      0, 11, 0.2,   0,  0, "",        0);
        animation_set("FLY",         spr_tails_fly,            0, 0,  0,     0,  0, "",        0);
        animation_set("FLY_CARRY",   spr_tails_fly_carry,      0, 1,  0,     0,  0, "",        0);
        animation_set("FLY_DROP",    spr_tails_fly_exhausted,  0, 4,  0.045, 0, -1, "",        0);
        animation_set("SWIM",        spr_tails_swim,           0, 3,  0.25,  0, -1, "",        0);
        animation_set("SWIM_DROP",   spr_tails_swim_exhausted, 0, 2,  0.1,   0, -1, "",        0);
        animation_set("BALANCE_IN",  spr_tails_balance,        0, 1,  0.15,  0, -1, "",        0);
        animation_set("HURT",        spr_tails_hurt,           0, 1,  0.1,   0, -1, "",        0);
        animation_set("BREATHE",     spr_tails_breath,         0, 0,  0,     0,  0, "",        0);
        animation_set("DEATH",       spr_tails_die,            0, 0,  0,     0,  0, "",        0);
        animation_set("DROWN",       spr_tails_drown,          0, 0,  0,     0,  0, "",        0);
        animation_set("GOAL",        spr_tails_goal,           0, 1,  0.1,   0,  0, "",        0);
        break;
    }

    // Knuckles:
    case CHAR_KNUCKLES:
    {
        animation_set("IDLE",        spr_knuckles_idle,        0, 0,  0,     0,  0,  "",        0);
        animation_set("BORED_1",     spr_knuckles_idle,        1, 2,  0.05,  1,  11, "BORED_2", 0);
        animation_set("BORED_2",     spr_knuckles_idle,        3, 43, 0.15,  3,  0,  "",        0);
        animation_set("CROUCH",      spr_knuckles_crouch,      0, 1,  0.15,  0,  0,  "",        0);
        animation_set("LOOK_UP",     spr_knuckles_lookup,      0, 1,  0.15,  0,  0,  "",        0);
        animation_set("WALK",        spr_knuckles_walk,        0, 7,  0.125, 0, -1,  "",        0);
        animation_set("RUN",         spr_knuckles_run,         0, 3,  0.5,   0, -1,  "",        0);
        animation_set("ROLL",        spr_knuckles_roll,        0, 7,  0.2,   0, -1,  "",        0);
        animation_set("SPINDASH",    spr_knuckles_spindash,    0, 9,  1,     0, -1,  "",        0);
        animation_set("SPRING",      spr_knuckles_spring,      0, 0,  0,     0,  0,  "",        0);
        animation_set("BRAKE",       spr_knuckles_brake,       0, 1,  0.25,  1,  0,  "",        0);
        animation_set("PUSH",        spr_knuckles_push,        0, 4,  0.1,   1, -1,  "",        0);
        animation_set("HANG",        spr_knuckles_hang,        0, 3,  0.06,  0, -1,  "",        0);
        animation_set("HANG_CARRY",  spr_knuckles_hang_carry,  0, 2,  0.015, 0, -1,  "",        0);
        animation_set("HANG_MOVE",   spr_knuckles_hang_move,   0, 5,  0.1,   0, -1,  "",        0);
        animation_set("HANG_SHIMMY", spr_knuckles_hang_shimmy, 0, 1,  0.15,  0, -1,  "",        0);
        animation_set("CORKSCREW",   spr_knuckles_corkscrew,   0, 11, 0.2,   0,  0,  "",        0);
        animation_set("BALANCE_IN",  spr_knuckles_balance,     0, 11, 0,     8, -1,  "",        0);
        animation_set("GLIDE",       spr_knuckles_glide,       0, 0,  0,     0,  0,  "",        0);
        animation_set("GLIDE_DROP",  spr_knuckles_glide_drop,  0, 1,  0.15,  0,  0,  "",        0);
        animation_set("SLIDE",       spr_knuckles_slide,       0, 0,  0,     0,  0,  "",        0);
        animation_set("CLIMB",       spr_knuckles_climb,       0, 5,  0,     0, -1,  "",        0);
        animation_set("CLIMB_LEDGE", spr_knuckles_ledge,       0, 3,  0.2,   0,  0,  "",        0);
        animation_set("HURT",        spr_knuckles_hurt,        0, 1,  0.1,   0, -1,  "",        0);
        animation_set("BREATHE",     spr_knuckles_breath,      0, 0,  0,     0,  0,  "",        0);
        animation_set("DEATH",       spr_knuckles_die,         0, 0,  0,     0,  0,  "",        0);
        animation_set("DROWN",       spr_knuckles_drown,       0, 0,  0,     0,  0,  "",        0);
        animation_set("GOAL",        spr_knuckles_goal,        0, 3,  0.1,   0,  0,  "",        0);
        break;
    }

    // Amy:
    case CHAR_AMY:
    {
        animation_set("IDLE",         spr_amy_idle,             0, 0,  0,     0,  0, "",           0);
        animation_set("BORED_1",      spr_amy_idle,             1, 5,  0.1,   2, -1, "",           0);
        animation_set("CROUCH",       spr_amy_crouch,           0, 1,  0.15,  0,  0, "",           0);
        animation_set("LOOK_UP",      spr_amy_lookup,           0, 1,  0.15,  0,  0, "",           0);
        animation_set("WALK",         spr_amy_walk,             0, 7,  0.125, 0, -1, "",           0);
        animation_set("RUN",          spr_amy_run,              0, 3,  0.5,   0, -1, "",           0);
        animation_set("ROLL",         spr_amy_roll,             0, 7,  0.2,   0, -1, "",           0);
        animation_set("SPINDASH",     spr_amy_spindash,         0, 9,  1,     0, -1, "",           0);
        animation_set("SPRING",       spr_amy_spring,           0, 0,  0,     0,  0, "",           0);
        animation_set("BRAKE",        spr_amy_brake,            0, 3,  0.25,  3,  0, "",           0);
        animation_set("PUSH",         spr_amy_push,             0, 4,  0.1,   1, -1, "",           0);
        animation_set("HANG",         spr_amy_hang,             0, 0,  0.06,  0, -1, "",           0);
        animation_set("HANG_CARRY",   spr_amy_hang_carry,       0, 2,  0.015, 0, -1, "",           0);
        animation_set("HANG_MOVE",    spr_amy_hang_move,        0, 5,  0.1,   0, -1, "",           0);
        animation_set("HANG_SHIMMY",  spr_amy_hang_shimmy,      0, 1,  0.15,  0, -1, "",           0);
        animation_set("CORKSCREW",    spr_amy_corkscrew,        0, 11, 0.2,   0,  0, "",           0);
        animation_set("BALANCE_IN",   spr_amy_balance,          0, 4,  0.15,  0, -1, "",           0);
        animation_set("HAMMER_PUNCH", spr_amy_hammer_punch,     0, 9,  0.5,   0,  0, "",           0);
        animation_set("HAMMER_AIR",   spr_amy_hammer_punch_air, 0, 13, 0.4,   13, 0, "",           0);
        animation_set("HAMMER_SPIN",  spr_amy_hammer_spin,      0, 5,  0.5,   0, -1, "",           0);
        animation_set("HAMMER_FLIP",  spr_amy_hammer_flip,      0, 9,  0.4,   2,  1, "HAMMER_AIR", 11);
        animation_set("HURT",         spr_amy_hurt,             0, 1,  0.1,   0, -1, "",           0);
        animation_set("BREATHE",      spr_amy_breath,           0, 0,  0,     0,  0, "",           0);
        animation_set("DEATH",        spr_amy_die,              0, 0,  0,     0,  0, "",           0);
        animation_set("DROWN",        spr_amy_drown,            0, 0,  0,     0,  0, "",           0);
        animation_set("GOAL",         spr_amy_goal,             0, 3,  0.1,   0,  0, "",           0);
        break;
    }

    // Modern Sonic:
    case CHAR_MODERN_SONIC:
    {
        animation_set("IDLE",        spr_modern_idle,        0, 0,  0,     0,  0, "",        0);
        animation_set("BORED_1",     spr_modern_idle,        1, 5,  0,     4,  8, "BORED_2", 0);
        animation_set("BORED_2",     spr_modern_idle,        6, 23, 0.15,  6,  0, "BORED_1", 4);
        animation_set("CROUCH",      spr_modern_crouch,      0, 1,  0.15,  0,  0, "",        0);
        animation_set("LOOK_UP",     spr_modern_lookup,      0, 1,  0.15,  0,  0, "",        0);
        animation_set("WALK",        spr_modern_walk,        0, 7,  0.125, 0, -1, "",        0);
        animation_set("RUN",         spr_modern_run,         0, 3,  0.5,   0, -1, "",        0);
        animation_set("ROLL",        spr_modern_roll,        0, 7,  0.2,   0, -1, "",        0);
        animation_set("SPINDASH",    spr_modern_spindash,    0, 9,  1,     0, -1, "",        0);
        animation_set("SPRING",      spr_modern_spring,      0, 0,  0,     0,  0, "",        0);
        animation_set("BRAKE",       spr_modern_brake,       0, 3,  0.25,  3,  0, "",        0);
        animation_set("PUSH",        spr_modern_push,        0, 4,  0.1,   1, -1, "",        0);
        animation_set("HANG",        spr_modern_hang,        0, 0,  0.06,  0, -1, "",        0);
        animation_set("HANG_CARRY",  spr_modern_hang_carry,  0, 2,  0.015, 0, -1, "",        0);
        animation_set("HANG_MOVE",   spr_modern_hang_move,   0, 5,  0.1,   0, -1, "",        0);
        animation_set("HANG_SHIMMY", spr_modern_hang_shimmy, 0, 1,  0.15,  0, -1, "",        0);
        animation_set("CORKSCREW",   spr_modern_corkscrew,   0, 11, 0.2,   0,  0, "",        0);
        animation_set("BALANCE_IN",  spr_modern_balance,     0, 2,  0.15,  0, -1, "",        0);
        animation_set("HURT",        spr_modern_hurt,        0, 1,  0.1,   0, -1, "",        0);
        animation_set("BREATHE",     spr_modern_breath,      0, 0,  0,     0,  0, "",        0);
        animation_set("DEATH",       spr_modern_die,         0, 0,  0,     0,  0, "",        0);
        animation_set("DROWN",       spr_modern_drown,       0, 0,  0,     0,  0, "",        0);
        animation_set("GOAL",        spr_modern_goal,        0, 0,  0,     0,  0, "",        0);
        break;
    }
}
