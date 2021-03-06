set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
" set ofu=syntaxcomplete#Complete
let mapleader = ' '
set guifont=Operator\ Mono\ Book\ 11 "make sure to escape the spaces in the name properly

" wrap text in preview window
autocmd BufEnter * if &previewwindow | setl wrap linebreak nolist | endif

set linespace=1
set showtabline=2

set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).

set textwidth=100
set colorcolumn=+1
set mouse=a
set ttyfast
set lazyredraw
set clipboard=unnamed

au BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.md set filetype=markdown

set number                " show line numbers
set numberwidth=2         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set mat=2                 " how many 10ths of a second to blink matching bracket
"set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
" set visualbell

set splitbelow            " opens new splits at bottom
set autoindent            " auto-indent
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

" Ignore compiled files
set wildignore+=*/tmp/*,*.swp,*.zip,*.gif,*.jpg,*.png,*.sketch,*.psd,.git/*
set wildignore+=*.DS_Store,.tmp/*,.log/*,lib/*,node_modules/*,vendor/*

"spell check
"set spell
"set spelllang=en


call plug#begin('~/dotfiles/vim/plugged')

Plug 'ternjs/tern_for_vim'
Plug 'Shougo/neocomplete.vim'
" Declare a few things we'll use later
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" Disable AutoComplPop - Neocomplete needs this to work right
let g:acp_enableAtStartup = 0

" Enable/Disable by default
let g:neocomplete#enable_at_startup = 0

" Smart case  
let g:neocomplete#enable_smart_case = 1

" Auto close the preview window after making selection
let g:neocomplete#enable_auto_close_preview = 1

" Set minimum keyword length for completion to be included
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Set minimum input length before neocomplete popup appears
let g:neocomplete#auto_completion_start_length = 3

" JS dictionary
let g:neocomplete#force_omni_input_patterns.javascript   = '[^. \t]\.\w*'
"let g:neocomplete#sources#omni#input_patterns.javascript = '\h\w*\|[^. \t]\.\w*'

" Maps to use up/down to navigate (didnt end up liking)
" inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr><Up> pumvisible() ? "\<Up>" : "\<Up>"

" Map to use <tab> to navigate
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Map to toggle on/off
map <Leader>neo <ESC>:NeoCompleteToggle<CR>

" Define omni completes per filetype
aug omnicomplete
  au!
  au FileType css setl omnifunc=csscomplete#CompleteCSS
  au FileType markdown setl omnifunc=htmlcomplete#CompleteTags
  au FileType html,htmldjango,jinja setl omnifunc=emmet#completeTag
  au FileType javascript setl omnifunc=tern#Complete
  au FileType python setl omnifunc=pythoncomplete#Complete
  au FileType xml setl omnifunc=xmlcomplete#CompleteTags
aug END

" auto close brackets/quotes
Plug 'Raimondi/delimitMate'
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
" git status in gutter
Plug 'airblade/vim-gitgutter'

" visual indent guid
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0

" file tree and git status
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"let g:airline_section_y = ''
"let g:airline_powerline_fonts = 1
Plug 'itchyny/lightline.vim'
" add modified status to lightline 
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-fugitive'

" fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"html
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" better JSON
Plug 'elzr/vim-json'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jonathanfilip/vim-lucius'
Plug 'NLKNguyen/papercolor-theme'





call plug#end()



 set background=dark
"colorscheme PaperColor
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'


if has('unix') && !has('mac')
 let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'
endif

"if has('mac')
""  let g:fzf_launcher = 'in_new_term_function %s'
"endif

"NerdTree remaps
"command NT NERDTree
nmap <leader>nt :NERDTreeToggle <Enter>

"easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"ctrl p to :FZF for file search
nnoremap <C-p> :FZF <Enter>

:imap jk <Esc>
:imap <C-l> <End>
" Use space to find next space in line
"noremap  <Space> f<Space>



"some settings to get hightlighting
set t_ZH=[3m
set t_ZR=[23m
highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight Type cterm=italic

" The default highlighting.
hi link xmlTodo		Todo
hi link xmlTag		Function
hi link xmlTagName		Function
hi link xmlEndTag		Identifier
if !exists("g:xml_namespace_transparent")
    hi link xmlNamespace	Tag
endif
hi link xmlEntity		Statement
hi link xmlEntityPunct	Type

hi link xmlAttribPunct	Comment
hi link xmlAttrib		Type

hi link xmlString		String
hi link xmlComment		Comment
hi link xmlCommentStart	xmlComment
hi link xmlCommentPart	Comment
hi link xmlCommentError	Error
hi link xmlError		Error

hi link xmlProcessingDelim	Comment
hi link xmlProcessing	Type

hi link xmlCdata		String
hi link xmlCdataCdata	Statement
hi link xmlCdataStart	Type
hi link xmlCdataEnd		Type

hi link xmlDocTypeDecl	Function
hi link xmlDocTypeKeyword	Statement
hi link xmlInlineDTD	Function

"Function to create signify in lightline 
function! LightlineVCS()
  let symbols = ['+', '-', '~']
  let [added, modified, removed] = sy#repo#get_stats()
  let stats = [added, removed, modified]  " reorder
  let hunkline = ''

  for i in range(3)
    if stats[i] > 0
      let hunkline .= printf('%s%s ', symbols[i], stats[i])
    endif
  endfor

  if !empty(hunkline)
    let hunkline = printf(' [%s]', hunkline[:-2])
  endif

  return hunkline
endfunction

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

let g:lightline = {
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],['fugitive', 'vcs'], [ 'readonly', 'relativepath', 'modified' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'percent' ]]
      \   },
      \   'component_function': {
      \     'gitbranch': 'gitbranch#name',
      \     'vcs': 'LightlineVCS',
      \   'fugitive': 'LightlineFugitive'
      \    },
      \   'colorscheme': 'jellybeans',
      \ }
