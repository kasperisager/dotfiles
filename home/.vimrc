""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_completion_enabled = 1

call plug#begin()

Plug '/usr/local/opt/fzf'
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'morhetz/gruvbox'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'
Plug 'zhimsel/vim-stay'

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
set mouse=a                       " Enable mouse support
set undofile                      " Enable persistent undo
set viewoptions=cursor,folds,slash,unix

set backupdir=~/.vim/backups//    " Centralize backups, swaps, views, and undo history
set directory=~/.vim/swaps//
set undodir=~/.vim/undo//
set viewdir=~/.vim/views//

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

" Avoid premature completion bug in ALE:
" https://github.com/w0rp/ale/blob/cfffdab856ebe569c514f4bdfca62683625dd4a0/doc/ale.txt#L350-L356
set completeopt=menu,menuone,preview,noselect,noinsert

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ListFiles(path)
  let selectionPath = tempname()
  let currentPath = expand(a:path)

  silent exec '!lf -selection-path=' . shellescape(selectionPath) . ' ' . shellescape(currentPath)

  if filereadable(selectionPath)
    for file in readfile(selectionPath)
      exec 'edit ' . file
    endfor

    call delete(selectionPath)
  endif

  redraw!

  filetype detect
endfun

command! ListFiles call ListFiles("%:p")

augroup ReplaceNetrw
  autocmd VimEnter * silent! autocmd! FileExplorer
augroup END

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

" Browse files
nmap <Leader>f :ListFiles<CR>

" Search files
nmap <Leader>s :Rg<CR>

" Go to definition
nmap <Leader>gd :ALEGoToDefinition<CR>

" Show contextual help
nmap <Leader>h :ALEHover<CR>
