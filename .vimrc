" Automatic reload of .vimrc
autocmd! bufwritepost .vimrc source %

autocmd BufNewFile,BufRead *.yml set filetype=ansible
autocmd BufNewFile,BufRead *.yaml set filetype=ansible

let mapleader=","

" vundle extension manager
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe' vim 7.4
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Bundle 'chase/vim-ansible-yaml'



call vundle#end()
filetype plugin indent on

" airline etc.
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1

" Keep selection after indention
vnoremap < <gv
vnoremap > >gv

set nu              " show line numbers
set wrapmargin=0    " don't wrap on type
set nowrap          " don't wrap on load
set fo-=t           " don't wrap on type

set nobackup    " no backup files
set nowritebackup
set noswapfile
let loaded_matchparen = 1 

set nocompatible " be iMproved

let python_highlight_all=1
syntax on
set t_Co=256
colorscheme 256-jungle

set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4

set enc=utf-8

" Python

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so|dll)$'
  \ }
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

au BufNewFile,BufRead *.py
    \ set tabstop=4 | 
    \ set softtabstop=4 | 
    \ set shiftwidth=4 | 
    \ set textwidth=79 | 
    \ set expandtab | 
    \ set wrapmargin=0 |
    \ set nowrap |
    \ set fo-=t |
    \ set autoindent | 
    \ set fileformat=unix | 

" Don't show .pyc and .swp files in the file explorer
let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
let g:explDetailedHelp=0

" YouCompleteMe

"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" Macro to remove Windows line endings
nmap <leader>d :%s/\r//g<cr>
