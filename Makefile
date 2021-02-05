# Installs extensions and compiles things that need compiling.
#
#
help:
	@echo "init    - Init .vimrc"
	@echo "install - Install plugins."
	@echo "update  - Update plugins."

init:
	ln -sf ~/.vim/vimrc ~/.vimrc
	sudo npm i intelephense -g
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb && sudo dpkg -i ripgrep_12.1.1_amd64.deb
	sudo apt-get install silversearcher-ag

install:
	vim +PlugInstall +PlugClean! +qall

update:
	vim +PlugUpdate +qall
