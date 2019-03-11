#!/usr/bin/env zsh
# File              : .zprofile
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 14.02.2019
# Last Modified Date: 14.02.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
