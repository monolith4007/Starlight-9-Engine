/// audio_unload()
// Frees all sounds from memory.
var i;
for (i = 0; i < ds_list_size(sound_table); i += 1)
{
    sound_delete(ds_list_find_value(sound_table, i));
    ds_list_delete(sound_table, i);
}
ds_list_destroy(sound_table);
