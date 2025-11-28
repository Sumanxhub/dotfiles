#!/bin/bash

if [[ -f /tmp/last_brightness ]]; then
    target=$(cat /tmp/last_brightness)
    brightnessctl set "${target}%"
    rm /tmp/last_brightness
fi

