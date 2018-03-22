#! /usr/bin/env bash

if ! [[ -e "~/.offlineimap.lock" ]] && wget --spider --quiet posteo.de
then
  touch ~/.offlineimap.lock
  offlineimap 2>> ~/.offlineimap.errors
  rm ~/.offlineimap.lock  
fi

