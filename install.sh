#!/bin/sh

link() {
    ln -s "$(readlink -f $1)" $2
}

echo "Installing paru..."
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -r paru

echo "Installing i3"
paru -S i3-wm feh rofi polybar
link i3 ~/.config/i3
link wallpapers ~/.config/wallpapers
link rofi ~/.config/rofi
link polybar ~/.config/polybar

echo "Installing fonts"
paru -S ttf-twemoji

echo "Installing terminal and shell"
paru -S alacritty
paru -S powerline
link alacritty ~/.config/alacritty
link powerline ~/.config/powerline
link .bashrc ~/.bashrc

echo "Installing neovim"
paru -S neovim ripgrep
link nvim ~/.config/nvim
