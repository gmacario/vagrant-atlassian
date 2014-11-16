#!/bin/bash

# Quick fix to enable vbguest on VirtualBox 4.3.10
# See https://github.com/mitchellh/vagrant/issues/3341
if [ ! -e /usr/lib/VBoxGuestAdditions ]; then
    sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions \
	/usr/lib/VBoxGuestAdditions || true
fi

sudo apt-get update

# NOTE: If kernel is upgraded, you need to upgrade
# VirtualBox Guest Additions as well
#sudo apt-get dist-upgrade

# Upgrading from Ubuntu server to desktop
#
# See http://askubuntu.com/questions/322122/switching-from-server-to-desktop
#sudo apt-get -y install ubuntu-desktop

# See http://askubuntu.com/questions/300799/does-ubuntu-12-04-lts-32-bit-have-graphic-user-interface
#sudo apt-get -y install xubuntu-desktop

## Install git and related tools
#sudo apt-get -y install git git-svn tig

# Other things I will never live without...
sudo apt-get -y install mc

# Install packages required by install-{confluence,jira}.sh
sudo apt-get -y install gawk wget

# === EOF ===
