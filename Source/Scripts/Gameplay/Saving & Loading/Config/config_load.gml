/// config_load()
// Loads the game's settings from an ini file.

// Open/Create ini.
ini_open("config.ini");
global.screen_scale    = ini_read_real("Display",  "Scale",       1);
global.use_vsync       = ini_read_real("Display",  "VSync",       0);
SFX.bgm_volume         = ini_read_real("Audio",    "BGMVolume",   1);
SFX.sfx_volume         = ini_read_real("Audio",    "SFXVolume",   1);
global.key_up          = ini_read_real("Keyboard", "KeyUp",       vk_up);
global.key_down        = ini_read_real("Keyboard", "KeyDown",     vk_down);
global.key_left        = ini_read_real("Keyboard", "KeyLeft",     vk_left);
global.key_right       = ini_read_real("Keyboard", "KeyRight",    vk_right);
global.key_action      = ini_read_real("Keyboard", "KeyAction",   ord("Z"));
global.key_special     = ini_read_real("Keyboard", "KeySpecial",  ord("X"));
global.key_swap        = ini_read_real("Keyboard", "KeySwap",     ord("C"));
global.key_start       = ini_read_real("Keyboard", "KeyStart",    vk_enter);
global.gmp_action      = ini_read_real("Gamepad",  "GMPAction",  -1);
global.gmp_special     = ini_read_real("Gamepad",  "GMPSpecial", -1);
global.gmp_start       = ini_read_real("Gamepad",  "GMPStart",   -1);
global.gmp_swap        = ini_read_real("Gamepad",  "GMPSwap",    -1);
global.smooth_rotation = ini_read_real("Gameplay", "Rotation",    0);
global.use_trail       = ini_read_real("Gameplay", "Trail",       0);
global.limit_time      = ini_read_real("Gameplay", "TimeOver",    1);
global.display_hud     = ini_read_real("Gameplay", "HUD",         1);
global.goal_style      = ini_read_real("Gameplay", "GoalStyle",   1);
ini_close();

// Store max volumes.
SFX.max_bgm_volume = SFX.bgm_volume;
SFX.max_sfx_volume = SFX.sfx_volume;

// Set screen resolution.
window_resize();
