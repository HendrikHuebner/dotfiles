syntax on
colorscheme gruvbox
set modelines=0
set number
set encoding=utf-8
set wrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set copyindent
set expandtab
set noshiftround

set hlsearch
set incsearch
set showmatch
set smartcase

set hidden
set ttyfast
set laststatus=2

set showcmd
set background=dark
set backspace=indent,eol,start 

set mouse=a
set undofile
set clipboard=unnamedplus

vmap <Tab> >gv
vmap <S-Tab> <gv

command WQ wq
command Wq wq
command W w
command Q q

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" move cursor to end of previous line when pressing left
inoremap <expr> <Left> col('.') == 1 ? "\<Esc>k$" : "\<Left>"

" Open NERDTree
nnoremap <silent> <leader>nto :NERDTreeToggle<CR>

" Close NERDTree
nnoremap <silent> <leader>ntc :NERDTreeClose<CR>

let g:indentLine_color_term = 239

" LSP


let g:ale_linters = {'python': ['pylsp', 'flake8']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 0

let g:ycm_extra_conf_globlist = ['~/.dotfiles','!~/*']

