""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

set rtp+=/usr/local/opt/fzf

set completeopt=menu,menuone,preview,noselect,noinsert

let g:ackprg = "rg --vimgrep --no-heading"

let g:dracula_italic = 0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'

Plug 'dracula/vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'w0rp/ale'

Plug 'leafgarland/typescript-vim'
Plug 'cespare/vim-toml'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime plugin/sensible.vim       " Load sensible defaults

set showcmd                       " Show commands as they're entered

set ignorecase                    " Ignore case when searching
set smartcase                     " When searching try to be smart about cases

set clipboard=unnamed,unnamedplus " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set ttyfast                       " Optimize for fast terminal connections
set gdefault                      " Add the g flag to search/replace by default
set updatetime=100                " Faster update time (things like gitgutter)

set shell=/usr/local/bin/zsh      " Use zsh as the default shell in Vim

set backupdir=~/.vim/backups      " Centralize backups, swapfiles and undo history
set directory=~/.vim/swaps
set undodir=~/.vim/undo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color and font settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme onehalfdark

set list

set colorcolumn=80,120
set cursorline

set noruler
set laststatus=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showmatch                     " Show matching braces when over one
set number                        " Enable line numbers
set nostartofline                 " Don't reset cursor to start of line when moving around.
set shortmess=atI                 " Don't show the intro message when starting Vim
set title                         " Show the filename in the window titlebar
set linebreak                     " Wrap lines at word boundaries
set hidden                        " Enable hidden buffers
set number relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! LF(path)
  let tempPath = tempname()
  let currentPath = expand(a:path)

  if isdirectory(currentPath)
    silent exec '!lf -selection-path=' . shellescape(tempPath) . ' "' . currentPath . '"'
  else
    silent exec '!lf -selection-path=' . shellescape(tempPath)
  endif

  if filereadable(tempPath)
    for file in readfile(tempPath)
      exec 'edit ' . file
    endfor

    call delete(tempPath)
  endif

  redraw!

  filetype detect
endfun

command! LF call LF("%:p:h")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autogroups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap k gk
nnoremap j gj

" Pane navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Common commands
nmap <Leader>w :w<CR>

" Show the list of open buffers
nmap ; :Buffers<CR>

" Open a file
nmap <Leader>t :Files<CR>

" Search through files
nmap <Leader>a :Ack!<Space>

" Browse files
nmap <Leader>f :LF<CR>

" Unload currently open buffer
nmap <Leader>d :bd<CR>

" Go to definition
nmap <Leader>gd :ALEGoToDefinition<CR>

nmap <Leader>h :ALEHover<CR>
