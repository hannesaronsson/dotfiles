#!/bin/zsh

WIDTH=${1:-1920}
HEIGHT=${2:-1080}
REFRESH=${3:-60}
HDR=${4:-false}

MONITOR_STRING="STREAM,${WIDTH}x${HEIGHT}@${REFRESH},9999x0,1,vrr,1"

if [[ "$HDR" == "true" ]]; then
  MONITOR_STRING="${MONITOR_STRING}, bitdepth, 10, cm, hdr, sdrbrightness, 1.2, sdrsaturation 1"
fi

hyprctl keyword monitor "STREAM,${WIDTH}x${HEIGHT}@${REFRESH},9999x0,1, "
