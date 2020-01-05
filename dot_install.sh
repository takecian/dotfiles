#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "Start setup..."
ln -snfv ~/dotfiles/.config/fish/ ~/.config/
ln -snfv ~/dotfiles/.gitconfig ~/
ln -snfv ~/dotfiles/.lldbinit ~/
ln -snfv ~/dotfiles/lldb/ ~/.lldb
ln -snfv ~/dotfiles/.tigrc ~/

cat << END

**************************************************
DOTFILES setup has been completed!
**************************************************

END