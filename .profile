if [ -n "${BASH_VERSION-}" ] && [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$PATH:$HOME/bin
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=chromium
export TERMINAL=urxvtc

export KEYBOARD_REPEAT_DELAY=255
export KEYBOARD_REPEAT_RATE=100

if [ $XDG_VTNR -eq 1 ] && [ ! $DISPLAY ]; then
    startx;exit
fi
