#!/bin/sh

# Start dbus and keyring
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

# Start pulseaudio
start-pulseaudio-x11

# Launch my status bar
dwm_status.sh &

# Launch the network manager applet
nm-applet &

# Start blueman applet
blueman-applet &

# Set the wallpaper

# Launch Transmission
#transmission-gtk --minimized &

# Launch twmn - notification manager
dunst &

# Start urxvt daemon
urxvtd --quiet --opendisplay &

# Start clipboard manager
clipmenud &

# Start mons
mons -a &

# Lock screen on DPMS/suspend etc.
xss-lock -- lock.sh &

# Turn the bell sound off
xset -b

# Launch udiskie - auto mount of removable drives
udiskie --tray &

# Disable touchpad
toggle_touchpad.sh

# Launch Nextcloud
nextcloud > /dev/null 2>&1 &

# Launch Slack
slack &

# Launch Discord
discord &

# Launch Evolution
evolution &

exec ~/.suckless/dwm/dwm 2> ~/.dwm.log
