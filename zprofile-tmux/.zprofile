#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#    ssh-agent > ~/.ssh-agent-thing
#fi
#if [[ "$SSH_AGENT_PID" == "" ]]; then
#    eval "$(<~/.ssh-agent-thing)"
#fi

#if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
#  exec startx
#fi
#

#xmodmap ~/.Xmodmap


if [ ! $TMUX ]
then
	if tmux has-session -t default
	then
		tmux attach-session -t default
	else
		tmux new-session -s default
	fi
fi
