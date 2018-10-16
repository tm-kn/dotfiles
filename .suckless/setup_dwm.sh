#!/bin/sh
set -xe
git clone https://git.suckless.org/dwm
cd dwm
git checkout 6.1
cp ~/Projects/dotfiles/.suckless/dwm/config.h .
curl -s https://dwm.suckless.org/patches/systray/dwm-6.1-systray.diff | git apply
make
