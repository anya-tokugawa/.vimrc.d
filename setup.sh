#!/bin/bash -u
#gfmt_java_url="https://github.com/google/google-java-format/releases/download/v1.11.0/google-java-format-1.11.0-all-deps.jar"
#gfmt_java_url="https://github.com/google/google-java-format/releases/download/google-java-format-1.8/google-java-format-1.8-all-deps.jar"
gfmt_java_url="https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar"

mkdir -p "$HOME/.vimrc.d/etc/fmt" "$HOME/.vim/bundle" "$HOME/.vim/colors"
[[ ! -e "$HOME/.vimrc" ]] && ln -s "$HOME/.vimrc.d/vimrc.txt" "$HOME/.vimrc" || echo "WARNING: .vimrc exist."
[[ ! -e "$HOME/.vimrc.d/etc/fmt/google-java-fmt-all-deps.jar" ]] && wget "$gfmt_java_url" -O "$HOME/.vimrc.d/etc/fmt/google-java-fmt-all-deps.jar"
[[ ! -e "$HOME/.vim/bundle/Vundle.vim" ]] && git clone https://github.com/VundleVim/Vundle.vim "$HOME/.vim/bundle/Vundle.vim"
[[ ! -e "$HOME/.vim/pack/vimspector" ]] && git clone https://github.com/puremourning/vimspector "$HOME/.vim/pack/vimspector"
[[ ! -e "$HOME/.vim/colors/molokai.vim" ]] && ln -s "$HOME/.vimrc.d/etc/colors/molokai.vim" "$HOME/.vim/colors"

source /etc/os-release
case "$NAME" in
  "Ubuntu")
    if ! dpkg -s exuberant-ctags > /dev/null 2>&1; then
      sudo apt install exuberant-ctags
    fi
    ;;
esac

mktools/mkcache.sh
vim +PluginInstall +qall
echo "Done."
