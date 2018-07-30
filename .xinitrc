#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
export $(dbus-launch)
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

setxkbmap -layout gb -model pc104 -option shift:both_capslock_cancel,caps:escape

exec i3
