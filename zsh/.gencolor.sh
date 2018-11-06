#!/bin/bash

SEED="$(hostname)$USER"

HASH="$(echo "$SEED" | sha1sum - | cut -d ' ' -f 1)"
HASH=${HASH:0:4}
HASH=$(printf %d 0x$HASH)

MOD=$(($HASH%7))
MOD=${MOD#-}

COLOR=""
case "$MOD" in
  "0")
    COLOR="white"
    ;;
  "1")
    COLOR="blue"
    ;;
  "2")
    COLOR="green"
    ;;
  "3")
    COLOR="cyan"
    ;;
  "4")
    COLOR="red"
    ;;
  "5")
    COLOR="purple"
    ;;
  "6")
    COLOR="yellow"
    ;;
  *)
    COLOR="white"
    ;;
esac

echo $COLOR
