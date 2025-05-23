#!/bin/zsh

WIDTH=${1:-1920}
HEIGHT=${2:-1080}
REFRESH=${3:-60}

# Create headless and capture its name
hyprctl output create headless
sleep 0.3

# Get the newest HEADLESS-N name
HEADLESS_NAME=$(hyprctl monitors | grep -oE 'HEADLESS-[0-9]+' | tail -n1)

echo "Using headless output: $HEADLESS_NAME"

hyprctl keyword monitor "${HEADLESS_NAME},${WIDTH}x${HEIGHT}@${REFRESH},9999x0,1"
hyprctl keyword workspace "10 silent,persistent,monitor:${HEADLESS_NAME}"
hyprctl keyword windowrulev2 "workspace 10 silent,class:^(steam)$"
