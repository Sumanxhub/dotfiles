#!/usr/bin/env bash

choice=$(printf "Fullscreen\nActive Window\nSelect Area" | wofi --dmenu --prompt "Screenshot:")

timestamp=$(date +'%Y%m%d_%H%M%S')
save_path=~/Pictures/Screenshots/Screenshot_${timestamp}.png

case "$choice" in
  Fullscreen)
    sleep 0.2
    grim - | tee "$save_path" | wl-copy
    ;;
  "Select Area")
    sleep 0.2
    grim -g "$(slurp)" - | tee "$save_path" | wl-copy
    ;;
  "Active Window")
    sleep 0.2
    grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | tee "$save_path" | wl-copy
    ;;
  *)
    exit 1
    ;;
esac

notify-send "Screenshot saved" "$save_path"
swappy -f "$save_path"
