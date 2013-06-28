[[ -s "/opt/boxen/env.sh" ]] && source "/opt/boxen/env.sh"


j() {
	cd `autojump $1`
}

brewery=`brew --prefix`
[[ -s $brewery/etc/autojump.sh ]] && . $brewery/etc/autojump.sh
[[ -s $brewery/etc/bash_completion ]] && . $brewery/etc/bash_completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export CLICOLOR=1
export TERM=xterm-color
export HISTCONTROL="ignoredups"
export HISTIGNORE="[   ]*:&:bg:fg:exit"

parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

uber_prompt() {
    local        BLUE="\[\033[0;34m\]"
    local      YELLOW="\[\033[0;33m\]"
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[\033[1;31m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    PS1="$LIGHT_GRAY$*$GREEN\$(parse_git_branch)$LIGHT_GRAY\$ "
    PS2='> '
    PS4='+ '
}

myself="`whoami`"
darwin_prompt="\u@\h:\W"
me_prompt="\h:\W"
if [ "$myself" == 'Adam' -o "$myself" == 'alangsner' ]; then
    uber_prompt $me_prompt;
else
    uber_prompt $darwin_prompt;
fi

# aliases
alias c='clear'
alias ll='ls -la'
alias cl='c;ll'
alias cs='c;gs'
alias cr='c;git ra'
alias h='sudo vim /etc/hosts'
alias gs='git status'
alias gd='git diff'
alias gds='git diff | subl'
alias gc='git commit -v'
alias gac='git commit -a -v'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gh='git push'
alias go='gac && gpr && gh'
alias x='exit'
alias sag='sudo apachectl graceful'
alias cdate='date '\''+%Y%m%d%H%M%S'\'''
function z() {
   tar -czvf $1.tgz $1;
}
