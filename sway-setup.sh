#!/usr/bin/env bash

set -e

echo "Setting up sway"
sudo apt update
sudo apt install -y sway light swaybg swayidle swayimg swaylock waybar wofi fonts-font-awesome grimshot 

if [ -d "$HOME/dotfiles" ]; then
    echo "dotfiles directory already exists"
else
    git clone https://github.com/dusanlovre/dotfiles.git "$HOME/dotfiles"
fi

echo "Done with sway"
