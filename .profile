if [ -n "${BASH_VERSION-}" ] && [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$PATH:$HOME/bin
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=firefox

export JAVA_HOME=/usr/lib/jvm/default

if [ $XDG_VTNR -eq 1 ] && [ ! $DISPLAY ]; then
    # Start x and set the keyboard speed
    startx -- -ardelay 200 -arinterval 10;exit
fi
