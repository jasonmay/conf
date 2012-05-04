#!/bin/bash
make distclean || exit 1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
rvm use system

./configure --without-x --disable-gui --disable-xim --disable-darwin  --enable-rubyinterp --enable-multibyte
make

sudo make install

