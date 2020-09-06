#!/bin/bash -ux
ln -s $HOME/.vimrc.d/vimrc.txt $HOME/.vimrc
$HOME/.vimrc.d/mktools/auto-insert.sh

: "Bundle Settings"
mkdir -p ~/.vim/bundle
git clone github:VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

: "collect colorscheme Settings"

mkdir -p $HOME/.vim/colors
cd $HOME/.vim/colors
curl -OL --progress https://raw.githubusercontent.com/Eric-lightning/vim-hackerman-syntax/master/colors/hackerman.vim
git clone https://github.com/tomasr/molokai.git molokai
ln -s  molokai/colors/molokai.vim ./

cd $HOME
vim +PluginInstall +qall
: "done!"
