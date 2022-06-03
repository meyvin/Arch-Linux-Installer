#!/bin/bash

################################################################################
#### Pacman.conf configuration                                              ####
################################################################################
sudo timedatectl set-ntp true
sudo hwclock --systohc

echo "Setting up Firewall"
sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

################################################################################
#### Pacman packages                                                        ####
################################################################################
echo "Enable Colors, Parallel Downloads and Multilib in /etc/pacman.conf"
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf

echo "Updating pacman"
sudo pacman -Syu

echo "Installing KDE Desktop Environment"
sudo pacman -S \
docker \
docker-compose \
exa \
firefox-developer-edition \
fish \
jq \
nextcloud-client \
plasma \
smbclient \
thunderbird \
wget \
xorg-apps \
xorg-server \
xorg-xinit

echo "Installing KDE Applications"
sudo pacman -S \
akregator \
ark \
dolphin \
dolphin-plugins \
ffmpegthumbs \
filelight \
gwenview \
kate \
kcalc \
kcron \
kdegraphics-thumbnailers \
kdialog \
kompare \
ksystemlog \
ktorrent \
okular \
print-manager \
spectacle \
yadm \
yakuake \

################################################################################
#### Paru aur package manager installation                                  ####
################################################################################
echo "Installing Paru Aur package manager"
git clone https://aur.archlinux.org/paru $HOME/paru
cd $HOME/paru
makepkg -si
rm -rf $HOME/paru

################################################################################
#### AUR Packages                                                           ####
################################################################################
echo "Installing AUR packages"
paru -Syu \
adobe-base-14-fonts \
celluloid \
gitflow-avh \
intellij-idea-ultimate-edition \
intellij-idea-ultimate-edition-jre \
kwin-bismuth-bin \
postman-bin \
zramd

################################################################################
#### Enabling Docker                                                        ####
################################################################################
echo "Enabling Docker"
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

################################################################################
#### Enabling Zram                                                          ####
################################################################################
sudo sed -i '/MAX_SIZE/s/^# //g' /etc/default/zramd

################################################################################
#### Enable systemd services                                                ####
################################################################################
sudo systemctl enable zramd

################################################################################
#### Xinit                                                                  ####
################################################################################
echo 'export DESKTOP_SESSION=plasma' >> $HOME/.xinitrc
echo 'exec startplasma-x11' >> $HOME/.xinitrc

################################################################################
#### ZSH & Dotfiles Configuration                                           ####
################################################################################
echo "Switch to and set Fish as default"
chsh -s /usr/bin/fish

echo "Reboot and start KDE in:"
echo -e "\e[1;32m5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
