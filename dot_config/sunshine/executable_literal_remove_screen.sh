#!/bin/zsh

HEADLESS_NAME=$(hyprctl monitors | grep -oE 'HEADLESS-[0-9]+' | tail -n1)

if [[ -n "$HEADLESS_NAME" ]]; then
  hyprctl keyword windowrulev2 "workspace unset,class:^(steam)$"
  hyprctl  output remove "${HEADLESS_NAME}"
  echo "Removed ${HEADLESS_NAME} and cleared windowrulev2"
else
  echo "No headless output found — nothing to remove."
fi
