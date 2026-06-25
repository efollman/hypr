NgamescopeRule = hl.window_rule({
	name = "normal gamescope",
	match = {
		class = "^gamescope",
	},

	pseudo = true,
	size = { 1920, 1080 },
	keep_aspect_ratio = true,
	no_initial_focus = true,
	no_follow_mouse = true,
	immediate = true,
})

TVgamescopeRule = hl.window_rule({
	name = "TV gamescope",
	match = {
		class = "^gamescope",
	},
	fullscreen = true,
})

TVgamescopeRule:set_enabled(false)

SuppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
