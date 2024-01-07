/// window_resize()
// Sets the window resolution.
if (global.screen_scale < 5)
{
    if (window_get_fullscreen())
    {
        window_set_fullscreen(false);
    }
    window_set_size(SCREEN_WIDTH * global.screen_scale, SCREEN_HEIGHT * global.screen_scale);
}
else
{
    if (!window_get_fullscreen())
    {
        window_set_fullscreen(true);
    }
    window_set_size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

// Center window.
ctrl_screen.alarm[0] = 1;
