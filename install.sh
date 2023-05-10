#!/bin/bash

set -euo pipefail

function make-paths {
    echo "Creating additional PATH directories..."
    mkdir -p "$HOME/.local/bin"
    echo "Creating additional MANPATH directories..."
    mkdir -p "$HOME"/.local/man/man{1..8}
}

function create-link {
  local -r SRC=$1
  local -r DEST=$2

  mkdir -p "$(dirname "$DEST")"
  if ! [ -L "$DEST" ]; then
    ln -ivs "$SRC" "$DEST"
  else
    echo "Skipping, link already exists: $DEST"
  fi
}

function install-from-git-repo {
    local -r name="$1"
    local -r repo="$2"
    local -r dest="$3"

    echo "Installing $name..."
    if [ -d "$dest" ]; then
      (cd "$dest" && git pull --progress)
    else
      rm -rf "$dest"
      git clone --progress "$repo" "$dest"
    fi
}

function link-files {
    echo "Linking files..."
    create-link "$PWD/bin"                    "$HOME/bin"
    create-link "$PWD/gitconfig"              "$HOME/.gitconfig"
    create-link "$PWD/gitignore"              "$HOME/.gitignore"
    create-link "$PWD/vim"                    "$HOME/.vim"
    create-link "$PWD/vimrc"                  "$HOME/.vimrc"
    create-link "$PWD/zsh"                    "$HOME/.zsh"
    create-link "$PWD/zshrc"                  "$HOME/.zshrc"
}

function install-vim-plugins {
    echo "Installing Vim plugins..."
    vim +PluginInstall +qall
}

function install-dircolors {
    echo "Installing dircolors..."
    curl -sl "https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark" > ~/.dircolors
}

function install-all {
    make-paths
    link-files
    install-from-git-repo "Rupa-Z"        "https://github.com/rupa/z"               "$HOME/.rupa-z"
    install-from-git-repo "Zgen"          "https://github.com/tarjoilija/zgen"      "$HOME/.zgen"
    install-from-git-repo "Vim Vundle"    "https://github.com/VundleVim/Vundle.vim" "$HOME/.vundle"

    install-vim-plugins
    install-dircolors
}

install-all
