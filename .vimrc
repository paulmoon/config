" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Enable syntax highlighting
syntax on

" Pathogen: Manage 'runtimepath' with ease.
execute pathogen#infect()

" Highlight search matches as you type
set incsearch
" Make searches insensitive EXCEPT when there's at least one uppercase character
set ignorecase
set smartcase

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

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

" Switching panes made easier
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy and paste selection into system clipboard
:vnoremap <F5> "+y
:vnoremap <F6> "+p
" Pathogen plug-ins specific shortcuts
nmap <F8> :TagbarToggle<CR>

" Enter to insert a new line in Normal mode
:nnoremap <Enter> O<Esc>

" Set spacebar to insert a space in normal mode
:nnoremap <space> i<space><esc>

" Quick exit
:inoremap jk <ESC>

filetype plugin indent on

" Quick-saving with Ctrl-S
:nnoremap <C-S> :w<cr>

" Pretty Vim Wiki
let vimwiki_path='$HOME/vimwiki/'
let vimwiki_export_path='$HOME/vimwiki_html/'
let wiki_settings={
      \ 'template_path': vimwiki_export_path.'vimwiki-assets/',
      \ 'template_default': 'default',
      \ 'template_ext': '.html',
      \ 'auto_export': 0,
      \ 'nested_syntaxes': {
        \ 'js':'javascript'
      \ }}
" more langs...

" Vim Wiki
let wikis=["index"]
let g:vimwiki_list = []
for wiki_name in wikis
  let wiki=copy(wiki_settings)
  let wiki.path = vimwiki_path.wiki_name.'/'
  let wiki.path_html = vimwiki_export_path.wiki_name.'/'
  let wiki.diary_index = 'index'
  let wiki.diary_rel_path = 'diary/'
  call add(g:vimwiki_list, wiki)
endfor

