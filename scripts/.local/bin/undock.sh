#!/bin/bash
# File              : undock.sh
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 15.03.2019
# Last Modified Date: 15.03.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>

case $(cat "$HOME"/.displaymode) in
  "info6")
    xrandr --output DP2-2 --off
    xrandr --output DP2-3 --off
    ;;
  "fritz")
    xrandr --output DP2-3 --off
    ;;
  "")
    ;;
esac

rm "$HOME/.displaymode"
