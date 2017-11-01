set nocompatible
filetype plugin indent on
syntax on
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround
set incsearch
set hlsearch
set ttyfast
set lazyredraw
set splitbelow
set splitright
set cursorline
set wrapscan
set report=0
set synmaxcol=80
set relativenumber
set clipboard=unnamed

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jpalardy/vim-slime'

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-sleuth'

call plug#end()

let g:ctrlp_working_path_mode = 'ra'
if executable('rg')
    let g:ctrlp_user_command = 'rg --files -g "" --color never %s'
    let g:ctrlp_use_caching = 0
endif

map <C-f> :NERDTreeToggle<CR>

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
