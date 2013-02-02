"======================================================================
" VIM CONFIGURATION FILE
"
" Version: 1.8.01 | 2013-02-02
" Author: Derek Ackley
" Twitter: @nykc77
" File Location: ~/.vimrc
"======================================================================

"-- Main / Behaviors --------------------------------------------------
set nocompatible
set background=dark

syntax on
filetype plugin indent on

"-- Files & Directories -----------------------------------------------
set nobackup            " do not make backups
set noswapfile          " noswapfile

"-- General & UI Settings ---------------------------------------------
colorscheme herald      " set colorscheme

"set cursorcolumn       " highlight the current column
"set cursorline         " highlight current line
set ff=unix             " set file format
set ls=2                " always show status line
set mouse=a             " use mouse everywhere
set noerrorbells        " don't make a noise
set number              " show line numbers
set ruler               " show current position along the bottom
set scrolloff=999       " keep cursor vertically centered
set showcmd             " show command being typed
set showmatch           " show matching brackets
set statusline=%F%m%r%h%w\[FORMAT=%{&ff}]\[TYPE=%Y]\[ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\[LEN=%L]
set title
set viminfo='20,\"100,:20,%,n~/.viminfo"

"-- Searching ---------------------------------------------------------
set ignorecase          " case insensitive searching by default
set incsearch           " search as I type
set nohlsearch          " highlight search results
set smartcase           " case insensitive if I use capital letter
set wrapscan            " wrap around file when searching

"-- Text Formatting & Layout Settings ---------------------------------
set autoindent
set expandtab           " use spaces instead of tabs
set nocindent
set nowrap              " do not wrap line
set shiftround          " round indent to multiple of 'shiftwidth'
set shiftwidth=2        " match shifting to indenting
set smartindent
set softtabstop=2       " indent two spaces by default
" set spell              " turn on spell check
set spellsuggest=5      " limit spell suggest to top 5 words
set tabstop=2

"-- Wildmenu ----------------------------------------------------------
set wildmenu
set wildignore=*.dll,*.o.*.obj,*.bak,*.exe,*.pyc,\*.jpg,*.gif,*.png

"======================================================================
" HIGHLIGHTING                                                      {{{
"======================================================================
set list listchars=trail:_
:highlight SpecialKey ctermfg=darkgrey ctermbg=yellow

" get rid of bracket highlighting
  let g:loaded_matchparen = 1

"======================================================================
" MAPPINGS
"
" \l: toggle set list
" \md: markdown to html
" \mds: markdown to html and save as .html
" \rw: remove trailing whitespace
" \ww: toggle wrap
" <F4>: toggle spell check
" <F6>: toggle no linenumbers
" <C-N>: toggle hlsearch
"
"======================================================================
nmap <leader>l :set list!<cr>
nmap <leader>md :%! /usr/bin/markdown --html4tags <cr>
nmap <leader>mds :%! /usr/bin/markdown --html4tags <cr>:saveas %:r.html<cr>
nmap <leader>rw :%s/\s\+$//e
nmap <leader>ww :set wrap!<cr>

map <F4> :setlocal spell! spelllang=en_us<cr>
map <F6> :setlocal nonumber!<cr>
map <silent> <C-N> :se invhlsearch<cr>

"======================================================================
" TEMPLATES                                                         {{{
"======================================================================
autocmd! BufNewFile * silent! or ~/.vim/templates/%:e.tpl

" create a file in ftplugin/text.vim for specific settings
autocmd BufNewFile, BufRead *.text,*.txt set ft=text

"======================================================================
" PYTHON SPECIFIC SETTINGS                                          {{{
"======================================================================
autocmd BufRead, BufNewFile *.py syntax on
autocmd BufRead, BufNewFile *.py set ai
autocmd BufRead, BufNewFile *.py set foldmethod=indent
autocmd BufRead, BufNewFile *.py set syntax=python
autocmd BufRead, BufNewFile *.py set smartindent
autocmd BufRead, BufNewFile *.py cinwords=class,def,elif,else,except,finally,for,if,try,while
