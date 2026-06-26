-- should use dpms dispatcher instead of turning monitor off

hl.dsp.dpms({"off","DP-1"})
hl.dsp.dpms({"on","HDMI-A-1"})

--should set up special workspace exclusive to tv, if possible remove default workspaces from monitor.

--to be exlusive would have to bind numbered workspaces to monitor in for loop

hl.workspace_rule({ workspace = "name:tv", monitor = "HDMI-A-1", default = true, gaps_in = 0, gaps_out = 0, border_size = 0, no_shadow = true, no_rounding = true, decorate = false, persistent = true})

--move focus to workspace before opening steam

--if doesnt fully work may need focusmonitor as well
hl.dsp.focus({ workspace = "name:tv"})

--then

hl.exec_cmd("steam -shutdown && sleep 2 && gamescope ... -- steam")

--try limiting steam flags (just -steamos maybe better in future if they update to behave like steam machine over steam deck) or -tenfoot -steamos (what happens with no flags in gamescope)
--try regular big picture again nested gamescope is going to be a pain to fix, maybe regular with -gamepadui -steamos etc -will need to remove LDPRELOAD (might need better fullscreen rules))

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
    idle_inhibit = "fullscreen",
})

TVgamescopeRule = hl.window_rule({
	name = "TV gamescope",
	match = {
		class = "^gamescope",
	},
	fullscreen = true,
    fullscreen_state = 3,
    content = "game",
    stay_focused = true,
    idle_inhibit = "always",
    immediate = true,
    render_unfocused = true,
})