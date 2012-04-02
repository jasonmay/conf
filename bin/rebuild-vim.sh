#!/bin/bash
cd ~/repos/mercurial/vim

make distclean
hg pull
hg update -C

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
rvm system

./configure --without-x --disable-gui --disable-xim --disable-darwin --enable-perlinterp --enable-rubyinterp --enable-multibyte
make

sudo make install

