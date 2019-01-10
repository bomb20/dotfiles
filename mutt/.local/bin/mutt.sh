#!/usr/bin/env bash

if ! pgrep -u "$USER" offlineimap  > /dev/null 2>&1
then
  offlineimap > /dev/null 2>&1 &
fi

/usr/local/bin/mutt

kill $!

# vim: set filetype bash
