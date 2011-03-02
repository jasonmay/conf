LN = @ln -sf

BINSCRIPTS= $(wildcard bin/*)

BINTARGETS = $(patsubst %,~/%, $(BINSCRIPTS))

DOTITEMS = \
~/.zshrc \
~/.re.pl/repl.rc \
~/.lesskey \
~/.gitignore \
~/.vimrc

install : $(BINTARGETS) $(DOTITEMS) ~/.vim
	
rebuildvim :
	@rebuild-vim.sh

clean :
	@echo removing $(BINTARGETS) $(DOTITEMS)...
	@rm -f $(BINTARGETS) $(DOTITEMS)

~/.zshrc : zsh/zshrc
	@echo installing .zshrc...
	$(LN) $(PWD)/zsh/zshrc ~/.zshrc

~/.re.pl/repl.rc : repl.rc
	@echo instaling repl.rc...
	@mkdir -p ~/.re.pl
	$(LN) $(PWD)/repl.rc ~/.re.pl/repl.rc

~/.lesskey : lesskey
	@echo installing .lesskey...
	$(LN) $(PWD)/lesskey ~/.lesskey
	@lesskey $<

~/.gitignore : git/gitignore
	@echo installing .gitignore...
	$(LN) $(PWD)/git/gitignore ~/.gitignore

~/bin/% : bin/%
	@echo installing $@...
	$(LN) $(PWD)/$< $@

~/.vimrc : vimrc
	@echo installing .vimrc...
	$(LN) $(PWD)/vimrc ~/.vimrc

~/.vim :
	@echo installin .vim...
	@mkdir -p ~/.vim/{bundle,autoload}
	@wget -q 'https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim' -O ~/.vim/autoload/pathogen
	@git clone https://github.com/jasonmay/jasonmay.vim ~/.vim/bundle/jasonmay
	# TODO add more bundles - snipmate, command-t, etc.

.PHONY : clean install build
