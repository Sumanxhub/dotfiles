#!/bin/bash

### Clipboard with Wofi
# cliphist list | wofi -S dmenu | cliphist decode | wl-copy

### Without Index
# cliphist list | wofi --dmenu --prompt=Clipboard --pre-display-cmd "echo '%s' | cut -f 2" | cliphist decode | wl-copy


### Clipboard  with fuzzel
cliphist list | fuzzel --dmenu | cliphist decode | wl-copy

### Without Index
# cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy
