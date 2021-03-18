set nocompatible
filetype plugin on
set path+=**
set wildmenu
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set bg=dark
autocmd CompleteDone * if !pumvisible() | pclose | endif
set belloff+=ctrlg " if vim beeps during autocompletion
set completeopt-=menu
set completeopt+=menuone
set completeopt-=noselect
set completeopt+=preview
set completeopt-=longest
set completeopt+=noinsert
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set splitbelow splitright

call plug#begin('~/.vim/plugged')
Plug 'KKPMW/vim-sendtowindow'  				" send commands to REPL
Plug 'yuttie/comfortable-motion.vim'			" scrolling 'C-d' or `C-u'
Plug 'ncm2/ncm2' 					" completion [dep]: nvim-0.2.2, nvim-yarp, python3
Plug 'roxma/nvim-yarp' 					" remote plugin framework required fro ncm2
Plug 'ncm2/ncm2-bufword' 				" complete words in buffer
Plug 'ncm2/ncm2-path'  					"complete paths
Plug 'ncm2/ncm2-jedi' 					"Python completion
Plug 'dense-analysis/ale' 				"linting [dep] pip install flake8
Plug 'fisadev/vim-isort' 				"Python sort imports [dep]: pip install isort
Plug 'mhinz/vim-startify' 				" A start menu fot vim
Plug 'filipekiss/ncm2-look.vim' 			" ncm2 spelling
Plug 'easymotion/vim-easymotion'			" go to any word quickly '\\w', '\\e', '\\b'
Plug 'scrooloose/nerdtree'				" side bar file tree
Plug 'tmhedberg/SimpylFold'				" Code folding (zo: open, zc: close)
Plug 'tpope/vim-fugitive'				" allows git commands in vim session
Plug 'SirVer/ultisnips'					" hotkeys for chunks of code
Plug 'puremourning/vimspector'				" vim debugger
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'wikitopian/hardmode'
Plug 'gilgigilgil/anderson.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'klen/python-mode'
Plug 'fs111/pydoc.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'rudrab/vimf90'
Plug 'honza/vim-snippets'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" ncm2-loom
let g:ncm2_look_enabled = 0

"startify
let g:startify_lists = [
  \ {'type':'sessions', 'header': ['	Sessions']	},
  \ {'type':'files', 'header': ['	Recents']	},
  \ {'type':'commands', 'header': ['	Commands']	},
  \ ]

" vim-isort
let g:vim_isort_map = '<C-i>'

" Ale linting
let g:ale_sign_columns_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linter={'python':['flake8']}
let g:ale_fixers={'python':['black']}

" lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \ 	'left': [ [ 'mode', 'paste' ],
  \ 		  ['gitbranch', 'readonly', 'filename', 'modified' ]]
  \ },
  \ 'component_function': {
  \ 	'gitbranch': 'FugitiveHead'
  \ },
  \ }

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer() 		"enable ncm2 for all buffers
set completeopt=noinsert,menuone,noselect
let g:python3_host_prog='/home/lmuro/miniconda3/bin/python3'  	" ncm2 jedi

" gitgutter
let g:gitgutter_async=0

" set leader keys
let mapleader=" "
let fortran_leader="`"

" nerdtree settings
let NERDTreeQuitOnOpen=1
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']		" ignore pyc files

let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1

" Crtl-p to navigate project files
let g:ctrlp_map='<C-p>'

" Theme settings
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
set termguicolors
syntax on

" Kite settings
let g:kite_auto_complete=1
let g:kite_tab_complete=1


" Activate for use in Linux 
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" Mac remapping for alt-j and alt-i
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" Window split
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusting split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or viceversa
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" Start terminals for Python session '\tp'
map <Leader>tp :new term://zsh<CR>ipython3<CR><C-\><C-n><C-w>k
map <Leader>tj :new term://zsh<CR>ijulia<CR><C-\><C-n><C-w>k

" General settings
set updatetime=100		" set update time for gitgutter update
set noswapfile			" no swap
" tabs and spaces
set expandtab			" use spaces instead of tabs
set smarttab			" use shiftwidth and tabstap to insert blanks when <Tab>
set shiftwidth=2		" One tab == four spaces
set tabstop=2			" One tab == four spaces.<Paste>
" remap
:imap jk <Esc>
:imap kj <Esc>
" python alias
nmap ,p :w<CR>:!python3 %<CR>
nmap ,t :w<CR>:!time python3 %<CR>

" debugger
let g:vimspector_enable_mappings = 'HUMAN'
nmap <Leader>dd :call vimspector#Launch()<CR>
nmap <Leader>dx :VimspectorReset<CR>
nmap <Leader>de :VimspectorEval
nmap <Leader>dw :VimspectorWatch
nmap <Leader>do :VimspectorShowOutput

