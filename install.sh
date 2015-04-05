brew install coreutils vim pidof wget curl
ln -sf $PWD/zsh/zshrc ~/.zshrc
ln -sf $PWD/zsh/scripts ~/.zscripts
ln -sf $PWD/git/gitignore ~/.gitignore
ln -sf $PWD/git/gitconfig ~/.gitconfig

mkdir -p ~/bin
for binary in bin/*
do
    ln -sf $PWD/$binary ~/bin/
done

if [ ! -e ~/.fzf ]
then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

ln -sf $PWD/vimrc ~/.vimrc

git submodule update --init
ln -sf $PWD/vim ~/.vim
