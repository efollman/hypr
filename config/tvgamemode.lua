--[[
testing a tvgamemode bind, overall should disable monitor and enable tv output
then lauch steam in big picture.

once i have a steam controller it would be cool to detect if its connected.

would be cool to have cec control but i beleive that requires some sort of adapter.

should probably make functions local if possible (not sure how that will interact with function calls inside of functions)

need to check if using 64 bit beta and check if steam overlay issues are resolved.
]]

IsTVgamemodeEnabled = false

function enableTVgamemode()
	hl.monitor({ output = "HDMI-A-1", disabled = false })
	hl.monitor({ output = "DP-1", disabled = true })

	hl.config({
		misc = {
			vrr = 0, -- vrr off for tv
		},
		quirks = {
			prefer_hdr = 0, --test 0 for a while set to one later to see behavior
		},
	})

	SuppressMaximizeRule:set_enabled(false)
	NgamescopeRule:set_enabled(false)
	TVgamescopeRule:set_enabled(true)
	--may want a sleep command here
	hl.exec_cmd("steam -tenfoot")
	--hl.exec_cmd("gamescope -f -e -U -- steam -tenfoot") -- can try nested gamescope later, may cause issues
	--hl.exec_cmd("steam steam://open/bigpicture")
end

function disableTVgamemode()
	hl.monitor({ output = "DP-1", disabled = false })
	hl.monitor({ output = "HDMI-A-1", disabled = true })

	hl.config({
		misc = {
			vrr = 1, -- game and video content only (3) was not working gamescope
		},
		quirks = {
			prefer_hdr = 2, --gamescope only (not sure if works correctly or is really needed yet)
		},
	})

	SuppressMaximizeRule:set_enabled(true)
	NgamescopeRule:set_enabled(true)
	TVgamescopeRule:set_enabled(false)

	hl.exec_cmd("steam steam://close/bigpicture") -- need to fix scaling when big picture is closed.
end

function toggleTVgamemode()
	if IsTVgamemodeEnabled then
		disableTVgamemode()
	else
		enableTVgamemode()
	end

end



hl.bind("SUPER + CTRL + T", toggleTVgamemode())

-- Keep fullscreen when windows close (helps with BPM)
hl.config({
	misc = {
		exit_window_retains_fullscreen = true,
	},
})
