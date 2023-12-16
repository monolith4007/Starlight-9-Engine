/// animation_core()
// Actual core of the animation system.

// Check if the animation has changed:
if (animation_index != animation_previous)
{
    // If the animation has changed, set the previous animation to the new one.
    animation_previous = animation_index;

    // Get the animation data:
    animation_data();

    // Set animation frame to the starting frame:
    animation_frame = animation_start;

    // Reset the finished flag:
    animation_finished = false;
}

// Check if the animation has not finished.
if (!animation_finished)
{
    // Add speed to our animation:
    animation_frame += animation_speed;

    // Check if we reached the last frame:
    if (floor(animation_frame) > animation_end)
    {
        // If we allow the animation to be looped, set the frame to the looping one.
        if (animation_loop_count != 0)
        {
            animation_frame = animation_loop;

            // If the animation can't be looped indefinitely, decrease the number of times it can be looped:
            if (animation_loop_count > -1)
            {
                animation_loop_count -= 1;
            }
        }
        else
        {
            // The animation ended, switch to the linked animation if one exists:
            animation_frame = animation_end;
            if (animation_next != "")
            {
                animation_index = animation_next;
                if (animation_next_frame != 0)
                {
                    // Set the previous animation to the linked one and set the new animation frame:
                    animation_previous = animation_index;
                    animation_frame    = animation_next_frame;

                    // Get the animation data again:
                    animation_data();
                }
            }
            else
            {
                // Set the finished flag:
                animation_finished = true;
            }
        }
    }
}

// Tail animation speed.
if (tails_tail_sprite != noone)
{
    tails_tail_frame += tails_tail_speed;
}
