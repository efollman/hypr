hl.config({
    input = {
        kb_layout = us,

        follow_mouse = 1,

        sensitivity = 0,

        accel_profile = flat,
        force_no_accel = true,

        touchpad = {
            natural_scroll = false,
        },
    }
})

hl.device({
    name = wl-wlmouse-beastx,

    sensitivity = 2,
    accel_profile = flat,
})

hl.gesture({
    fingers = 3,
    direction = horizontal,
    action = workspace,
}) =
