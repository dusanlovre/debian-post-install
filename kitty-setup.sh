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

echo "Done with kitty"
