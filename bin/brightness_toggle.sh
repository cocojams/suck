#!/bin/bash

# Define paths and commands
brightness_file="/sys/class/backlight/amdgpu_bl1/brightness"
max_brightness=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
step_size=100  # Adjust the step size as needed

# Function to get current brightness level
get_brightness() {
    current_brightness=$(cat $brightness_file)
    echo $current_brightness
}

# Function to set brightness level
set_brightness() {
    echo $1 | sudo tee $brightness_file > /dev/null
}

# Main script logic for increasing brightness
increase_brightness() {
    current=$(get_brightness)
    new_brightness=$((current + step_size))
    if [ $new_brightness -le $max_brightness ]; then
        set_brightness $new_brightness
    fi
}

# Main script logic for decreasing brightness
decrease_brightness() {
    current=$(get_brightness)
    new_brightness=$((current - step_size))
    if [ $new_brightness -ge 0 ]; then
        set_brightness $new_brightness
    fi
}

case "$1" in
    "up")
        increase_brightness
        ;;
    "down")
        decrease_brightness
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

exit 0
