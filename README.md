# dotfile 

My vim config for C++ and Rust.

Clone it to .vim, and put
```
source ~/.vim/init/init.vim
```
to your .vimrc

fork from [skywind3000/vim-init](https://github.com/skywind3000/vim-init)

# requirment

## [vim-plug](https://github.com/junegunn/vim-plug) for plugs

Do not needs anymore. already included.

## [Nerd Font](https://github.com/ryanoasis/nerd-fonts) for icon

## [nodejs](https://nodejs.org/en/download/) for coc.nvim

```
curl -sL install-node.now.sh/lts | sudo bash
```

## coc.nvim extension
clangd for c++
server-d for dlang

```
:CocInstall coc-json coc-snippets coc-dlang
```
