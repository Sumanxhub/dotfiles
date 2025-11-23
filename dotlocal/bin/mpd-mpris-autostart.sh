#!/bin/bash

while true; do
    # Wait for any player state change
    mpc idle player > /dev/null

    # Get current MPD state
    state=$(mpc status | awk 'NR==2 {print $1}' | tr -d '[]')

    if [[ "$state" == "playing" || "$state" == "paused" ]]; then
        # Start mpd-mpris if not running
        if ! systemctl --user --quiet is-active mpd-mpris.service; then
            systemctl --user start mpd-mpris.service
        fi
    else
        # Stop mpd-mpris if running (means "stopped/idle")
        if systemctl --user --quiet is-active mpd-mpris.service; then
            systemctl --user stop mpd-mpris.service
        fi
    fi
done

