#!/bin/sh -e

# Start dbus and keyring
dbus-update-activation-environment --systemd DISPLAY
export $(dbus-launch)

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Allow Java programs to run properly in GUI
export _JAVA_AWT_WM_NONREPARENTING=1

exec i3
