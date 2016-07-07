# Installs extensions and compiles things that need compiling.
#
#
help:
	@echo "init    - Init .vimrc & Vundle."
	@echo "install - Vundle install plugins."
	@echo "update  - Vundle update plugins."

init:
	ln -sf ~/.vim/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

install:
	vim +PluginInstall +PluginClean! +qall

update:
	vim +PluginUpdate +qall
