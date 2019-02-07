#!/usr/bin/env bash
# File              : .gencolor.sh
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 05.02.2019
# Last Modified Date: 07.02.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>

if [ -e $HOME/.prompt-color ]
then
  exit 0
fi

SEED="$(hostname)$USER"

HASH="$(echo "$SEED" | sha1sum - | cut -d ' ' -f 1)"
HASH=${HASH:0:4}
HASH=$(printf %d 0x$HASH)

MOD=$((HASH%7))
MOD=${MOD#-}

COLORS=("white" "red" "green" "yellow" "blue" "magenta" "cyan")
COLOR=${COLORS[$MOD]}
echo $COLOR > $HOME/.prompt-color
