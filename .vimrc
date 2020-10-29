set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'
Plug 'wikitopian/hardmode'
Plug 'gilgigilgil/anderson.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/seoul256.vim'

call plug#end()

let mapleader=" "
let NERDTreeQuitOnOpen=1
let g:SimplyFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1
let g:ctrlp_map='<C-p>'

colo seoul256 
syntax on

nmap <Leader>s <Plug>(easymotion-2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>



