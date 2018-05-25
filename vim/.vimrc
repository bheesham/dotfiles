set nocompatible
filetype plugin indent on
syntax on

set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shiftround
set ignorecase
set smartcase
set incsearch
set hlsearch
set ttyfast
set lazyredraw
set splitbelow
set splitright
set cursorline
set wrapscan
set report=0
set relativenumber
set nu
set clipboard=unnamed
set nobackup
set swapfile
set dir=~/tmp

au FocusGained,BufEnter * :checktime

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
Plug 'tpope/vim-surround'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode'
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'

call plug#end()

let g:ctrlp_working_path_mode = 'ra'
if executable('rg')
    let g:ctrlp_user_command = 'rg --files -g "" --color never %s'
    let g:ctrlp_use_caching = 0
endif

map <C-f> :NERDTreeToggle<CR>
map <C-s> :TagbarToggle<CR>

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1

set hidden
if filereadable("/Users/bheesham/.cargo/bin/racer")
    let g:racer_cmd = "/Users/bheesham/.cargo/bin/racer"
else
    let g:racer_cmd = "/home/bheesham/.cargo/bin/racer"
endif

let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
