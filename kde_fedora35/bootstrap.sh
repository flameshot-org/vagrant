#!/usr/bin/env bash

# Configure Base VM
dnf update
dnf upgrade -y
dnf install -y @base-x @kde-desktop spice-vdagent chrome-gnome-shell @development-tools
systemctl set-default graphical.target

# Add flameshot build dependencies
dnf install -y gcc-c++ cmake qt5-qtbase-devel qt5-linguist ninja-build git

# Add flameshot runtime dependencies
dnf install -y qt5-qtbase qt5-qtsvg-devel

# Default to package manager Flameshot version
dnf install -y flameshot


# Download flameshot source, build flameshot, but do not install globally
cd /home/vagrant/
git clone https://github.com/flameshot-org/flameshot.git
cd flameshot
mkdir build
cd build
cmake -GNinja ../ 
ninja

