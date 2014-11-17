LN = @ln -sf

BINSCRIPTS= $(wildcard bin/*)

BINTARGETS = $(patsubst %,~/%, $(BINSCRIPTS))

DOTITEMS = \
~/.zshrc \
~/.zscripts \
~/.gitignore \
~/.gitconfig \
~/.vim \
~/.vimrc

install : $(BINTARGETS) $(DOTITEMS) ~/.vim
	
rebuildvim :
	@rebuild-vim.sh

clean :
	@echo removing $(BINTARGETS) $(DOTITEMS)...
	@rm -f $(BINTARGETS) $(DOTITEMS)
	@rm -rf ~/.vim

~/.zshrc : zsh/zshrc
	@echo installing .zshrc...
	$(LN) $(PWD)/zsh/zshrc ~/.zshrc

~/.zscripts : zsh/scripts
	@echo installing .zscripts...
	$(LN) $(PWD)/zsh/scripts ~/.zscripts

~/.gitignore : git/gitignore
	@echo installing .gitignore...
	$(LN) $(PWD)/git/gitignore ~/.gitignore

~/.gitconfig : git/gitconfig
	@echo installing .gitconfig...
	$(LN) $(PWD)/git/gitconfig ~/.gitconfig

~/bin/% : bin/%
	@echo installing $@...
	@mkdir -p ~/bin
	$(LN) $(PWD)/$< $@

~/.vimrc : vimrc
	@echo installing .vimrc...
	$(LN) $(PWD)/vimrc ~/.vimrc

~/.vim :
	@echo installing .vim...
	git submodule update --init
	$(LN) $(PWD)/vim ~/.vim

.PHONY : clean install build

