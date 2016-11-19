
set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete



set linespace=1
set showtabline=2

set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).


set number                " show line numbers
set numberwidth=6         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set visualbell


set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text




call plug#begin('~/dotfiles/vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark




:imap jk <Esc>
command NT NERDTree
