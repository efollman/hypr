hl.windowrule({
    match = {
        title = ^float_tui,
    },

    float = true,
    center = true,
})

hl.windowrule({
    match = {
        class = ^gamescope,
    },

    pseudo = true,
    size = { 1920, 1080 },
    keep_aspect_ratio = true,
    no_initial_focus = true,
    no_follow_mouse = true,
    immediate = true,
})

hl.windowrule({
    name = suppress-maximize-events,

    match = {
        class = .*,
    },

    suppress_event = maximize,
})

hl.windowrule({
    name = move-hyprland-run,

    match = {
        class = hyprland-run,
    },

    move = 20 monitor_h-120,
    float = true,
}) =
