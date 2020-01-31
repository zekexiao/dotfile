call plug#begin('~/.vim/plugged')
    Plug 'arcticicestudio/nord-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/lightline.vim'
    Plug 'mhinz/vim-startify'
    Plug 't9md/vim-choosewin'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'luochen1990/rainbow'
    Plug 'liuchengxu/vista.vim'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    Plug 'mhinz/vim-signify'
    Plug 'honza/vim-snippets'
call plug#end()

"Scheme
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

"choosewin
nmap - <Plug>(choosewin)

"Coc
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <c-\> coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>ly <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <leader>ln <Plug>(coc-rename)
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lx  <Plug>(coc-fix-current)
imap <C-e> <Plug>(coc-snippets-expand)

"Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>fn :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

"Asyncrun
let g:asyncrun_last = 2
nnoremap <leader>rs :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <leader>rr :AsyncRun 
nnoremap <leader>rf :%AsyncRun 

"config AutoPair for C-h 
let g:AutoPairsMapCh = 0

"Rainbow
let g:rainbow_active = 1

"Clap
noremap <leader>ff :Clap files<cr>
noremap <leader>ft :Clap tags<cr>
noremap <leader>fb :Clap blines<cr>
noremap <leader>fg :Clap grep<cr>
noremap <leader>ll :Clap loclist<cr>

"Signify Git
noremap <leader>gg :SignifyToggle<cr>
noremap <leader>gh :SignifyToggleHighlight<cr>
noremap <leader>gd :SignifyDiff<cr>
noremap <leader>gl :SignifyList<cr>
