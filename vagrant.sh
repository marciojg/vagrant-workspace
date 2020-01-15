#!/bin/bash

# Basic update.
apt-get update -y
apt-get dist-upgrade -y

# Basic dependencies.
apt-get install -y wget dpkg sed curl git zip unzip ssh vim w3m

# SSH Conection
apt-get install -y openssh-server

# SSH start
service ssh status

# Docker.
apt-get install -y containerd
apt-get install -y docker.io

# Docker compose.
apt-get install -y docker-compose

# VirtualBox Guest Additions.
apt-get install -y virtualbox-guest-additions-iso
apt-get install -y virtualbox-guest-dkms
apt-get install -y virtualbox-guest-utils
apt-get install -y virtualbox-guest-x11

# Timezone.
echo "sudo timedatectl set-timezone America/Sao_Paulo" >> /home/vagrant/.profile

# Keyboard.
sed -i "/XKBMODEL=/c\XKBMODEL=\"abnt2\"" /etc/default/keyboard
sed -i "/XKBLAYOUT=/c\XKBLAYOUT=\"br\"" /etc/default/keyboard
echo "sudo setxkbmap -model abnt2 -layout br" >> /home/vagrant/.profile
echo "sudo setxkbmap -model abnt2 -layout br" >> /home/vagrant/.bashrc

# Inotify - Increasing the amount of inotify watchers (https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers).
echo "echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p" >> /home/vagrant/.profile

echo "Vagrant workspace created!"
