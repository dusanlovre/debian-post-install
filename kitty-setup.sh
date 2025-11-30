#!/usr/bin/env bash

set -e

echo "Setting up kitty"
sudo apt update
sudo apt install -y kitty

if [ -d "$HOME/dotfiles" ]; then
    echo "dotfiles directory already exists"
else
    git clone https://github.com/dusanlovre/dotfiles.git "$HOME/dotfiles"
fi

if [ -L "$HOME/.config/kitty/kitty.conf" ]; then
    rm "$HOME/.config/kitty/kitty.conf"
fi

# create symlink for .zshrc and .zprofile
ln -s "$HOME/dotfiles/kitty.conf" "$HOME/.config/kitty/kitty.conf"

echo "Done with kitty"
