#!/bin/sh -e

# Start dbus and keyring
dbus-update-activation-environment --systemd DISPLAY
export $(dbus-launch)

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
