hl.monitor({
	output = "",
	mode = "2560x1440@300",
	position = "auto",
	scale = 1,
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.config({
	misc = {
		vrr = 3, -- video or game content 3, set to 1 or 2 (fullscreen only) if this causes issues/ doesnt work
	},
	quirks = {
		prefer_hdr = 2, --gamescope only
	},
})
