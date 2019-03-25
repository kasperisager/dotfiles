""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_completion_enabled = 1

let g:filebeagle_check_gitignore = 1
let g:filebeagle_show_hidden = 1

call plug#begin()

Plug '/usr/local/opt/fzf'
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'morhetz/gruvbox'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime plugin/sensible.vim       " Load sensible defaults

set encoding=utf-8
set showcmd                       " Show commands as they're entered
set ignorecase                    " Ignore case when searching
set smartcase                     " When searching try to be smart about cases
set gdefault                      " Add the g flag to search/replace by default
set clipboard=unnamed,unnamedplus " Use the OS clipboard by default

set backupdir=~/.vim/backups      " Centralize backups, swapfiles and undo history
set directory=~/.vim/swaps
set undodir=~/.vim/undo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color and font settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors
set list
set colorcolumn=80,120
set noruler
set laststatus=0

colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showmatch                     " Show matching braces when over one
set number                        " Enable line numbers
set nostartofline                 " Don't reset cursor to start of line when moving around
set shortmess=atI                 " Don't show the intro message when starting Vim
set title                         " Show the filename in the window titlebar
set linebreak                     " Wrap lines at word boundaries
set hidden                        " Enable hidden buffers

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easier navigation
nnoremap k gk
nnoremap j gj

" Pane navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Common commands
nmap <Leader>w :w<CR>
nmap <Leader>d :bd<CR>

" Show the list of open buffers
nmap ; :Buffers<CR>

" Open a file
nmap <Leader>t :Files<CR>

" Search files
nmap <Leader>s :Rg<CR>

" Go to definition
nmap <Leader>gd :ALEGoToDefinition<CR>

" Show contextual help
nmap <Leader>h :ALEHover<CR>
