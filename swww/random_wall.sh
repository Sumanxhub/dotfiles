#!/usr/bin/env bash

# Config dir and last wallpaper file
# CONFIG_DIR="$HOME/.config/swww"
CONFIG_DIR="$HOME/.cache/wal/"
# LAST_WALL="$CONFIG_DIR/last_wallpaper"

WALL_DIR="$HOME/Pictures/Wallpaper/" # Change this to your wallpapers folder

# Start swww-daemon if not running
pgrep -x swww-daemon >/dev/null || swww-daemon &

# Pick a random file
WALL=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Apply wallpaper
swww img "$WALL" --transition-fps 60 --transition-type grow --transition-duration 1

# Save the path
# mkdir -p "$CONFIG_DIR"
# echo "$WALL" > "$LAST_WALL"

# Make sure config directory exists
mkdir -p "$CONFIG_DIR"
ln -sf "$WALL" "$CONFIG_DIR/current_wall"

# Generate colors for theme
wal -i "$WALL" -n -s

# Apply colors to the components
# source ~/.config/wal/apply_colors.sh
