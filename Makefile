# Installs extensions and compiles things that need compiling.
#
#
help:
	@echo "init    - Init .vimrc"
	@echo "install - Install plugins."
	@echo "update  - Update plugins."

init:
	ln -sf ~/.vim/vimrc ~/.vimrc

install:
	vim +PlugInstall +PlugClean! +qall

update:
	vim +PlugUpdate +qall
