# Add local bin directory to PATH
export PATH=$PATH:$HOME/bin

# Alias startx to include keyboard speed settings.
alias startx="startx -- -ardelay 200 -arinterval 10"

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

function startsway() {
    export LIBSEAT_BACKEND=logind
    export XDG_SESSION_DESKTOP=sway
    export XDG_CURRENT_DESKTOP=sway

    exec dbus-run-session sway
}

# Ask user if they want to start Sway
if [ "$XDG_VTNR" = "1" ] && [ ! $DISPLAY ]; then
    # Start x and set the keyboard speed
    while true; do
        read -rs -k 1 "yn?Do you wish to start Sway? [Y/n]"

        case $yn in
            [Yy]|'') startsway; exit; break;;
            [Nn]) break;;
            *) echo "Please answer y or n.";;
        esac
    done
fi

# Start GNOME Keyring daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
