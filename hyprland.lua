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

hl.exec_once("waybar")
hl.exec_once("hyprpaper")
hl.exec_once("hyprpolkitagent")
hl.exec_once("mako")

--might not be necissary, may also belong in appearance
hl.exec_once("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
hl.exec_once("gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3")

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

require("config.monitors")
require("config.appearance")
require("config.input")
require("config.rules")
require("config.binds")