set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
" set ofu=syntaxcomplete#Complete

set guifont=Source\ Code\ Pro "make sure to escape the spaces in the name properly

set linespace=1
set showtabline=2

set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).


set number                " show line numbers
set numberwidth=4         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
" set visualbell
 

set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

" stop vim form creating automatic backups
set noswapfile
set nobackup
set nowb

"spell check 
set spell
set spelllang=en


call plug#begin('~/dotfiles/vim/plugged')


" auto close brackets/quotes
Plug 'Raimondi/delimitMate' 
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
" git status in gutter
Plug 'airblade/vim-gitgutter'

" visual indent guid 
Plug 'nathanaelkane/vim-indent-guides'


" file tree and git status
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" fuzzy file finder 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'


"html 
Plug 'mattn/emmet-vim'
" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" better JSON
Plug 'elzr/vim-json'

" color schemes 
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jonathanfilip/vim-lucius'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

set background=light
colorscheme PaperColor 

"let g:gruvbox_contrast_dark='hard'
" air-line """"""""""""""""""""""""
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif


let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"""""""""""""""""""""""""""""""""""""""""
if has('unix')
 let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'
endif

:imap jk <Esc>
:imap <C-l> <End>
" Use space to find next space in line
noremap  <Space> f<Space>

command NT NERDTree
