cd ~/repos/mercurial/vim

make distclean
hg pull
hg update -C

rvm use system >/dev/null 2>&1

./configure --without-x --disable-gui --disable-xim --disable-darwin --enable-perlinterp --enable-rubyinterp --enable-multibyte
make

sudo make install

