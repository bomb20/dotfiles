
export PATH=/home/vincent/.local/bin:$HOME/.cargo/bin:$PATH

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
#  exec startx

  export XKB_DEFAULT_LAYOUT=us
  export XKB_DEFAULT_MODEL=pc105
  export XKB_DEFAULT_VARIANT=altgr-intl
  export XKB_DEFAULT_OPTIONS=caps:swapescape
  exec sway

fi

#xmodmap ~/.Xmodmap


export PATH="$HOME/.cargo/bin:$PATH"
