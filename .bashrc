# .bashrc
echo ".bashrc sourced"
# Source global definitions
if [ -f /etc/bashrc ]; then
 	. /etc/bashrc
    echo "global bashrc sourced by .bashrc"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Set defailt editor
export EDITOR=vim

# Remove duplicates from bash cmd history
export HISTCONTROL=ignoredups

# Append commands to .bash_history instead of overwriting it
shopt -s histappend

# Immediately append commands to history; usually, the appending to bash_history is 
# deffered until the end of the session (the command history for the entire session is 
# appended to .bash_history at this point; it's a batch job, really.). This env var
# tells bash to write the command history at each new prompt.
PROMPT_COMMAND='history -a'

# Installer cruft
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Powerline config 
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
  echo "bash/powerline.sh sourced by .bashrc"
fi

# Source the alias file.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
    echo ".bash_aliases sourced by .bashrc"
fi
