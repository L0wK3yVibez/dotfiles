#!/usr/bin/env bash

pacman_list=$(checkupdates 2>/dev/null || true)
aur_list=$(yay -Qua 2>/dev/null || true)
flatpak_list=$(flatpak remote-ls --updates 2>/dev/null || true)

pacman_count=$(printf "%s\n" "$pacman_list" | sed '/^$/d' | wc -l)
aur_count=$(printf "%s\n" "$aur_list" | sed '/^$/d' | wc -l)
flatpak_count=$(printf "%s\n" "$flatpak_list" | sed '/^$/d' | wc -l)

total=$((pacman_count + aur_count + flatpak_count))

tooltip=$(printf "Official:\n%s\n\nAUR:\n%s\n\nFlatpak:\n%s" \
    "$pacman_list" \
    "$aur_list" \
    "$flatpak_list")

jq -cn \
    --arg text "󰏔 $total" \
    --arg tooltip "$tooltip" \
    '{text:$text, tooltip:$tooltip}'