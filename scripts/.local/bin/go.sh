#!/usr/bin/env bash

BKFILE="$HOME/.bookmarks"

if [ "$1" == "" ]
then
  echo "$(cat "$BKFILE" | cut -d ' ' -f 2 | fzf --preview='ls {1}')"
else
  DIR=$(grep -P "^$1\s" "$BKFILE" | cut -d ' ' -f 2)
  if ! [ "$DIR" == "" ]
  then
    echo "$DIR"
  fi
fi
