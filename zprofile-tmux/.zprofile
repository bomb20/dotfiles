#!/bin/zsh
# File              : .zprofile
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 11.03.2019
# Last Modified Date: 11.03.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>


# Environment Variables
export SHELL=/usr/bin/zsh
export EDITOR=vim
export PATH="$PATH:$HOME/.local/bin"

# Make sure an ssh-agent is running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# Generate aliasses depending on installed tools
$HOME/.local/bin/genailas.sh

# Make sure to start tmux
if [ ! $TMUX ]
then
	if tmux has-session -t default
	then
		tmux attach-session -t default
	else
		tmux new-session -s default
	fi
  exit
fi
