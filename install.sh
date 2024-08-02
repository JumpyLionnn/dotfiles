#!/bin/sh

link() {
    if test -d $2; then
        echo "Delete $2? "
        read answer
        if [answer != "y" || answer != "yes"]
            return
        else
            rm -r $2
        fi
        
    fi
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
paru -S kitty
paru -S powerline
link kitty ~/.config/kitty
link powerline ~/.config/powerline
link .bashrc ~/.bashrc

echo "Installing neovim"
paru -S neovim ripgrep
link nvim ~/.config/nvim

echo "Installing yazi"
paru -S yazi
link yazi ~/.config/yazi

echo "Insalling git client"
paru -S gitui
link gitui ~/.config/gitui
