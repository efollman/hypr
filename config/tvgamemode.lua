--[[
testing a tvgamemode bind, overall should disable monitor and enable tv output
then lauch steam in big picture.

ideally it would be a toggle on the same bind.

may need to do extra things such as disable vrr, force or set hdr prefered etc

once i have a steam controller it would be cool to detect if its connected.

would be cool to have cec control but i beleive that requires some sort of adapter.


]]

hl.bind("SUPER + CTRL + T", function()
    --hl.monitor({output = "Figure out", disabled = true})
    --hl.monitor({output = "Figure out", disabled = false})
    
    hl.config({
        misc = {
		    vrr = 0, -- game and video content only (3) was not working gamescope
	    },
	    quirks = {
		    prefer_hdr = 1, --prefer hdr always, unsure if necissary or even good.
	    },
    })
    --may want a sleep command here
    hl.exec_cmd("steam -bigpicture")
end)

hl.bind("SUPER + CTRL + SHIFT + T", function()
    hl.exec_cmd("steam steam://close/bigpicture")
    --hl.monitor({output = "Figure out", disabled = true})
    --hl.monitor({output = "Figure out", disabled = false})
    hl.config({
        misc = {
		    vrr = 1, -- game and video content only (3) was not working gamescope
	    },
	    quirks = {
		    prefer_hdr = 2, --gamescope only (not sure if works correctly or is really needed yet)
	    },
    })
end)