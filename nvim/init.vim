call plug#begin('~/.config/nvim/plugged')
Plug 'EdenEast/nightfox.nvim'
Plug 'tpope/vim-commentary'
Plug 'aklt/plantuml-syntax'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'pearofducks/ansible-vim'
call plug#end()

" Reload init.vim & install plugins
au FileType vim noremap <F12> :source ~/.config/nvim/init.vim <bar> :PlugInstall<CR>

syntax on
set noerrorbells
set nocompatible
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
"set cursorline
set clipboard=unnamedplus
set textwidth=120
set colorcolumn=-2

" Leader key <space>
let mapleader = " "

" Colorscheme
set background=dark
colorscheme nightfox
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

" Resize & switch between splits
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Ansible playbooks synatx highlighting
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
