# dotfile 

My vim config for C++ and Rust.

Clone it to .vim, and put
```
source ~/.vim/init/init.vim
```
to your .vimrc

fork from [skywind3000/vim-init](https://github.com/skywind3000/vim-init)

# requirment

## create folders

```
mkdir ~/.vim/.backup/
mkdir ~/.vim/.swp/
mkdir ~/.vim/.undo/
```
for backup/swap/undo

## [vim-plug](https://github.com/junegunn/vim-plug) for plugs

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## [Nerd Font](https://github.com/ryanoasis/nerd-fonts) for icon

## [nodejs](https://nodejs.org/en/download/) for coc.nvim

```
curl -sL install-node.now.sh/lts | bash
```

## [rust-analyzer](https://github.com/rust-analyzer/rust-analyzer) for rust

```
rustup update
git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
cargo xtask install --server
```

## [clangd](http://clang.llvm.org/) for C++

```
sudo apt install llvm clang clang-tools lldb llvm-dev
```

## [vim-clap](https://github.com/liuchengxu/vim-clap) requirement

[BurntSushu/ripgrep](https://github.com/BurntSushi/ripgrep)
[sharkdp/fd](https://github.com/sharkdp/fd)

## coc.nvim extension

```
:CocInstall coc-json coc-snippets
```

