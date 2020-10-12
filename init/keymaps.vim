"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
inoremap <C-o> <esc>o
imap <C-b> <Home>
imap <C-d> <End>

"
nnoremap j gj
nnoremap k gk
nnoremap ^ g^
" for bash need set `stty -ixon` 
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

"修改leader key
let mapleader=","
let maplocalleader=","

nmap <F5> :!jj
imap <F5> <esc>:!g++ -std=c++11 % -Wall -g -o %.out && ./%.out<CR>
map <F5> :call CompileRunFile()<CR>
func! CompileRunFile()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %.out && ./%.out"
    elseif &filetype == 'cpp'
        exec "!clang++ -std=c++17 % -Wall -g -o %.out && ./%.out"
    elseif &filetype == 'sh'
        :!%
    endif
endfunc
