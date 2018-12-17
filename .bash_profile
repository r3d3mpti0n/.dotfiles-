# .bash_profile
echo ".bash_profile sourced; bash running as interactive login shell"

if [ -f ~/.profile ]; then
    . ~/.profile
    echo ".profile sourced by .bash_profile"
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
    echo ".bashrc sourced by .bash_profile"
fi

# Get the aliases and functions
# I choose to decouple the aliases from the rc 
# Done in .bashrc, which is sourced next; redundant, for now
# if [ -f ~/.bash_aliases ]; then
    # . ~/.bash_aliases
    # echo ".bash_aliases sourced by .bash_profile"
# fi

# User specific environment and startup programs
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH
export GOPATH=$HOME/code/go
