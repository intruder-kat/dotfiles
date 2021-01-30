syntax on
colorscheme pablo
set showcmd
set showmatch
set ignorecase
set smartcase
set wrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set title
set autoread
set hidden

set listchars=tab:→→,trail:●,nbsp:○
set list

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set expandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4

set mouse=a

"ensure we actually have vim plug
let s:vim_plug = '~/.vim/autoload/plug.vim'
"if we dont have vimplug yet use this to disable erring first run sections
let s:first_run = 0
if empty(glob(s:vim_plug, 1))
    let s:first_run = 1
    execute 'silent !curl -fLo ~/.vim/autoload/plug.vim --create-dis https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

call plug#end()

"tab nav with ctrl
nnoremap <C-h> gT
nnoremap <C-l> gt


