" Pathogen: Manage 'runtimepath' with ease.
execute pathogen#infect()
filetype plugin indent on
:filetype plugin on

set incsearch
set ignorecase
set smartcase

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set cul                                           
hi CursorLine term=none cterm=none ctermbg=238

" Set spacebar to insert a space in normal mode
:nnoremap <space> i<space><esc>

" Switching panes made easier
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
