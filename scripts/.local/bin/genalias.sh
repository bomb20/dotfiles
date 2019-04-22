#!/bin/bash
# File              : genalias.sh
# Author            : Vincent Truchseß <redtux@posteo.net>
# Date              : 11.03.2019
# Last Modified Date: 11.03.2019
# Last Modified By  : Vincent Truchseß <redtux@posteo.net>

ALIASFILE="$HOME/.aliasses"

if [ -e $ALIASFILE ]
then
  rm $ALIASFILE
fi

# Vim/NeoVim specific stuff
if which nvim 2>&1 > /dev/null
then
  echo 'alias v="nvim"' >> $ALIASFILE
else
  echo 'alias v="vim"' >> $ALIASFILE
fi

# ls or exa
if which exa 2>&1 > /dev/null
then
  echo 'alias ll="exa -l --git"' >> $ALIASFILE
  echo 'alias la="exa -la --git"' >> $ALIASFILE
  echo 'alias tt="exa -lT --git"' >> $ALIASFILE
  echo 'alias ta="exa -laT --git"' >> $ALIASFILE
else
  echo 'alias ll="ls -l"' >> $ALIASFILE
  echo 'alias la="ls -la"' >> $ALIASFILE
  echo 'alias tt="tree -l"' >> $ALIASFILE
  echo 'alias ta="tree -la"' >> $ALIASFILE
fi

# gpg or gpg2
if which gpg2 2>&1 > /dev/null
then
  echo 'alias gpg="gpg2"' >> $ALIASFILE
fi
