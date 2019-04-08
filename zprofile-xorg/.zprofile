#!/usr/bin/env zsh
# File              : .zprofile
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 14.02.2019
# Last Modified Date: 11.03.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>

# Environment Variables
export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"

# Make sure to start an ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# Generate conditional aliasses
$HOME/.local/bin/genailas.sh

# Start xorg
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
