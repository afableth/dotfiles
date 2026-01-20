#!/bin/zsh
# font
mkdir ~/Downloads/
cd ~/Downloads/
wget https://github.com/yuru7/HackGen/releases/download/v2.10.0/HackGen_NF_v2.10.0.zip
pacman -S unzip
unzip HackGen_NF_v2.10.0.zip
rm HackGen_NF_v2.10.0.zip

# symbolic links
ln -s ~/dotfiles/ghostty/ ~/.config/ghostty/
ln -s ~/dotfiles/hypr/ ~/.config/hypr/
ln -s ~/dotfiles/niri/ ~/.config/niri/
ln -s ~/dotfiles/nvim/ ~/.config/nvim/
ln -s ~/dotfiles/polybar/ ~/.config/polybar/
ln -s ~/dotfiles/.zshrc ~/.zshrc
