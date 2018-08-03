#!/bin/sh

inputs=$(xinput list --name-only | grep -i -E "synaptics|touchpad" | head -n 1)

if [ -z "$inputs" ]; then
    >&2 echo "No touchpad found"
    exit 1
fi

echo $inputs | while read line;
do
    if [ $(xinput list-props "$line" | grep "Device Enabled" | grep -o "[01]$") -eq 0 ]; then
        xinput enable "$line"
    else
        xinput disable "$line"
    fi
done
