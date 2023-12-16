/// audio_initialize()
// Loads sounds and music used in the game. This script should be used frames after the game has loaded to prevent crashes or freezes.
// To play a sound effect, use audio_play(SFX.index, volume, pitch, loop, duplicate). Adding "SFX." in front of the sound name is important!
// To play music, use music_play(SFX.index).
// To load sounds from a directory, copy-paste the code below after the variable declaration and set the directory name, file extension and file kind.

/*
sound_id      = file_find_first(working_directory + "\data\audio\sound\<folder>\*.<extension>", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = sound_add(working_directory + "\data\audio\sound\<folder>\" + string(sound_id), <kind>, true);
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    ds_list_add(sound_table, sound_id_name);
    sound_id      = file_find_next();
}
file_find_close();
*/

// Set up sound table list:
sound_table = ds_list_create();

// Variables:
var sound_id, sound_id_name, sound_file;

// ########################################################################################################################## //

// Player Sounds:
sound_id      = file_find_first(working_directory + "\data\audio\sound\player\*.wav", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = sound_add(working_directory + "\data\audio\sound\player\" + string(sound_id), 0, true);
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    ds_list_add(sound_table, sound_id_name);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //

// General Sounds:
sound_id      = file_find_first(working_directory + "\data\audio\sound\general\*.wav", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = sound_add(working_directory + "\data\audio\sound\general\" + string(sound_id), 0, true);
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    ds_list_add(sound_table, sound_id_name);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //

// Shields:
sound_id      = file_find_first(working_directory + "\data\audio\sound\shield\*.wav", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = sound_add(working_directory + "\data\audio\sound\shield\" + string(sound_id), 0, true);
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    ds_list_add(sound_table, sound_id_name);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //

// Jingles:
sound_id      = file_find_first(working_directory + "\data\audio\sound\jingle\*.ogg", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = sound_add(working_directory + "\data\audio\sound\jingle\" + string(sound_id), 3, true);
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    ds_list_add(sound_table, sound_id_name);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //

// Music:
sound_id      = file_find_first(working_directory + "\data\audio\music\*.ogg", 0);
sound_id_name = "";
sound_file    = "";

while (sound_id != "")
{
    sound_file    = sound_add(working_directory + "\data\audio\music\" + string(sound_id), 1, true);
    sound_id_name = filename_change_ext(sound_id, "");
    variable_local_set(sound_id_name, sound_file);
    ds_list_add(sound_table, sound_id_name);
    sound_id      = file_find_next();
}
file_find_close();

// ########################################################################################################################## //
