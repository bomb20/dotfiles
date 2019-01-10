#!/usr/bin/env bash

if pgrep mutt
then
  if ! pgrep offlineimap
  then
    offlineimap &
  fi
else
  if pgrep offlineimap
  then
    kill "$(pgrep offlineimap)"
  fi
fi
