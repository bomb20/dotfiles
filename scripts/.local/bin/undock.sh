#!/usr/bin/env sh

case "$1" in
  "info6")
    xrandr --output DP2-2 --off
    xrandr --output DP2-3 --off
    ;;
esac
