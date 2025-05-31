#!/bin/zsh

MONITOR=${1:-DP-1}

for ((i = 0; i < 10; i++)); do
  hyprctl dispatch moveworkspacetomonitor "${i}" "${MONITOR}"
done
