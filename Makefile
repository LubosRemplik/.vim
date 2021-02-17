# Installs extensions and compiles things that need compiling.
#
#
help:
	@echo "init    - Init .vimrc"
	@echo "install - Install plugins."
	@echo "update  - Update plugins."

init:
	ln -sf ~/.vim/vimrc ~/.vimrc
	curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
	sudo apt-get install -y nodejs silversearcher-ag exuberant-ctags
	sudo npm install --global intelephense
	sudo npm install --global yarn
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb && sudo dpkg -i ripgrep_12.1.1_amd64.deb && rm ripgrep_12.1.1_amd64.deb
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

install:
	vim +PlugInstall +PlugClean! +qall

update:
	vim +PlugUpdate +qall
