#!/bin/zsh

WIDTH=${1:-1920}
HEIGHT=${2:-1080}
REFRESH=${3:-60}

# Create headless and capture its name
hyprctl output create headless STREAM
sleep 0.3

hyprctl keyword monitor "STREAM,${WIDTH}x${HEIGHT}@${REFRESH},9999x0,1"
#hyprctl keyword workspace "10 silent,persistent,monitor:${HEADLESS_NAME}"
#hyprctl keyword windowrulev2 "workspace 10 silent,class:^(steam)$"
