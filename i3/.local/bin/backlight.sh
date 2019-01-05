#!/usr/bin/env sh

case "$1" in
  "inc")
    brightnessctl set 100+
    ;;
  "dec")
    if [ "$(brightnessctl get)" -gt "199" ]
    then
      brightnessctl set 100-
    else
      brightnessctl set 100
    fi
    ;;
esac
