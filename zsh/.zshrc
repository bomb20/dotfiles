#!/bin/zsh
# File              : .zshrc
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 25.01.2019
# Last Modified Date: 30.01.2019
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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

#source ~/.prompt-color
$HOME/.gencolor.sh
COLOR=$(cat $HOME/.prompt-color)
export PS1='%(!.%{$fg_bold[red]%}.%{$fg_bold[$COLOR]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '
# User configuration

# Vin keybindings
bindkey -v

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=vim
export RUST_SRC_PATH=~/.local/src/rustc-1.26.2-src/src

alias ll="exa -l --git"
alias la="exa -la --git"
alias gpg="gpg2"
alias td="task schedule"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot" 
alias today="task next +TODAY or +next or scheduled:today or +OVERDUE"
alias tt="exa -lT --git"
alias ta="exa -laT --git"
alias g="git"
alias wgup="sudo wg_init.sh wg0 fe80::ff01"
alias wgdown="sudo wg_down.sh wg0"
alias rfc="grep -P '^\d+\s' ~/.ietf/rfc-index.txt | fzf --preview='cat ~/.ietf/rfc{+1}.txt'"
alias brclassic="nvlc http://streams.br.de/br-klassik_2.m3u"
alias tpm_reseal="udo luks-tpm -p 0 -p 1 -p 2 -p 3 -p 5 -p 7 /dev/sda2 reset"
alias posteo_otp="pass email/posteo_otp | head -1 | xargs oathtool -b --totp="sha1" | wl-copy"
alias mutt="mutt.sh"
alias vim="nvim"
function cc(){
  cd $(go.sh $1)
}
#alias rfc="less ~/.ietf/\$(echo $(grep -P '^\d+\s' ~/.ietf/rfc-index.txt | fzf --preview='cat ~/.ietf/rfc{+1}.txt') | cut -d ' ' -f 1 | sed -e 's/$/.txt/' | sed -e 's/^/rfc/')"
#alias week="task next +WEEK or +next or +OVERDUE"
#alias work="task +joni or +fritz"
#alias uni="task +uni"
#alias email="task +email or +call"
#
#echo "Today's tasks:"
#task +WEEK 2>/dev/null
#xmodmap ~/.Xmodmap
#

#
eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
        
