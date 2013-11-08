#!/bin/bash
export ARCHFLAGS="-arch i386"
#make distclean || exit 0

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#rvm use system

./configure --without-x --disable-gui --disable-xim --disable-darwin  --enable-rubyinterp --enable-pythoninterp --enable-multibyte
make

sudo make install

