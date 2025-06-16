#!/bin/zsh

WIDTH=${1:-1920}
HEIGHT=${2:-1080}
REFRESH=${3:-60}
HDR=${4:-false}


if hyprctl -j monitors | grep -q '"name":"STREAM"'; then
  # nothing to do
  exit 0
fi

# Create headless and capture its name
hyprctl output create headless STREAM
sleep 0.3

MONITOR_STRING="STREAM,${WIDTH}x${HEIGHT}@${REFRESH},9999x0,1,vrr,1"

if [[ "$HDR" == "true" ]]; then
  MONITOR_STRING="${MONITOR_STRING}, bitdepth, 10, cm, hdr, sdrbrightness, 1.2, sdrsaturation 1"
fi

hyprctl keyword monitor "STREAM,${WIDTH}x${HEIGHT}@${REFRESH},9999x0,1, "
