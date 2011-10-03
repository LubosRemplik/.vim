call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set exrc
set history=1000
set backspace=2
set nojoinspaces
set ruler
set showcmd
set showmatch
set hlsearch
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set mouse=a
set number
set tags=tags

set background=dark

syntax on
filetype plugin on
au BufNewFile,BufRead *.ctp set filetype=php
au FileType php set omnifunc=phpcomplete#CompletePHP
