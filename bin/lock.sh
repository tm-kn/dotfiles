#!/bin/sh
set -x
revert() {
    xset dpms 0 0 0
    xset -dpms
}
trap revert HUP INT TERM
xset +dpms dpms 5 5 5
xset dpms force suspend
i3lock -n
revert
