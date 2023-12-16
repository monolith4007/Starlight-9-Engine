/// animation_tail_apply(sprite, speed, x, y, angle, direction)
// Script used to apply the animation of the tail part for Tails.
if (argument[0] != noone)
{
    tails_tail_sprite    = argument[0];
    tails_tail_speed     = argument[1];
    tails_tail_x         = argument[2];
    tails_tail_y         = argument[3];
    tails_tail_angle     = argument[4];
    tails_tail_direction = argument[5];
}
else
{
    tails_tail_sprite    = noone;
}
