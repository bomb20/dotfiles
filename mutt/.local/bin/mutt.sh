#!/usr/bin/env bash
# File              : mutt.sh
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 05.02.2019
# Last Modified Date: 05.02.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>

if ! pgrep -u "$USER" offlineimap  > /dev/null 2>&1
then
  offlineimap > /dev/null 2>&1 &
fi

neomutt

kill $!

# vim: set filetype bash
