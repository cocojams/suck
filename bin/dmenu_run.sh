#!/bin/bash

# Load Pywal colors
. "${HOME}/.cache/wal/colors.sh"

# Launch dmenu with Pywal colors
dmenu_run -nb "$background" -nf "$foreground" -sb "$color1" -sf "$color15"

