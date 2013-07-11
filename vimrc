"============================================================================
" VIM CONFIGURATION FILE
"
" Version: 1.9.01 | 2013-04-04
" Author: Derek Ackley
" Twitter: @nykc77
" File Location: ~/.vimrc
"============================================================================

"-- Main / Behaviours -------------------------------------------------------
set nocompatible
set background=dark

filetype plugin indent on

"-- Files & Directories -----------------------------------------------------
set nobackup            " do not make backups
set noswapfile          " no swapfile

"-- General & UI Settings ---------------------------------------------------
"colorscheme herald      " set the colorscheme
"set cursorcolumn       " highlights the current column
"set cursorline         " highlights the current line

set ff=unix             " set the file format
set ls=2                " always show the status line
set mouse=a             " use mouse everywhere
set noerrorbells        " don't make a noise
set number              " show line numbers by default
set ruler               " show current position along the bottom
set scrolloff=999       " keep the cursor vertically centered
set showcmd             " show command being typed
set showmode            " display mode (INSERT/REPLACE/etc.)
set title               " Display name of file being edited

set statusline=%F%m%r%h%w\[FORMAT=%{&ff}]\[TYPE=%Y]\[ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\[LEN=%L]
set viminfo='20,\"100,:20,%,n~/.viminfo"

"-- Searching ----------------------------------------------------------------
set ignorecase          " case insensitive searching by default
set incsearch           " show search matches while typing
set nohlsearch          " do not highlight search results
set smartcase           " case insensitive if using capital letter
set wrapscan            " wrap around file when searching

"-- Text Formatting & Layout Settings ----------------------------------------
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting
set expandtab           " use spaces instead of tabs
set nocindent           " turn off c indenting
set nowrap              " turn off line wrapping
set shiftwidth=2        " match shifting to indenting
set smartindent         " extra level of indentation in some cases
set smarttab            " insert tabs start of line according to shiftwidth
set softtabstop=2       " indent 2 spaces by default
"set spell              " turn on spellcheck
set spellsuggest=5      " limit spell suggest to top 5 words
set tabstop=2           " set tab to 2 spaces

"-- Wildmenu ------------------------------------------------------------------
set wildmenu            " make tab completion for files buffers act like bash
set wildmode=list:longest,full
set wildignore=*.dll,*.o*.obj,*.bak,*.exe,*.pyc,\*.jpg,*.gif,*.png

"=============================================================================
" HIGHLIGHTING {{{
"=============================================================================
syntax on

set list listchars=trail:_
:highlight SpecialKey ctermfg=darkgrey ctermbg=yellow

" remove bracket highlighting
  let g:loaded_matchparen = 1

"=============================================================================
" KEYMAPPINGS
"
" \l: toggle set list
" \md: markdown to html
" \mds: markdown to html and save as .html
" \rw: remove trailing whitespace
" \ww: toggle wrap
" <F4>: toggle spellcheck
" <F6>: toggle no linenumbers
" <C-N>: toggle hlsearch
"
"=============================================================================
nmap <leader>l :set list!<cr>
nmap <leader>md :%! /usr/bin/markdown --html4tags <cr>
nmap <leader>mds :%! /usr/bin/markdown --html4tags <cr>:saveas %:r.html<cr>
nmap <leader>rw :%s/\s\+$//e
nmap <leader>ww :set wrap!<cr>

map <F4> :setlocal spell! spelllang=en_us<cr>
map <F6> :setlocal nonumber!<cr>
map <silent> <C-N> :se invhlsearch<cr>

"=============================================================================
" TEMPLATES & CUSTOM VIM FILETYPE SETTINGS {{{
"=============================================================================
autocmd! BufNewFile * silent! or ~/.vim/templates/%:e.tpl

" create a file in ftplugin/text.vim for specific text settings
autocmd BufNewFile, BufRead *.text,*.txt set ft=text

"-- Python specific settings -------------------------------------------------
autocmd BufRead, BufNewFile *.py syntax on
autocmd BufRead, BufNewFile *.py set ai
autocmd BufRead, BufNewFile *.py set foldmethod=indent
autocmd BufRead, BufNewFile *.py set syntax=python
autocmd BufRead, BufNewFile *.py set smartindent
autocmd BufRead, BufNewFile *.py cinwords=class,def,elif,else,except,finally,for,if,try,while

