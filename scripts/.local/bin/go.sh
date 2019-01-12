#!/usr/bin/env bash

BKFILE="$HOME/.bookmarks"

DIR=""
if [ "$1" == "" ]
then
  DIR=$(cat "$BKFILE"| fzf --preview='ls {2}' | awk '{print $2}')
else
  DIR=$(grep -P "^$1\s" "$BKFILE" | cut -d ' ' -f 2)
fi

if [ "$DIR" == "" ]
then
  echo "./"
else
  echo "$DIR"
fi
