# Arch Linux - Installation script
This is my Arch installation repo which consists of several scripts to install Arch Linux (mostly) automatically.. I am not an expert so don't blindy install and think you get an out-of-the-box vanilla Arch experience. 

My installation consists out of packages I have a personal preference for. Customize the source code to your liking and try my favorite Linux distro!
 
My `arch-install.sh` installation script assumes you are installing Arch on a nvme ssd (***nvme0n1***). Find your own designated installation device by first looking it up via `lsblk`. The disk path is still hardcoded in my `arch-install.sh` script. So change that if your path differs.

## Installation Summary
- The most minimal Arch installation based on my taste.
- LUKS Encrypted LVM that consists of two ext4 volumes (root and a separate home).
- Direct booting into the kernel using an EFISTUB.

## Create and boot the Arch installer
1. Grab the latest Arch iso from [https://archlinux.org/](https://archlinux.org).
2. Write the image to a USB device: `sudo dd bs=4M if=arch.iso of=/dev/sdx conv=fdatasync status=progress`
3. Boot the Arch usb installer.

## Basic Arch installation
1. I'm assuming you have an active internet connection if not: [Arch Wiki - Connect to the Internet](https://wiki.archlinux.org/title/installation_guide#Connect_to_the_internet).
2. `curl https://raw.githubusercontent.com/meyvin/arch-installation/main/arch-install.sh -o arch-install.sh`
3. `chmod +x arch-install.sh; ./arch-install.sh`
4. Follow the installation and after it's done it will automatically reboot to
   your Arch installation.

## Post Window Manager installation
To provide your Arch installation with a Window Manager, you can use one of my post-installation scripts. Keep in mind that these are fully set up based on my preferences.
