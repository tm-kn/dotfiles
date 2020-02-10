#!/bin/sh -e

# Add local bin directory to PATH
export PATH=$PATH:$HOME/bin

# Utilities
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=google-chrome-stable

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=virtualbox

export JAVA_HOME=/usr/lib/jvm/default

# Start dbus and keyring
dbus-update-activation-environment --systemd DISPLAY
export $(dbus-launch)

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Allow Java programs to run properly in GUI
export _JAVA_AWT_WM_NONREPARENTING=1

exec i3
