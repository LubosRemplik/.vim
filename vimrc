" {{{ Vundle and basic settings

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-airline/vim-airline'
Plugin 'einars/js-beautify'
Plugin 'joonty/vim-phpqa.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion.git'
Plugin 'majutsushi/tagbar'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'rking/ag.vim.git'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-surround.git'
Plugin 'elzr/vim-json.git'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

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
 set autochdir
 set tags=tags;

" }}}

" {{{ Colors

set background=dark
set t_Co=256
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" }}}

" {{{ Plugins config

" NeoComplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_close_preview = 1
"if !exists('g:neocomplete#force_omni_input_patterns')
  "let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:neocomplete#force_omni_input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
set completeopt=longest,menuone

" CtrlP configuration
let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40

" PHP QA
let g:phpqa_messdetector_autorun = 0

" PHP Code Sniffer binary
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codesniffer_args = "--standard=CakePHP"
let g:phpqa_codesniffer_cmd = '/home/lubos/.composer/vendor/bin/phpcs'

" PDV settings
let g:pdv_template_dir = "/home/lubos/.vim/pdv-templates"

" }}}

" {{{ Filetypes

" Cakephp ctp as php file
au BufNewFile,BufRead *.ctp set filetype=php

" make uses real tabs
au FileType make setl noexpandtab

" Make ruby,scss,sass use 2 spaces for indentation.
au FileType {yaml,sass,scss,ruby,eruby} setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" php settings
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120

" Javascript settings
au FileType javascript setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=120

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
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

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
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" }}}
