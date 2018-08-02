#!/bin/sh

TOUCHPAD="SynPS/2 Synaptics TouchPad"

if [ $(xinput list-props "$TOUCHPAD" | grep "Device Enabled" | grep -o "[01]$") -eq 0 ]; then
    xinput enable "$TOUCHPAD"
else
    xinput disable "$TOUCHPAD"
fi
