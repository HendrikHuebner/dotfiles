syntax on

set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set visualbell
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set encoding=utf-8
set expandtab
set shiftwidth=4
set tabstop=4

let mapleader = ","

call plug#begin('~/.local/share/nvim/plugged')

" Multi-cursor support
Plug 'terryma/vim-multiple-cursors'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Git plugin
Plug 'tpope/vim-fugitive'

" Telescope for fuzzy finding and more
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Status bar
Plug 'bling/vim-airline'

" Unix util functions
Plug 'tpope/vim-eunuch'

" Initialize plugin system
call plug#end()

" Theme
syntax enable
colorscheme gruvbox

" Enable multi-cursor mappings
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'

" remaps

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>

" Map Ctrl+A to select the entire file in normal mode
nnoremap <C-A> ggVG
nnoremap <C-S> :w

command! W w
command! Q q
command! Wq wq

" Hex edit
command Hex %!xxd
command UnHex %!xxd -r

" Move line with Alt+(arrow/kj)
nnoremap <A-Up> :m-2<CR>==
inoremap <A-Up> <Esc>:m-2<CR>==gi
nnoremap <A-Down> :m+<CR>==
inoremap <A-Down> <Esc>:m+<CR>==gi

nnoremap <A-k> :m-2<CR>==
nnoremap <A-j> :m+<CR>==


set undofile
set backup

" undo dir
if !isdirectory($HOME . '/.local/share/nvim/undo')
  call mkdir($HOME . '/.local/share/nvim/undo', 'p')
endif
set undodir=~/.local/share/nvim/undo

" swap dir
if !isdirectory($HOME . '/.local/share/nvim/swap')
  call mkdir($HOME . '/.local/share/nvim/swap', 'p')
endif

set directory=~/.local/share/nvim/swap//

" backup dir
if !isdirectory($HOME . '/.local/share/nvim/backup')
  call mkdir($HOME . '/.local/share/nvim/backup', 'p')
endif
set backupdir=~/.local/share/nvim/backup

