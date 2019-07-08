#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definition
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Disable ctrl-s and ctrl-q.
stty -ixon

# Infinite history
export HISTSIZE=
export HISTFILESIZE=

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

shopt -s histappend

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'

# pwman
tbxpw(){
    TERM=xterm ssh -t tomaszk@pw.torchbox.com "sudo -u pwman /usr/local/bin/launch_pwman \"$@\""
}

# Torchbox aliases
alias tbxdokku='ssh -t dokku@staging.torchbox.com '
alias ffdokku="ssh -t dokku@ff-apps.dh.bytemark.co.uk "
alias tbxaws="aws --profile tbx "

# Evaluate docker machine settings
function dme() {
    eval $(docker-machine env)
}

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# NVM
NVM_PATH=/usr/share/nvm/init-nvm.sh
if [ -f $NVM_PATH ]; then
    source $NVM_PATH
else
    echo "Warning: nvm not found at $NVM_PATH"
fi
