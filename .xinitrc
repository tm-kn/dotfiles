#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
export $(dbus-launch)
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# Set keyboard layout
# It can be set via localectl.
#setxkbmap -layout gb -model pc104 -option shift:both_capslock_cancel,caps:escape

# Disable screen blanking or screen saver
xset -dpms
xset s off

if [ -n $KEYBOARD_REPEAT_DELAY ] && [ -n $KEYBOARD_REPEAT_RATE ]; then
    xset r rate $KEYBOARD_REPEAT_DELAY $KEYBOARD_REPEAT_RATE
fi

exec i3
