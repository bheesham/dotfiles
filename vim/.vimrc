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
set hidden

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
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'hashivim/vim-terraform'

Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'

Plug 'editorconfig/editorconfig-vim'
Plug 'derekwyatt/vim-scala'
Plug 'jceb/vim-orgmode'
Plug 'lvht/tagbar-markdown'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'

" Plug 'racer-rust/vim-racer'

if has('gui_running')
  Plug 'jonathanfilip/vim-lucius'
endif

call plug#end()

let g:ale_hover_cursor = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let b:ale_linters = ['pylint', 'analyzer']
let b:ale_fixers = ['black', 'rustfmt']

let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1

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
command InsDate :exe 'norm i' . system('date --iso-8601=seconds')
nmap <C-k> :InsDate<CR>

let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 0

"if filereadable("/Users/bheesham/.cargo/bin/racer")
"    let g:racer_cmd = "/Users/bheesham/.cargo/bin/racer"
"else
"    let g:racer_cmd = "/home/bheesham/.cargo/bin/racer"
"endif
"let g:racer_experimental_completer = 1
"let g:rustfmt_autosave = 1
