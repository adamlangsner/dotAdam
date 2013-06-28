source ~/.bashrc

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