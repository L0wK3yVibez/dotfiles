#!/usr/bin/env bash

official=$(checkupdates 2>/dev/null | awk '{print "OFFICIAL|" $1}')
aur=$(yay -Qua 2>/dev/null | awk '{print "AUR|" $1}')
flatpak=$(flatpak remote-ls --updates --columns=application 2>/dev/null | awk '{print "FLATPAK|" $1}')

updates=$(printf "%s\n%s\n%s\n" "$official" "$aur" "$flatpak" | sed '/^$/d')

if [ -z "$updates" ]; then
    notify-send "Updates" "No updates available"
    exit
fi

menu_entries=$(printf "󰑐 Update ALL\n%s" "$updates")

selected=$(echo "$menu_entries" | wofi --dmenu -i -p "Updates")

[ -z "$selected" ] && exit

# Update everything
if [[ "$selected" == "󰑐 Update ALL" ]]; then
    kitty --hold sh -c "yay && flatpak update"
    exit
fi

type=$(echo "$selected" | cut -d'|' -f1)
pkg=$(echo "$selected" | cut -d'|' -f2)

case "$type" in
    "OFFICIAL")
        kitty --hold sh -c "sudo pacman -S $pkg"
        ;;
        
    "AUR")
        kitty --hold sh -c "yay -S $pkg"
        ;;
        
    "FLATPAK")
        kitty --hold sh -c "flatpak update $pkg"
        ;;
esac