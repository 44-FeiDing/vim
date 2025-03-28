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
    Plug 'tpope/vim-commentary'
    Plug 'luochen1990/rainbow'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
    Plug 'lambdalisue/vim-suda'
    Plug 'Yggdroot/indentLine'
    Plug 'github/copilot.vim'
    Plug 'puremourning/vimspector'
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
    \ 'coc-snippets',
    \ 'coc-git',
    \ 'coc-sh',
    \ 'coc-webview',
    \ 'coc-markdown-preview-enhanced'
  \ ]

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

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


" Copilot
inoremap <silent><script><expr> <A-y> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'vscode-bash-debug' ]
