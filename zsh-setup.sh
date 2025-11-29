#!/usr/bin/env bash

set -e

echo "Installing packages"
sudo apt update
sudo apt install -y zsh zsh-autosuggestions fzf git

if [ -d "$HOME/dotfiles" ]; then
    echo "dotfiles directory already exists"
else
    git clone https://github.com/dusanlovre/dotfiles.git "$HOME/dotfiles"
fi

# backup .zshrc
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Remove old symlink if any
if [ -L "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
fi

# create symlink for .zshrc
ln -s "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"

if [ "$SHELL" != "$(command -v zsh)" ]; then
    chsh -s "$(command -v zsh)"
fi

echo "Yay!"

