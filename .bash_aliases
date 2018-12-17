# User specific aliases and functions

# Set ipython to anaconda version
alias condaipy3='/opt/anaconda3/bin/ipython3'
# Make the dangerous commands interactive
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Paging 
alias more='less -eFqR'

# Help helpers
alias cmdapropos='apropos --sections=1,8'

# Formatted directory listings
alias ll='ls -lF --color=auto'
alias la='ls -aF --color=auto'
alias ld='ls -ld --color=auto'
alias lto='ls -At1 && echo "---Oldest---"'
alias ltn='ls -Art1 && echo "---Newest---"'
alias lspg='ls -F --color=always | more'
alias ls='ls -F --color=auto'

# global regular expression and print
alias grep='grep --color=auto --exclude-dir=\.git'
alias egrep='egrep --color=auto --exclude-dir=\.git'
alias fgrep='fgrep --color=auto --exclude-dir=\.git'

# Tops and procs
alias cpu='top -o cpu'
alias mem='top -o rsize'
alias pspg='ps axuf | less'

# Clipboard commands 
##Prev command to clipboard
alias cmdtoclip='fc -ln -1 | xclip'
alias copytoclip='xclip -selection clipboard'
alias pastefromclip='xclip -selection clipboard -o'

# Text processing 
alias trimnl='tr -d "\n"'

# Net helpers
alias getips="ifconfig | perl -nle'/dr:(\S+)/ && print $1'"

# Download commands redirected to appropriate files 
alias wget='cd ~/Downloads; wget'
alias curl='cd ~/Downloads; curl'
alias gitclone='cd ~/Downloads/cloned_repos; git clone'
# Misc
alias explore=ranger
## Why not?
alias mkdir='mkdir -pv'
alias df='df -h'
alias rmtemps='find ~/ -type f -name "*~" -delete'
alias favcmds="history | awk '{print $2}' | awk 'BEGIN {FS='|'}{print $1}' | sort | uniq -c | sort -nr | head"
