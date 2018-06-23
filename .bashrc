#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Evaluate docker machine settings
function dme() {
    eval $(docker-machine env)
}

# Custom PS1
export PS1='\[\033[32m\]\W \[\033[34m\]\$ \[\033[0m\]'

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox
