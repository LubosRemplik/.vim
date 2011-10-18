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
set encoding=utf-8

set background=dark

syntax on
filetype plugin on
au BufNewFile,BufRead *.ctp set filetype=php
au FileType php set omnifunc=phpcomplete#CompletePHP

" Nerdtree configuration
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror
" autocmd VimEnter * wincmd w
map <F2> :NERDTreeToggle<CR>

" Taglist copen=1
let Tlist_Use_Right_Window=1
let Tlist_GainFocus_On_ToggleOpen = 1
map <F3> :TlistToggle<CR>

" Clear search highlighting
map <Leader><Space> :nohl<CR>

" SuperTab configuraion
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

imap jj <Esc>

" CtrlP configuration
let g:ctrlp_working_path_mode = 2
let g:ctrlp_root_markers = ['tags']
let g:ctrlp_match_window_reversed = 0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,tags
