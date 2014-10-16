execute pathogen#infect()

syntax on
filetype plugin indent on
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nocompatible
set modelines=0
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" set undofile
let mapleader = ","
nnoremap / /\v
vnoremap / /\v
" set relativenumber
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
"stuff to do with wrapping lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set cursorline
"disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
noremap <up> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
"for idiots like me who regularly hit F1 instead of Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"again, for butterfingers
nnoremap ; :
au FocusLost * :wa
"useful Esc remap
inoremap jj <ESC>
"opening and closing splits
nnoremap <leader>w <C-w>v<C-w>1
nnoremap <leader>q <C-w>q
"movement between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>w <C-w>v<C-w>l
"shortcut to edit vimrc - super useful
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
autocmd StdinReadPre * let s:std_in=1

