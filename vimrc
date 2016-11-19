set nocompatible
syntax on
set number
set linespace=1
set showtabline=2
set t_Co=256
colorscheme desert
set ruler

" show existing tab w/ 2 spaces
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" on pressing tab, insert 2 spaces
set expandtab


call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call plug#end()

:imap jk <Esc>
command NT NERDTree
