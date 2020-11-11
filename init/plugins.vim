call plug#begin('~/.vim/plugged')
    Plug 'NLKNguyen/papercolor-theme'
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
set background=dark
colorscheme PaperColor
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
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
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
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
