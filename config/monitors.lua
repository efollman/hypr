hl.monitor({
	output = "DP-1", --specify output? need to create switching game mode logic at some point as well
	mode = "2560x1440@300",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "3840x2160@60",
	position = "auto",
	scale = 2,
	--disabled = true,
})

hl.workspace_rule({ workspace = "name:tv", monitor = "HDMI-A-1"})
hl.monitor({output = "HDMI-A-1",  disabled = true })

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.config({
	misc = {
		vrr = 1, -- game and video content only (3) was not working gamescope
	},
	quirks = {
		prefer_hdr = 2, --gamescope only (not sure if works correctly yet)
	},
})
