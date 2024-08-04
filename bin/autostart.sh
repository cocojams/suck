#!/bin/sh

# Run custom look script
/home/omar/.local/bin/newlook

# Start network applets (uncomment if needed)
# nm-applet &
# blueman-applet &

# Start status bar
slstatus &

# Start compositor for transparency and effects
picom &

