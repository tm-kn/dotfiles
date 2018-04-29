#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias de='eval $(docker-machine env)'
PS1="\[\033[46;97;1m\]"'[$?] \W $ '"\[\033[0m\] "
