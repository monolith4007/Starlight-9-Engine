/// create_effect(sprite_index, image_speed, x, y, depth, loop_count, [xscale], [angle])
// Creates an effect with the given properties.
with (instance_create(argument[2], argument[3], obj_effect))
{
    sprite_index = argument[0];
    image_speed  = argument[1];
    depth        = argument[4];
    loop_count   = argument[5];
    if (argument_count > 6)
    {
        image_xscale = argument[6];
    }
    if (argument_count > 7)
    {
        image_angle = argument[7];
    }
}
