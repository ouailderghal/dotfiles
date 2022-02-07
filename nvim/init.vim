call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-commentary'
call plug#end()

syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set cursorline
set clipboard=unnamedplus
set textwidth=120
set colorcolumn=-2

" Leader key <space>
let mapleader = " "

" Color scheme & transparent background
set background=dark
colorscheme gruvbox
" hi Normal guibg=NONE ctermbg=NONE

" Key remaps

"" Move & duplicate line
nnoremap <silent> <S-k> :m .-2<CR>==
nnoremap <silent> <S-j> :m .+1<CR>==
vnoremap <silent> <S-k> :m '<-2<CR>gv=gv
vnoremap <silent> <S-j> :m '>+1<CR>gv=gv
nnoremap <silent> <A-d> yypjk$

"" Comment a line
noremap <C-c> :Commentary<CR>

"" Spelling
nnoremap <leader>sen :set spell <bar> :set spelllang=en<CR>
nnoremap <leader>sfr :set spell <bar> :set spelllang=fr<CR>

" Switch between buffers
nnoremap <silent> <C-j> :bp<CR>
nnoremap <silent> <C-k> :bn<CR>
