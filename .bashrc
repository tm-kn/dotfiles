# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Use vimx as a default editor
export EDITOR=vimx
export VISUAL=$EDITOR
alias vim=vimx
alias vi=vimx

# Evaluate docker machine settings
function dme() {
    eval $(docker-machine env)
}

# Custom PS1
export PS1='\[\033[32m\]\W \[\033[34m\]\$ \[\033[0m\]'

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox
