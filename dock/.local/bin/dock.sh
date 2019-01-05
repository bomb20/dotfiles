#!/bin/sh

case "$1" in
  #"info6")
  #  swaymsg "\
  #    output eDP-1 position 0 0\
  #  ; output DP-5 position 1920 0\
  #  ; output DP-4 position 3840 0\
  #  "
  #  ;;
  "info6")
    xrandr --output DP2-3 --auto --right-of eDP1
    xrandr --output DP2-2 --auto --right-of DP2-3
    ;;
  "")
    #for i in $(swaymsg -t get_outputs | grep "name" | cut -d ':' -f 2 | sed -e 's/\",$/\"/')
    #do
    #  swaymsg output $i position 0 0
    #done
    ;;
esac
