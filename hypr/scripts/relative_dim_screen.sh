#!/bin/bash

# Get current brightness and max brightness
current=$(brightnessctl g)
max=$(brightnessctl m)

# Calculate percent of max
percent=$(( 100 * current / max ))

# Save current percent to restore later
echo "$percent" > /tmp/last_brightness

# Reduce by 70% of current brightness
dimmed=$(( percent * 30 / 100 ))

# Make sure minimum brightness is 1%
if [ "$dimmed" -lt 1 ]; then dimmed=1; fi

# Apply dimmed brightness
brightnessctl set "${dimmed}%"

