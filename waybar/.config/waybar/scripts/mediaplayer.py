#!/usr/bin/env python3

import json
import subprocess


def run(cmd):
    try:
        return subprocess.check_output(cmd, text=True).strip()
    except:
        return ""


def format_time(seconds):
    minutes = int(seconds // 60)
    seconds = int(seconds % 60)
    return f"{minutes}:{seconds:02}"


status = run(["playerctl", "status"])

if not status:
    exit()

artist = run(["playerctl", "metadata", "artist"])
title = run(["playerctl", "metadata", "title"])

position = run(["playerctl", "position"])

length = run([
    "playerctl",
    "metadata",
    "mpris:length"
])

try:
    position = float(position)
except:
    position = 0

try:
    duration = int(length) / 1000000
except:
    duration = 0

percent = 0

if duration > 0:
    percent = int((position / duration) * 100)

blocks = 14
filled = int((percent / 100) * blocks)

bars = [
    "▱▱▱▱▱▱▱▱",
    "▰▱▱▱▱▱▱▱",
    "▰▰▱▱▱▱▱▱",
    "▰▰▰▱▱▱▱▱",
    "▰▰▰▰▱▱▱▱",
    "▰▰▰▰▰▱▱▱",
    "▰▰▰▰▰▰▱▱",
    "▰▰▰▰▰▰▰▱",
    "▰▰▰▰▰▰▰▰"
]

index = min(8, int(percent / 12.5))

bar = bars[index]

icon = "" if status == "Playing" else ""

text = f"{artist} - {title}" if artist else title

output = {
    "text": f"{icon}  | {text}",
    "tooltip": (
        f"{format_time(position)} / "
        f"{format_time(duration)}"
    ),
    "class": f"progress-{percent}",
    "percentage": percent
}

print(json.dumps(output))