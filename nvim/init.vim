call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'
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
