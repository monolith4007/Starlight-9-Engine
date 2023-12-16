/// tile_set_flags(collision_flag, angle_change, launch_flag, launch_angle, launch_direction, ceiling_movement, edge_skip, edge_exception)
// Sets the collision flags for the calling tile.

// Collision flag - turns on collision for the calling tile.
tile_collision_flag = argument0;

// Rotation flag - sets whether the player can rotate on the calling tile or not.
// If this is disabled, the values for the edge skip and edge exception flags are ignored.
tile_rotate_flag = argument1;

// Launch flag - sets whether the player can launch off the calling tile or not (used for ramps).
// If this is disabled, the values for the launch angle and launch direction flags are ignored.
tile_launch_flag = argument2;

// Launch angle - the angle at which the player is launched off the tile.
// If you do not want the player to be launched at a specific angle, set it to -1.
tile_launch_angle = argument3;

// Launch direction - sets the launching direction of the tile.
// This makes it so that the player can only launch off the tile (if possible) when moving in the same direction.
// A direction of 1 indicates Right, and a direction of -1 indicates Left.
// If you don't want the player to launch in a specific direction, set it to 0.
tile_launch_direction = argument4;

// Ceiling movement flag - sets whether the player can adapt and move on the ceiling.
// An example is when the player jumps and grabs onto quarter ellipses above them.
tile_ceiling_movement = argument5;

// Edge skip flag - sets whether the edge sensor collision check should be skipped or not, which is used to receive a new angle value.
// When enabled, the player can receive a new angle value regardless if the edge sensors are detecting a collision or not.
// Skipping the edge sensor collision check fixes some collision issues like the player bumping off quarter ellipses or getting stuck inside them.
// Because of this, you should only turn it on for such types of terrain.
tile_edge_skip = argument6;

// Edge exception flag - enabling this prevents the player from colliding with terrain at angles of 90 and 270 degrees.
tile_edge_exception = argument7;
