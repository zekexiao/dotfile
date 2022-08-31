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
    Plug 'mhinz/vim-signify'
    Plug 'honza/vim-snippets'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
call plug#end()

"Scheme
set t_Co=256
"set background=dark
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

"choosewin
nmap - <Plug>(choosewin)

"Coc
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>ly <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <leader>ln <Plug>(coc-rename)
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lx  <Plug>(coc-fix-current)
imap <C-e>  <Plug>(coc-snippets-expand)

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

"Leaderf
let g:Lf_ShortcutF = "<C-p>"
noremap <C-t> :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'

"Rainbow
let g:rainbow_active = 1

"Signify Git
noremap <leader>gg :SignifyToggle<cr>
noremap <leader>gh :SignifyToggleHighlight<cr>
noremap <leader>gd :SignifyDiff<cr>
noremap <leader>gl :SignifyList<cr>

"vim-fswitch
nmap <silent> <Leader>ls :FSHere<cr>
