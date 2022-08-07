#!/bin/bash -ux
ln -s $HOME/.vimrc.d/vimrc.txt $HOME/.vimrc
$HOME/.vimrc.d/mktools/auto-insert.sh

mkdir $HOME/.vimrc.d/fmt/
#gfmt_java_url="https://github.com/google/google-java-format/releases/download/v1.11.0/google-java-format-1.11.0-all-deps.jar"
#gfmt_java_url="https://github.com/google/google-java-format/releases/download/google-java-format-1.8/google-java-format-1.8-all-deps.jar"
gfmt_java_url="https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar"

echo "google-java-format: version - v${gfmt_java_url}"
[[ ! -e $HOME/.vimrc.d/fmt/google-java-fmt-all-deps.jar ]] && wget "$gfmt_java_url" -O $HOME/.vimrc.d/fmt/google-java-fmt-all-deps.jar

: "Bundle Settings"
mkdir -p ~/.vim/bundle
[[ ! -e  $HOME/.vim/bundle/Vundle.vim ]] && git clone github:VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
[[ ! -e  $HOME/.vim/pack/vimspector ]] && git clone github:puremourning/vimspector $HOME/.vim/pack/vimspector

: "collect colorscheme Settings"

mkdir -p $HOME/.vim/colors
cd $HOME/.vim/colors
[[ ! -e hackerman.vim ]] && curl -OL --progress https://raw.githubusercontent.com/Eric-lightning/vim-hackerman-syntax/master/colors/hackerman.vim
[[ ! -e molokai.vim ]] && git clone https://github.com/tomasr/molokai.git molokai && \
ln -s  molokai/colors/molokai.vim ./

cd $HOME

source /etc/os-release

if [ $NAME = "Ubuntu" ]
then
  if ! (LC_ALL=C apt list exuberant-ctags | grep installed);then
    sudo apt install exuberant-ctags
  fi
fi



vim +PluginInstall +qall
: "done!"
