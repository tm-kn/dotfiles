#!/bin/sh

TOUCHPAD=$(xinput list --name-only | grep -i -E "synaptics|touchpad" | head -n 1)

if [ -z "$TOUCHPAD" ]; then
    >&2 echo "No touchpad found"
    exit 1
fi

if [ $(xinput list-props "$TOUCHPAD" | grep "Device Enabled" | grep -o "[01]$") -eq 0 ]; then
    xinput enable "$TOUCHPAD"
else
    xinput disable "$TOUCHPAD"
fi
