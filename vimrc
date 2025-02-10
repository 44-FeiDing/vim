vim9script

# Options

syntax on
set nu
set ruler
set nocompatible
set autowrite
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
set relativenumber
set encoding=utf-8
set mouse=a
set backspace=indent,eol,start
set completeopt-=preview
set guifont=FiraCode\ Nerd\ Font\ 12
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
set ambiwidth=double
set t_Co=256
set ignorecase
set smartcase
set clipboard=unnamedplus
set scrolloff=3
set background=dark
colorscheme breezy
var mapleader = ","



# Keymaps
inoremap jk <Esc>
nnoremap <leader>t :belowright terminal<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


# Rainbow
g:rainbow_active = 1


# Airline
g:airline_theme = 'breezy'
g:airline_powerline_fonts = 1
