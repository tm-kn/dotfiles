#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
export $(dbus-launch)
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# Set keyboard layout
# It can be set via localectl.
#setxkbmap -layout gb -model pc104 -option shift:both_capslock_cancel,caps:escape

# Set key repeat rate
xset r rate 255 100

exec i3
