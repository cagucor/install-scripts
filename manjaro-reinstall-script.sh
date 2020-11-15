#!/bin/bash

# Install script for Manjaro
# System update and yay install
cd 
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm yay 
yay -Syu --noconfirm
yay -S --noconfirm base-devel

# Nvidia drivers
yay -S --noconfirm linux58-nvidia-455xx
yay -S --noconfirm optimus-manager 
yay -S --noconfirm optimus-manager-qt

# General utlities
yay -S --noconfirm balena-etcher
yay -S --noconfirm libdbusmenu-glib
yay -S --noconfirm vlc

# Productivity/ leisure
yay -S --noconfirm discord
yay -S --noconfirm slack
yay -S --noconfirm mailspring

# Bootloader
yay -S --noconfirm refind
sudo git clone https://github.com/cagucor/nordtheme-rEFInd.git /boot/efi/EFI/refind/themes
sudo echo 'include themes/nordtheme-rEFInd/theme.conf' >> ~/boot/efi/EFI/refind/refind.conf

# Oh My Zsh (Manual)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Coding environment
yay -S --noconfirm visual-studio-code-bin
CUR=$(curl -s https://golang.org/dl/ | grep linux-amd64 | grep 'download downloadBox' | cut -d'"' -f4)
wget $CUR
FILE=$(echo $CUR | cut -d'/' -f5)
sudo tar -C /usr/local -xzf $FILE
rm $FILE
mkdir ~/.golang
echo '' >> ~/.zshrc
echo '# Golang' >> ~/.zshrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export GOPATH=$HOME/.golang' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc

source ~/.bashrc

# Reboot
reboot