#!/usr/bin/env bash

BKFILE="$HOME/.bookmarks"
CMD="$1"
SK="$2"

case "$CMD" in
  "add")
    if grep -P  "^$SK\s" "$BKFILE" >/dev/null 2>&1
    then
      sed -i "s,^$SK\s.*,$SK $(pwd)," "$BKFILE"
    else
      echo "$SK $(pwd)" >> "$BKFILE"
    fi
    ;;
  "rm")
    sed -i "/^$SK\s/ d" "$BKFILE"
    ;;
esac
