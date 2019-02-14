#!/usr/bin/env zsh
# File              : .zshrc
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 25.01.2019
# Last Modified Date: 09.02.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>
# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH:~/.cabal/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gentoo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh


# Prompt
function gencolor(){
  if [[ -e $HOME/.prompt-color ]]
  then
    cat $HOME/.prompt-color
  else
    SEED="$(hostname)$USER"

    HASH="$(echo "$SEED" | sha1sum - | cut -d ' ' -f 1)"
    HASH=${HASH:0:4}
    HASH=$(printf %d 0x$HASH)

    MOD=$((HASH%7))
    MOD=${MOD#-}

    COLORS=("white" "red" "green" "yellow" "blue" "magenta" "cyan")
    COLOR=${COLORS[$MOD]}
    echo $COLOR > $HOME/.prompt-color
    echo $COLOR
  fi
}

COLOR=$(gencolor)
export PS1='%(!.%{$fg_bold[red]%}.%{$fg_bold[$COLOR]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '
export RPS1=""

# Vim keybindings
bindkey -v

# environment variables
export PATH="$PATH:$HOME/.local/bin"

# Vim/NeoVim specific stuff
if which nvim 2>&1 > /dev/null
then
  alias vim="nvim"
  alias vit="nvim -c :terminal"
  export EDITOR=nvim
else
  export EDITOR=vim
fi

# Aliasses
if which exa 2>&1 > /dev/null
then
  alias ll="exa -l --git"
  alias la="exa -la --git"
  alias tt="exa -lT --git"
  alias ta="exa -laT --git"
else
  alias ll="ls -l"
  alias la="ls -la"
  alias tt="tree -l"
  alias ta="tree -la"
fi

if uname -a | grep NixOS 2>&1 > /dev/null
then
  alias cfg="vim $HOME/.nixos/configuration.nix"
fi

if which gpg2 2>&1 > /dev/null
then
  alias gpg="gpg2"
fi
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot" 
alias g="git"
alias wgup="nmcli connection up wireguard"
alias wgdown="nmcli connection down wireguard"
alias rfc="grep -P '^\d+\s' ~/.ietf/rfc-index.txt | fzf --preview='cat ~/.ietf/rfc{+1}.txt'"
alias brclassic="nvlc http://streams.br.de/br-klassik_2.m3u"
alias tpm_reseal="sudo luks-tpm -p 0 -p 1 -p 2 -p 3 -p 5 -p 7 /dev/sda2 reset"
alias posteo_otp="pass email/posteo_otp | head -1 | xargs oathtool -b --totp="sha1" | wl-copy"
alias mutt="mutt.sh"


# Bookmark section
touch ~/.bookmarks
eval "$(cat $HOME/.bookmarks | awk '{print "alias "$1"=\"cd "$2"\""}')"

function bb() {
  BKFILE="$HOME/.bookmarks"

  if [[ "$1" == "" ]]
  then
    DIR=$(cat "$BKFILE"| fzf --preview='ls {2}' | awk '{print $2}')
    if [[ "$DIR" == "" ]]
    then
    else
      cd "$DIR"
    fi
  else
    CMD="$1"
    SK="$2"
    case "$CMD" in
      "add")
        if grep -P  "^$SK\s" "$BKFILE" >/dev/null 2>&1
        then
          sed -i "s,^$SK\s.*,$SK $(pwd)," "$BKFILE"
        else
          echo "$SK $(pwd)" >> "$BKFILE"
        fi
        eval "alias $SK=\"cd $(pwd)\""
        ;;
      "rm")
        sed -i "/^$SK\s/ d" "$BKFILE"
        eval "alias $SK=\"$SK\""
        ;;
    esac
  fi
}

# SSH-Agent startup
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

# Make iproute2 handle ipv6 by default by providing the `ipp` command
if which ip 2>&1 > /dev/null
then
  function ipp(){
    if [[ $1 == "-4" ]]
    then
      ip $@
    else
      ip -6 $@
    fi
  }
fi

# Provide a cheat function
if which curl 2>&1 > /dev/null
then
  function cheat() {
    QUERY=""
    for i in "$@"
    do
      QUERY="$QUERY/$i"
    done
    curl "cheat.sh/$QUERY"
  }
fi
