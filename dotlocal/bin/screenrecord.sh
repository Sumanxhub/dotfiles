#!/bin/bash

# Create save directory if it doesn't exist
SAVE_DIR="$HOME/Videos/ScreenRecord/"
mkdir -p "$SAVE_DIR"

# Generate timestamped filename
timestamp=$(date +'%Y%m%d_%H%M%S')
save_path="$SAVE_DIR/record_${timestamp}.mp4"

wf-recorder --codec h264_vaapi --bitrate 8M -r 60 --pixelformat yuv420p -f "$save_path"

# wf-recorder --codec h264_vaapi --bitrate 8M -r 60 --pixelformat yuv420p --audio --audio-device alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -f recording.mp4

# Start recording
# wl-screenrec \
#   --codec h264_vaapi \
#   --pixelformat yuv420p \
#   --bitrate 8M \
#   -r 60 \
#   --output eDP-1 \
#   -f "$save_path"
