#!/usr/bin/env bash

# Configure Base VM
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
apt-get install -y tasksel spice-vdagent 
tasksel install kubuntu-desktop

# Add flameshot build dependencies
apt-get install -y g++ cmake build-essential qt5-default qttools5-dev-tools libqt5svg5-dev qttools5-dev ninja-build

# Add flameshot runtime dependencies
apt-get install -y libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5

# Default to package manager Flameshot version
apt-get install -y flameshot


# Download flameshot source, build flameshot, but do not install globally
cd /home/vagrant/
git clone https://github.com/flameshot-org/flameshot.git
cd flameshot
mkdir build
cd build
cmake -GNinja ../ 
ninja

