set nocompatible
set bs=eol,start,indent
set autoindent
set cindent
set winaltkeys=no
set nowrap
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
set nobackup
set nowritebackup

"GUI
if has("gui_running")
    if has("gui_win32")
        set guifont=Hack\ Nerd\ Font:h12
    else
        set guifont=Hack\ Nerd\ Font\ 12
    endif
endif
