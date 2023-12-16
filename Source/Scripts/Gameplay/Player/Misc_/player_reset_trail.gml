/// player_reset_trail()
// Resets the player's trail effect. Call this whenever the player's animation switches to the rolling one.

// Exit if the trail is disabled or we're in the rolling animation:
if (!global.use_trail || animation_index == "ROLL" || animation_index == "DROPDASH") exit;

ds_list_clear(vertex_x[1]);
ds_list_clear(vertex_x[2]);
ds_list_clear(vertex_y[1]);
ds_list_clear(vertex_y[2]);

repeat (trail_length)
{
    ds_list_add(vertex_x[1], floor(x));
    ds_list_add(vertex_x[2], floor(x));
    ds_list_add(vertex_y[1], floor(y));
    ds_list_add(vertex_y[2], floor(y));
}
