/// music_play(index, [loop_start], [loop_end])
// Plays the given music track in the current room.
if (!sound_isplaying(argument[0]))
{
    if (argument_count == 3)
    {
        var length;
        length = sound_get_length(argument[0]);
        sound_set_loop(argument[0], argument[1] / length, argument[2] / length);
    }
    music_id = sound_loop_ex(argument[0], SFX.bgm_volume, 1);
}
