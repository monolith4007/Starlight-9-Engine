/// room_fade_to(id)
// Fades out of the current room and in to the specified room.
if (!instance_exists(obj_fade_to))
{
    with (instance_create(0, 0, obj_fade_to))
    {
        index = argument0;
    }
}
