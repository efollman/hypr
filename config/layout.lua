hl.config({
	general = { --will this overwrite?
		layout = "master",
	},

	layout = {
		single_window_aspect_ratio = { 7, 6 }, --try this out (exactly somting i was looking for before)
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		allow_small_split = true,
		special_scale_factor = 0.95,
		mfact = 0.55,
		new_status = "slave",
		new_on_top = false,
		smart_resizing = false,
	},
})

hl.workspace_rule({ workspace = "special:magic", gaps_out = 40 })
