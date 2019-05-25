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
    while true; do
        read -p "Do you wish to start X? [Y/n]" yn
        case $yn in
            [Yy]|'') startx -- -ardelay 200 -arinterval 10; exit; break;;
            [Nn]) break;;
            *) echo "Please answer y or n.";;
        esac
    done
fi
