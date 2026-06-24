hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,

		col = {
			active_border = "rgba(fff0dfbf)",
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "master",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 0.95,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},
})

hl.config({
	dwindle = {
		preserve_split = true,
	},

	master = {
		allow_small_split = true,
		special_scale_factor = 0.95,
		mfact = 0.55,
		new_status = "slave",
		new_on_top = false,
		smart_resizing = true,
	},
})
