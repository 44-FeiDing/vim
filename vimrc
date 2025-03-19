" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'tomasr/molokai'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim/killersheep'
    Plug 'preservim/nerdcommenter'
    Plug 'luochen1990/rainbow'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
call plug#end()



" Options

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
set guifont=FiraCode\ Nerd\ Font\ Mono\ 10
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
set t_Co=256
set ignorecase
set smartcase
set clipboard=unnamedplus
set scrolloff=3
set background=dark
set hidden
set backup
set writebackup
set updatetime=100
set shortmess+=c
colorscheme molokai



" Keymaps
let g:mapleader = " "
let g:maplocalleader = " "
inoremap jk <Esc>
nnoremap <leader>t <CMD>belowright terminal<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-Up> <CMD>resize -2<CR>
nnoremap <C-Down> <CMD>resize +2<CR>
nnoremap <C-Left> <CMD>vertical resize -2<CR>
nnoremap <C-Right> <CMD>vertical resize +2<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>e <CMD>CocCommand explorer<CR>
nnoremap <ESC> <CMD>nohlsearch<CR>


" Rainbow
let g:rainbow_active = 1


" Airline
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1


" Coc
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-python',
    \ 'coc-explorer',
    \ 'coc-pairs',
    \ 'coc-clangd',
  \ ]

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `<leader>-` and `<leader>=` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
