/// audio_stop(index)
// Stops the given sound.
switch (argument0)
{
    case all: sound_stop_all(); break;
    default: sound_stop(argument0);
}
