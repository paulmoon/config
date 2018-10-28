" Enable modern Vim features not compatible with Vi spec.
set nocompatible

filetype off
syntax on

" -------------------- PLUGINS --------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Chiel92/vim-autoformat'
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

" -------------------- VIM BEHAVIOR --------------------

" Highlight search matches as you type
set incsearch
" Make searches insensitive EXCEPT when there's at least one uppercase character
set ignorecase
set smartcase

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" When a file has been detected to have been changed outside of Vim and it has not been changed
" inside of Vim, automatically read it again.
set autoread

" Minimal number of screen lines to keep above and below the cursor.
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" Strings to use in :list command
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

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2
" Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|, |>>|, |<<|, etc.
set shiftwidth=2
" Number of spaces that a <Tab> counts for while performing editing operations, like inserting a
" <Tab> or using <BS>.
set softtabstop=2
" In Insert mode: Use the appropriate number of spaces to insert a tab
set expandtab
" Copy indent from current line when starting a new line.
set autoindent
set textwidth=100

if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undo
endif

" -------------------- KEY MAPS --------------------

" Quick exit
inoremap jk <ESC>

" Switching panes made easier
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy and paste selection into system clipboard
vnoremap <F5> "+y
vnoremap <F6> "+p

" Enter to insert a new line in Normal mode
:nnoremap <Enter> O<Esc>

" Set spacebar to insert a space in normal mode
nnoremap <space> i<space><esc>

filetype plugin indent on

" Quick-saving with Ctrl-S
nnoremap <C-S> :w<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eb :vsplit ~/.bashrc<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>d "_d
nnoremap <leader>D "_D
nnoremap <leader>c "_c
nnoremap <leader>C "_C

" Select text under visual selection
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

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

" -------------------- LOOK AND FEEL --------------------
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark="medium"
set t_Co=256

call vundle#end()
