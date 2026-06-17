export EDITOR=/usr/bin/vim
export BROWSER=cachy-browser
export TERM=xterm-kitty
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_CURRENT_DESKTOP=Hyprland

# Toolkit backends
export GDK_BACKEND='wayland,x11'
export QT_QPA_PLATFORM='wayland;xcb'
export SDL_VIDEODRIVER='wayland,x11,windows'
export MOZ_ENABLE_WAYLAND=1

# Java / accessibility
export _JAVA_AWT_WM_NONREPARENTING=1
export NO_AT_BRIDGE=1
