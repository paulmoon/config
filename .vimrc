" Enable modern Vim features not compatible with Vi spec.
set nocompatible
filetype off

syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vimwiki/vimwiki'

:let mapleader = "\\"

:nnoremap <leader>pi :PluginInstall<CR>

" Highlight search matches as you type
set incsearch
" Make searches insensitive EXCEPT when there's at least one uppercase character
set ignorecase
set smartcase

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

set autoread

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

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
set tw=100

" Quick exit
:inoremap jk <ESC>

" Switching panes made easier
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy and paste selection into system clipboard
:vnoremap <F5> "+y
:vnoremap <F6> "+p
" Plug-ins specific shortcuts
nmap <F8> :TagbarToggle<CR>

" Enter to insert a new line in Normal mode
:nnoremap <Enter> O<Esc>

" Set spacebar to insert a space in normal mode
:nnoremap <space> i<space><esc>

filetype plugin indent on

" Quick-saving with Ctrl-S
:nnoremap <C-S> :w<cr>

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>eb :vsplit ~/.bashrc<cr>
:nnoremap <leader>d "_d
 
map <ESC>[1;5D <C-Left>
map <ESC>[1;5A <C-Up>
map <ESC>[1;5C <C-Right>
map <ESC>[1;5B <C-Down>

" Solorized dark
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark="medium"
set t_Co=256

set undofile
" set a directory to store the undo history
set undodir=~/.vimundo/

" NERDTree
let g:NERDTreeWinSize=50

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
let g:vimwiki_list = [{'path': '~/vimwiki/index/',
      \ 'syntax': 'markdown', 'ext': '.md'}]
for wiki_name in wikis
  let wiki=copy(wiki_settings)
  let wiki.path = vimwiki_path.wiki_name.'/'
  let wiki.path_html = vimwiki_export_path.wiki_name.'/'
  let wiki.diary_index = 'index'
  let wiki.diary_rel_path = 'diary/'
  call add(g:vimwiki_list, wiki)
endfor

call vundle#end()
