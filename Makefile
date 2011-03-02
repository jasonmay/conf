INTO = $(HOME)
LN = ln -sf

BINSCRIPTS= $(wildcard bin/*)

BINTARGETS = $(patsubst %,~/%, $(BINSCRIPTS))

DOTITEMS = \
~/.zshrc \
~/.re.pl/repl.rc \
~/.lesskey \
~/.gitignore \
~/.vim \
~/.vimrc

install : $(BINTARGETS)
	
rebuildvim :
	@rebuild-vim.sh

~/.zshrc : zsh/zshrc
	$(LN) $(PWD)/zsh/zshrc ~/.zshrc

~/.re.pl/repl.rc : repl.rc
	@mkdir -p ~/.re.pl
	$(LN) $(PWD)/repl.rc ~/.re.pl/repl.rc

~/.lesskey : lesskey
	$(LN) $(PWD)/lesskey ~/.lesskey
	@lesskey $<

~/.gitignore : git/gitignore
	$(LN) $(PWD)/git/gitignore ~/.gitignore

~/bin/% : bin/%
	$(LN) $(PWD)/$< $@

~/.vim :
	@mkdir -p ~/.vim/{bundle,autoload}
	@wget -q 'https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim' -O ~/.vim/autoload/pathogen
	@git clone https://github.com/jasonmay/jasonmay.vim ~/.vim/bundle/jasonmay
	# TODO add more bundles - snipmate, command-t, etc.

~/.vimrc : vimrc
	$(LN) vimrc ~/.vimrc
