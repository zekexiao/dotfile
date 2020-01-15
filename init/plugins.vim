call plug#begin('~/.vim/plugged')
    Plug 'arcticicestudio/nord-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/lightline.vim'
    if has("win64") || has("win32") || has("win16")
        Plug 'Yggdroot/LeaderF', { 'do': './install.bat' }
    else
        Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    endif
    Plug 'mhinz/vim-startify'
    Plug 't9md/vim-choosewin'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

"Scheme
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

"choosewin
nmap - <Plug>(choosewin)

"Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>ly <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <leader>ln <Plug>(coc-rename)
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lx  <Plug>(coc-fix-current)

"Leaderf
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'

"Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>fn :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
