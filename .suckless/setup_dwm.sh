#!/bin/sh
set -xe
git clone https://git.suckless.org/dwm
cd dwm
#git checkout 6.1
cp ~/Projects/dotfiles/.suckless/dwm/config.h .
#curl -s https://dwm.suckless.org/patches/systray/dwm-6.1-systray.diff | git apply
curl -s https://dwm.suckless.org/patches/systray/dwm-systray-20180314-3bd8466.diff | git apply
make
