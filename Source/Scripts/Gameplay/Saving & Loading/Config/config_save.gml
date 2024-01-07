/// config_save()
// Saves the game's settings to an ini file.

// Open/Create ini.
ini_open("config.ini");
ini_write_real("Display",  "Scale",      global.screen_scale);
ini_write_real("Display",  "VSync",      global.use_vsync);
ini_write_real("Audio",    "BGMVolume",  SFX.bgm_volume);
ini_write_real("Audio",    "SFXVolume",  SFX.sfx_volume);
ini_write_real("Keyboard", "KeyUp",      global.key_up);
ini_write_real("Keyboard", "KeyDown",    global.key_down);
ini_write_real("Keyboard", "KeyLeft",    global.key_left);
ini_write_real("Keyboard", "KeyRight",   global.key_right);
ini_write_real("Keyboard", "KeyAction",  global.key_action);
ini_write_real("Keyboard", "KeySpecial", global.key_special);
ini_write_real("Keyboard", "KeySwap",    global.key_swap);
ini_write_real("Keyboard", "KeyStart",   global.key_start);
ini_write_real("Gamepad",  "GMPAction",  global.gmp_action);
ini_write_real("Gamepad",  "GMPSpecial", global.gmp_special);
ini_write_real("Gamepad",  "GMPStart",   global.gmp_start);
ini_write_real("Gamepad",  "GMPSwap",    global.gmp_swap);
ini_write_real("Gameplay", "Rotation",   global.smooth_rotation);
ini_write_real("Gameplay", "Trail",      global.use_trail);
ini_write_real("Gameplay", "TimeOver",   global.limit_time);
ini_write_real("Gameplay", "HUD",        global.display_hud);
ini_write_real("Gameplay", "GoalStyle",  global.goal_style);
ini_close();

// Store max volumes.
SFX.max_bgm_volume = SFX.bgm_volume;
SFX.max_sfx_volume = SFX.sfx_volume;

// Set screen resolution.
window_resize();
