call plug#begin('~/.vim/plugged')
    Plug 'arcticicestudio/nord-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/lightline.vim'
    Plug 'mhinz/vim-startify'
    Plug 't9md/vim-choosewin'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'luochen1990/rainbow'
    Plug 'mhinz/vim-signify'
    Plug 'honza/vim-snippets'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    Plug 'voldikss/vim-floaterm'
    Plug 'ziglang/zig.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

"zig.vim
let g:zig_fmt_autosave = 0

"vim-floaterm
nnoremap   <silent>   <c-n>   :FloatermToggle<CR>
tnoremap   <silent>   <c-n>   <C-\><C-n>:FloatermToggle<CR>

"coc.nvim
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
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying code actions to the selected code block.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for apply code actions at the cursor position.
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Apply the most preferred quickfix action to fix diagnostic on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for apply refactor code actions.
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Find symbol of current document.
nnoremap <silent><nowait> <C-R>  :<C-u>CocList outline<cr>
