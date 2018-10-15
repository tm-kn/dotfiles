if [ -n "${BASH_VERSION-}" ] && [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$PATH:$HOME/bin
export EDITOR=nvim
export VISUAL=$EDITOR
export BROWSER=firefox

if [ $XDG_VTNR -eq 1 ] && [ ! $DISPLAY ]; then
    startx;exit
fi
