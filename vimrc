" {{{ Vundle and basic settings

set nocompatible              " be iMproved, required
filetype off                  " required

" Vim Plug (vim-plug)
call plug#begin('~/.vim/plugged')

" Plugins
" Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline'
Plug 'einars/js-beautify'
Plug 'joonty/vim-phpqa'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'maksimr/vim-jsbeautify'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'shawncplus/phpcomplete.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'w0rp/ale'
Plug 'lumiliet/vim-twig'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} " color highlighting
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'} " color highlighting

" All of your Plugins must be added before the following line
call plug#end()

" {{{ Functions
function! NumberToggle()
    if(&relativenumber == 1)
        set nonumber
        set norelativenumber
    elseif(&relativenumber == 0 && &number == 0)
        set number
    elseif(&relativenumber == 0 && &number == 1)
        set relativenumber
    endif
endfunc
" }}}

" {{{ Window and editor setup

" Display line numbers and rulers.
set number
set relativenumber
set ruler
syntax on

" Set encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,latin1
set ff=unix

" Whitespace features
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noeol
set autoindent

" Enable formatting of comments, and one letter words.
" see :help fo-table
set formatoptions=qrc1

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Window settings
set wrap
set lbr
set textwidth=0

" Don't redraw when macros are executing.
set lazyredraw

" Use modeline overrides
set modeline
set modelines=10

" Status bar
set laststatus=2

" Use the system clipboard
set clipboard=unnamed

" No swap file, undofile
set noswapfile
set undofile
set undodir=~/.vim/undo

" Tab completion for filenames and other command line features.
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.pyc,node_modules/*

" ctags optimization
set tags=tags;

 " fix for slow vim, syntax
set synmaxcol=1000

" }}}

" {{{ Colors

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" {{{ Plugins config

" NeoComplete
"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#enable_auto_close_preview = 1
"if !exists('g:neocomplete#force_omni_input_patterns')
  "let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:neocomplete#force_omni_input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"set completeopt=longest,menuone

" PHP QA
let g:phpqa_messdetector_autorun = 0

" PHP Code Sniffer binary
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codesniffer_args = "--standard=CakePHP"
let g:phpqa_codesniffer_cmd = '/home/lubos/.composer/vendor/bin/phpcs'

" PDV settings
let g:pdv_template_dir = "/home/lubos/.vim/pdv-templates"

" FZF
set rtp+=~/.fzf
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

" Gutentags
"set statusline+=%{gutentags#statusline()}

" Auto Pairs
let g:AutoPairsShortcutToggle = '<p>'

" }}}

" {{{ Filetypes

" Cakephp ctp as php file
au BufNewFile,BufRead *.ctp set filetype=php

" make uses real tabs
au FileType make setl noexpandtab

" Make ruby,scss,sass use 2 spaces for indentation.
au FileType {yaml,sass,scss,ruby,eruby,less,css,javascript,json} setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" php settings
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

" Javascript settings
"au FileType javascript setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

"sparkup
augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType mustache,php,javascript,jsx runtime! ftplugin/html/sparkup.vim
augroup END

" }}}

" {{{ Mapping

let mapleader = ','

" jj as escape in insert mode
imap jj <Esc>

" OmniComplete
imap <C-@> <C-Space>
imap <C-Space> <C-x><C-o>
imap <C-j> <Down>
imap <C-k> <Up>

" NeoComplete
"imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"imap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Leader mapping
map <Leader>h :nohl<CR>
map <Leader>p :set paste!<BAR>:set paste?<CR>
map <Leader>n :call NumberToggle()<CR>
map <Leader>a <C-w><C-]><C-w>T

" NERDTree
map <Leader>t :NERDTreeToggle<CR>

" TagbarToggle
map <Leader>g :TagbarToggle<CR>

" Easy motion
map <Leader>s <Plug>(easymotion-s2)
map <Leader><Leader>s <Plug>(easymotion-sn)

" PHP QA
map <Leader>qf :%!phpcbf --standard=psr2<CR>

" PDV settings
map <Leader>d :call pdv#DocumentCurrentLine()<CR>

" Js Beauty
map <Leader>fj :call JsBeautify()<CR>
map <Leader>fc :call CSSBeautify()<CR>
map <Leader>fh :call HtmlBeautify()<CR>

" Tabs
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tn :tabnew<CR>
map tc :tabclose<CR>

" Git fugitive
map gs :Gstatus<CR>
map gd :Gdiff<CR>
map gw :Gwrite<CR>
map gr :Gread<CR>
map gl :Glog<CR>
map gb :Gblame<CR>
map gm :Gmove<CR>
map ge :Gedit<CR>
map gp :Gpush<CR>
map gf :Gfetch<CR>

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'php': ['php -l'],
\}

" }}}

" {{{ Autocommands
"
" Save on blur
au FocusLost * :wa

" Save on blur for terminal vim
au CursorHold,CursorHoldI * silent! wa

" PHP compplete
" Enable omni completion.
autocmd FileType css,less,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" SuperTab & omni completion
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" }}}
