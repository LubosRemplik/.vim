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
set smartindent
set tabstop=4
set mouse=a
set number

set background=dark

syntax on
filetype plugin on
au BufNewFile,BufRead *.ctp set filetype=php
au FileType php set omnifunc=phpcomplete#CompletePHP
