call plug#begin('~/.vim/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/lightline.vim'
    Plug 'mhinz/vim-startify'
    Plug 't9md/vim-choosewin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'luochen1990/rainbow'
    Plug 'honza/vim-snippets'
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    Plug 'voldikss/vim-floaterm'
    Plug 'ziglang/zig.vim'
    Plug 'ErichDonGubler/vim-sublime-monokai'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'joshdick/onedark.vim'
call plug#end()


"Scheme
set t_Co=256
set background=dark
set termguicolors
colorscheme onedark
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \     'cocstatus': 'coc#status'
            \ },
            \}


"choosewin
nmap - <Plug>(choosewin)

"config AutoPair for C-h 
let g:AutoPairsMapCh = 0

"Leaderf
let g:Lf_ShortcutF = "<C-p>"
noremap <C-t> :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_WildIgnore = {
            \ 'dir': ['.git', 'build', '.idea', '.xmake', '.vscode', '.cache', 'appimage']
            \ }
"不使用 cache 文件
let g:Lf_UseCache = 0

"Rainbow
let g:rainbow_active = 1

"zig.vim
let g:zig_fmt_autosave = 0

"vim-floaterm
let g:floaterm_autoclose = 2
let g:floaterm_keymap_toggle = '<c-t>'
if has('win64') || has('win32')
    let g:floaterm_shell='powershell'
endif
tmap <Esc> <c-\><c-n> 

"coc.nvim
let g:coc_global_extensions = ['coc-css', 'coc-clangd', 'coc-explorer']
" May need for vim (not neovim) since coc.nvim calculate byte offset by count
" utf-8 byte sequence.
set encoding=utf-8

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :CocCommand clangd.switchSourceHeader<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>lr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)

" Remap keys for apply code actions at the cursor position.
nmap <leader>la  <Plug>(coc-codeaction-cursor)
" Apply the most preferred quickfix action to fix diagnostic on the current line.
nmap <leader>lc  <Plug>(coc-fix-current)

" Remap keys for apply refactor code actions.
nmap <silent> <leader>le <Plug>(coc-codeaction-refactor)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Find symbol of current document.
nnoremap <silent><nowait> <leader>ls  :<C-u>CocList symbols<cr>
nnoremap <silent><nowait> <C-M>  :<C-u>CocList outline<cr>
nmap <leader>e <Cmd>CocCommand explorer<CR>
