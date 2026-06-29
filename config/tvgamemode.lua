--[[
testing a tvgamemode bind, overall should disable monitor and enable tv output
then lauch steam in big picture.

once i have a steam controller it would be cool to detect if its connected.

would be cool to have cec control but i beleive that requires some sort of adapter.

should probably make functions local if possible (not sure how that will interact with function calls inside of functions)

need to check if using 64 bit beta and check if steam overlay issues are resolved.
]]

TVGamemodeEnabled = false

hl.env("PROTON_ENABLE_WAYLAND", "1")

--[[
-- Keep fullscreen when windows close (helps with BPM)
hl.config({
	misc = {
		exit_window_retains_fullscreen = true,
	},
})
]]

--HK: LD_PRELOAD="" MANGOHUD=1 gamescope --force-grab-cursor --adaptive-sync -w 2560 -h 1440 -W 2560 -H 1440 -r 300 -- %command%

local function enableTVgamemode()
	--hl.dsp.dpms({"enable","DP-1"})
	--hl.dsp.dpms({action = "enable",monitor = "HDMI-A-1"})
	hl.monitor({ output = "HDMI-A-1", disabled = false })

	hl.config({
		general = {
			allow_tearing = true,
		},
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
	hl.dsp.focus({ monitor = "HDMI-A-1" })
	hl.dsp.focus({ workspace = "name:tv" })
	--may want a sleep command here
	--need better way of handling shutdown
	--hl.exec_cmd("gamescope -w 3840 -h 2160 -r 60 -e -- steam -tenfoot", {workspace = "name:tv", fullscreen = true})
	hl.timer(function()
		hl.exec_cmd("gamescope -w 3840 -h 2160 -- steam", { workspace = "name:tv", fullscreen = true })
	end, { timeout = 1000, type = "oneshot" })
	--hl.exec_cmd("steam steam://open/bigpicture")
end

local function disableTVgamemode()
	--hl.dsp.dpms({"on","DP-1"})
	--hl.dsp.dpms({action = "disable",monitor = "HDMI-A-1"})

	hl.monitor({ output = "HDMI-A-1", disabled = true })

	hl.config({
		general = {
			allow_tearing = false,
		},
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
	--hl.exec_cmd("steam -shutdown && steam")
	hl.dsp.focus({ workspace = 1 })
	hl.exec_cmd("pkill steam && pkill gamescope") -- need to fix scaling when big picture is closed.
end

local function toggleTVgamemode()
	if TVGamemodeEnabled then
		disableTVgamemode()
		TVGamemodeEnabled = false
	else
		enableTVgamemode()
		TVGamemodeEnabled = true
	end
end

hl.bind("SUPER + CTRL + T", toggleTVgamemode)

--should set up special workspace exclusive to tv, if possible remove default workspaces from monitor.

--to be exlusive would have to bind numbered workspaces to monitor in for loop

--move focus to workspace before opening steam

--if doesnt fully work may need focusmonitor as well hl.dsp.focus({ monitor = "HDMI-A-1"})

--try limiting steam flags (just -steamos maybe better in future if they update to behave like steam machine over steam deck) or -tenfoot -steamos (what happens with no flags in gamescope)
--try regular big picture again nested gamescope is going to be a pain to fix, maybe regular with -gamepadui -steamos etc -will need to remove LDPRELOAD (might need better fullscreen rules))

--figure out why tv audio doesnt show up

--switch with hl.exec_cmd("wpctl set-default <ID>") ID may change on reboot can maybe set with name with pactl set-default-sink "name" (list with pactl list short sinks)

-- maybe install sof-firmware alsa-utils

--can maybe dynamically switch steamtinkerlauch to handle gamescope nesting etc (profile switching?)

