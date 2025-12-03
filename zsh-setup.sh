#!/usr/bin/env bash

set -e

echo "Setting up zsh"
sudo apt update
sudo apt install -y zsh zsh-autosuggestions fzf git

if [ -d "$HOME/dotfiles" ]; then
    echo "dotfiles directory already exists"
else
    git clone https://github.com/dusanlovre/dotfiles.git "$HOME/dotfiles"
fi

if [ "$SHELL" != "$(command -v zsh)" ]; then
    chsh -s "$(command -v zsh)"
fi

echo "zsh setup done"

