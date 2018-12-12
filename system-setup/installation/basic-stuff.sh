#!/usr/bin/env bash

apt update
apt upgrade
apt dist-upgrade

# 7-zip and rar for nautilus 
apt -y install p7zip-full p7zip-rar

apt remove libreoffice-core

add-apt-repository ppa:libreoffice/ppa
apt install -y gimp powertop openssh-server libreoffice

apt install -y snapd
snap install chromium spotify vectr

update-alternatives --config x-www-browser
update-alternatives --config gnome-www-browser

# vscode and settings-sync, use with https://gist.github.com/kubehe/de6173424af8b8f2dee3766bcaae677c
snap install --classic vscode
code --install-extension Shan.code-settings-sync

update-alternatives --set editor /snap/bin/vscode

apt install -y python-pip python3-venv python3-pip

apt install -y curl wget

apt install -y htop

# superior copy/paste
# link: https://linux.die.net/man/1/xclip
apt install -y xclip

# checking lines of code in projects/files
# link: https://stackoverflow.com/questions/1358540/how-to-count-all-the-lines-of-code-in-a-directory-recursively
apt install -y cloc

# git-flow comparison vs git: https://gist.github.com/JamesMGreene/cdd0ac49f90c987e45ac
apt install -y git git-flow

wget https://github.com/mbusb/multibootusb/releases/download/v9.2.0/python3-multibootusb_9.2.0-1_all.deb
dpkg -i python3-multibootusb_9.2.0-1_all.deb
apt install -f
rm python3-multibootusb_9.2.0-1_all.deb

# maginificent editor  - gtk for system cliboard - "+ instead of "*
apt install -y vim-gtk

update-alternatives --config editor


apt install -y postgresql postgreql-contrib postgresql-client-common postgresql-10

apt install -y cpu-checker

isKvmInstalled= $( kvm-ok | grep exists)

if [ -z "${isKvmInstalled}" ]; then
  # for android vm especially
  apt install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils ia32-libs-multiarch
fi

apt install -y steam

apt install -y nfs-common

apt install -y virtualbox virtualbox-ext-pack

# guide: https://www.tldp.org/HOWTO/SMB-HOWTO-8.html
apt install -y smbclient

# cool process killer 
snap install fkill

apt install -y gnome-tweaks gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell