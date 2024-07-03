# dotfiles
my dot files for arch linux and i3
I use arch btw

AUR helper: paru

### required packages:
 - i3
 - feh - for the wallpapers
 - rofi
 - polybar
 - ttf-twemoji - for polybar
 - alacritty
 - neovim
 - ripgrep - for neovim

#### if using virtual box
 - install virtual-box-guest-utils and follow this https://wiki.archlinux.org/title/VirtualBox/Install_Arch_Linux_as_a_guest
 if windows like in gnome dont render (white/black boxes) do the following:
     edit /etc/profile and add `export GSK_RENDERER="gl"` then reboot
 if there is a poblem with alacritty then set env var `LIBGL_ALWAYS_SOFTWARE=1`

### If using a compositor
uncomment the border radius in rofi's config
add the compositor luanching to i3
