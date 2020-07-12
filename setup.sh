#!/bin/bash -eux
ln -s $HOME/.vimrc.d/vimrc.txt $HOME/.vimrc
$HOME/.vimrc.d/auto-insert.sh

: "Bundle Settings"
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall



echo "done!"
