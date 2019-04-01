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
set number
set relativenumber
set clipboard=unnamed
set nobackup
set swapfile
set dir=~/tmp//
set modeline
set encoding=utf-8
set fileencoding=utf-8

au FocusGained,BufEnter * :checktime
autocmd BufWritePre * :%s/\s\+$//e

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
Plug 'editorconfig/editorconfig-vim'

if has('gui_running')
  Plug 'jonathanfilip/vim-lucius'
endif

call plug#end()

if has('gui_running')
  colorscheme lucius
endif

let g:ctrlp_working_path_mode = 'ra'
if executable('fd')
    let g:ctrlp_user_command = 'fd --color never --full-path -E _accounts -E jenkins/backup %s'
    let g:ctrlp_use_caching = 1
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

command InsDate :exe 'norm i' . system('date --iso-8601=seconds')
nmap <C-g> :InsDate<CR>
