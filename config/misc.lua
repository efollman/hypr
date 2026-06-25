terminal = "ghostty"
fileManager = "nautilus"
menu = "hyprlauncher"
browser = "chromium"

hl.env("GDK_SCALE", "1")
hl.env("GTK_THEME", "Adwaita:dark")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("PROTON_ENABLE_WAYLAND", "1")

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprpolkitagent")
	hl.exec_cmd("mako")

	--might not be necissary, might not be working, may also belong in appearance
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3")
end)

hl.config({
	misc = {
		disable_hyprland_logo = true,
		--disable_splash_rendering = true, --not sure if needed
	},
	ecosystem = {
		no_update_news = false,
		no_donation_nag = true,
	},
})

