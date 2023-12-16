/// draw_sprite_tiled_horizontal(sprite, subimage, x, y)
// Draws a sprite horizontally tiled.
var sprite_start, sprite_end, sprite_current, sprite_step;

// Retrieve sprite properties:
sprite_step  = sprite_get_width(argument0);
sprite_start = view_xview[0] + ((argument2 - view_xview[0]) mod sprite_step) - sprite_step;
sprite_end   = view_xview[0] + view_wview[0] + sprite_step;

for (sprite_current = sprite_start; sprite_current <= sprite_end; sprite_current += sprite_step)
{
    draw_sprite(argument0, argument1, sprite_current, argument3);
}
