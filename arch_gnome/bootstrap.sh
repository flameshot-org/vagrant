#!/usr/bin/env bash

# Configure Base VM
pacman -Syu --noconfirm
pacman -S --noconfirm gnome gdm spice-vdagent gnome-shell-extension-appindicator xdg-desktop-portal xdg-desktop-portal-gnome
systemctl enable gdm.service
systemctl start  gdm.service

# Add flameshot build dependencies
pacman -S --noconfirm cmake base-devel qt5-base qt5-tools ninja git
  
# Add flameshot runtime dependencies
pacman -S --noconfirm qt5-svg
  
# Default to package manager Flameshot version
pacman -S --noconfirm flameshot
  
  
# Download flameshot source, build flameshot, but do not install globally
cd /home/vagrant/
git clone https://github.com/flameshot-org/flameshot.git
cd flameshot
mkdir build
cd build
cmake -GNinja ../ 
ninja

