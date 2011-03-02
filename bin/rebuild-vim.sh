cd ~/repos/mercurial/vim

make distclean
hg pull
hg update -C

check_exec 'rvm' && rvm use system

warn_unless() { check_exec $1 || ( echo "no '$1' installed"; exit 1) }
warn_unless('ruby')
warn_unless('perl')

./configure --without-x --disable-gui --disable-xim --disable-darwin --enable-perlinterp --enable-rubyinterp --enable-multibyte
make

sudo make install

