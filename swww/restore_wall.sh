#!/usr/bin/env bash

# Config dir and file
# CONFIG_DIR="$HOME/.config/swww"
# LAST_WALL="$CONFIG_DIR/last_wallpaper"
LAST_WALL="$HOME/.cache/wal/current_wall"

# Make sure config directory exists
# mkdir -p "$CONFIG_DIR"

# Start swww-daemon if not running
pgrep -x swww-daemon >/dev/null || swww-daemon &

# If last wallpaper exists, restore it
if [ -f "$LAST_WALL" ]; then
    swww img "$LAST_WALL" --transition-type fade --transition-duration 1
fi

