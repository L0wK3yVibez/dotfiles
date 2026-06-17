#!/usr/bin/env bash

STATE="$HOME/.config/hypr/opacity_state"

STEP=0.1
MIN=0.3
MAX=1.0

# create state file if missing
if [ ! -f "$STATE" ]; then
echo "ACTIVE=0.8" > "$STATE"
echo "INACTIVE=0.7" >> "$STATE"
fi

source "$STATE"

clamp() {
awk -v v="$1" -v min="$MIN" -v max="$MAX" '
BEGIN {
if(v<min) print min;
else if(v>max) print max;
else print v;
}'
}

normalize() {
awk -v v="$1" -v min="$MIN" -v max="$MAX" '
BEGIN {
percent = (v-min)/(max-min)*100
if (percent < 0) percent = 0
if (percent > 100) percent = 100
printf "%d", percent
}'
}

bar() {
    local percent=$1
    local segments=10
    local filled=$((percent * segments / 100))

    local bar=""

    for ((i=1;i<=segments;i++)); do
        if [ $i -le $filled ]; then
            bar+="█"
        else
            bar+="░"
        fi
    done

    echo "$bar"
}

case "$1" in
active_up) ACTIVE=$(clamp $(awk "BEGIN{print $ACTIVE+$STEP}")) ;;
active_down) ACTIVE=$(clamp $(awk "BEGIN{print $ACTIVE-$STEP}")) ;;
inactive_up) INACTIVE=$(clamp $(awk "BEGIN{print $INACTIVE+$STEP}")) ;;
inactive_down) INACTIVE=$(clamp $(awk "BEGIN{print $INACTIVE-$STEP}")) ;;
esac

echo "ACTIVE=$ACTIVE" > "$STATE"
echo "INACTIVE=$INACTIVE" >> "$STATE"

hyprctl keyword decoration:active_opacity $ACTIVE
hyprctl keyword decoration:inactive_opacity $INACTIVE

ACTIVE_P=$(normalize "$ACTIVE")
INACTIVE_P=$(normalize "$INACTIVE")

ACTIVE_BAR=$(bar "$ACTIVE_P")
INACTIVE_BAR=$(bar "$INACTIVE_P")

notify-send \
-h string:x-canonical-private-synchronous:opacity \
-t 1200 \
"Opacity Settings" \
"Active   [$ACTIVE_BAR] $ACTIVE_P%
Inactive [$INACTIVE_BAR] $INACTIVE_P%"
