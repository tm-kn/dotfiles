# Add local bin directory to PATH
export PATH=$PATH:$HOME/bin

# Utilities
export EDITOR=nvim
export VISUAL=$EDITOR
export BROWSER=firefox

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Java
export JAVA_HOME=/usr/lib/jvm/default

# Allow Java programs to run properly in GUI
export _JAVA_AWT_WM_NONREPARENTING=1

if [ $XDG_VTNR -eq 1 ] && [ ! $DISPLAY ]; then
    # Start x and set the keyboard speed
    while true; do
        read -rs -k 1 "yn?Do you wish to start X? [Y/n]"

        case $yn in
            [Yy]|'') startx -- -ardelay 200 -arinterval 10; exit; break;;
            [Nn]) break;;
            *) echo "Please answer y or n.";;
        esac
    done
fi
