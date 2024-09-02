#!/bin/bash

# Toggle nm-applet
if pgrep nm-applet > /dev/null; then
    killall nm-applet
else
    nm-applet &
fi

# Toggle blueman-applet
if pgrep blueman-applet > /dev/null; then
    killall blueman-applet
else
    blueman-applet &
fi

