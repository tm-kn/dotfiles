if [ -n "${BASH_VERSION-}" ] ; then
        if [ -f ~/.bashrc ] ; then
                . ~/.bashrc
       fi
fi

export PATH=$PATH:$HOME/bin
export EDITOR=vim
export VISUAL=$EDITOR

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || startx;exit
fi
