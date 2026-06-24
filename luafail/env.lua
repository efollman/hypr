local terminal = ghostty
local fileManager = nautilus
local menu = hyprlauncher
local browser = chromium

_G.terminal = terminal
_G.fileManager = fileManager
_G.menu = menu
_G.browser = browser

hl.env(GDK_SCALE, 1)
hl.env(GTK_THEME, Adwaita:dark)
hl.env(QT_QPA_PLATFORMTHEME, qt6ct)
hl.env(QT_QPA_PLATFORM, wayland)
hl.env(XCURSOR_SIZE, 24)
hl.env(HYPRCURSOR_SIZE, 24)

hl.exec_once(waybar)
hl.exec_once(hyprpaper)
hl.exec_once(hyprpolkitagent)
hl.exec_once(mako)

hl.exec([[gsettings set org.gnome.desktop.interface color-scheme prefer-dark]])
hl.exec([[gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3]])
