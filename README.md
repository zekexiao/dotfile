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

Do not needs anymore. already included.

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

or download the binary from the release page and change name to `rust-analyzer`

and add to path


## [ccls](http://github.com/MaskRay/ccls) for C++

```
sudo apt install llvm clang libclang-dev clang-tools lldb llvm-dev cmake
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10 \
          -DLLVM_INCLUDE_DIR=/usr/lib/llvm-10/include \
          -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-10/
cmake --build Release

```

and add to path


## coc.nvim extension

```
:CocInstall coc-json coc-snippets
```
