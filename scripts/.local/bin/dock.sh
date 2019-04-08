#!/bin/bash
# File              : dock.sh
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 15.03.2019
# Last Modified Date: 15.03.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>

MODES='info6
fritz'

MODE=$(echo "$MODES" | dmenu)
echo "$MODE" > "$HOME/.displaymode"
case "$MODE" in
  "info6")
    xrandr --output DP2-3 --auto --right-of eDP1
    xrandr --output DP2-2 --auto --right-of DP2-3
    ;;
  "fritz")
    xrandr --output DP2-3 --auto --left-of eDP1
    ;;
  "")
    ;;
esac
