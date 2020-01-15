set nocompatible
set bs=eol,start,indent
set autoindent
set cindent
set winaltkeys=no
set wrap
set linebreak
set wrapmargin=4
set scrolloff=10
set ttimeout
set ttimeoutlen=50
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=usc-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
filetype plugin indent on
syntax enable
syntax on
set showmatch
set matchtime=2
set display=lastline
set lazyredraw
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set ffs=unix,dos,mac
set laststatus=2
set number
set cursorline
set signcolumn=yes
set showtabline=2
set list
set showcmd
set splitright
set t_Co=256
set shiftwidth=4
set tabstop=4
set noet
set expandtab
set softtabstop=4
set shortmess+=c
set cmdheight=2
set updatetime=300
set hidden
set mouse=a
set selectmode=mouse,key
set noerrorbells
set autoread
set listchars=tab:»■,trail:■
set list
set backup
set writebackup
set undofile
set swapfile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set history=9999

"GUI
if has("gui_running")
    if has("gui_win32")
        set guifont=Hack\ Nerd\ Font:h12
    else
        set guifont=Hack\ Nerd\ Font\ 12
    endif
endif
