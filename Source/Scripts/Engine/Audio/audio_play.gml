/// audio_play(index, [volume], [pitch], [loop], [duplicate])
// Plays the given sound effect with the given volume and pitch value.
// If duplicate is 0, the sound will stop first if it's already playing.

// Set up default argument variables:
var index, volume, pitch, loop, duplicate, sound_id;
volume    = SFX.sfx_volume;
pitch     = 1;
loop      = 0;
duplicate = 0;

// If the number of given arguments is greater than 0, change the value of each variable (credit to VectorSatyr for this method).
switch (argument_count)
{
    case 5: duplicate = argument[4];
    case 4: loop = argument[3];
    case 3: pitch = argument[2];
    case 2: volume = argument[1];
    default: index = argument[0];
}

// Stop duplicates of the sound if applicable.
if (duplicate == 0)
{
    if (sound_isplaying(index))
    {
        sound_stop(index);
    }
}

// Play/loop the given sound.
if (loop == 0)
{
    sound_id = sound_play_ex(index, volume, pitch);
}
else
{
    sound_id = sound_loop_ex(index, volume, pitch);
}
return sound_id;
