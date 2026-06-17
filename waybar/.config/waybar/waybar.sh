#!/usr/bin/env sh

killall -q waybar
while pgrep -x waybar >/dev/null; do sleep 1; done

waybar --config "${XDG_CONFIG_HOME:-$HOME/.config}/waybar/config.jsonc"
