#!/bin/bash

sudo apt-get update

# NOTE: If kernel is upgraded, you need to upgrade VirtualBox Guest Additions as well
#sudo apt-get dist-upgrade

# Example: Install Apache
#apt-get install -y apache2
#rm -rf /var/www
#ln -fs /vagrant /var/www

# Upgrading from Ubuntu server to desktop
#
# See http://askubuntu.com/questions/322122/switching-from-server-to-desktop
sudo apt-get -y install ubuntu-desktop
#
# See http://askubuntu.com/questions/300799/does-ubuntu-12-04-lts-32-bit-have-graphic-user-interface
#sudo apt-get -y install xubuntu-desktop

## Add command: add-apt-repository
#sudo apt-get -y install python-software-properties

## Install Qt5 development environment
## See http://askubuntu.com/questions/279421/how-can-i-install-qt-5-x-on-12-04-lts
#sudo add-apt-repository ppa:ubuntu-sdk-team/ppa
#sudo apt-get update
#sudo apt-get -y install qtdeclarative5-dev
#sudo apt-get -y install qtdeclarative5-qtquick2-plugin
#sudo apt-get -y install qtdeclarative5-serviceframework-plugin
#sudo apt-get -y install qtquick1-5-dev
#sudo apt-get -y install qtscript5-dev
#sudo apt-get -y install qtsystems5-dev

## Install Qt Creator
## If you want a more recent version: http://qt-project.org/downloads
#sudo apt-get -y install qtcreator

## (Optional) Install Qt5 tools
##sudo apt-get -y install qtsystems5-tools

## (Optional) Install Qt5 documentation
#sudo apt-get -y install qtbase5-doc
#sudo apt-get -y install qtdeclarative5-doc
##sudo apt-get -y install qtgraphicaleffects5-doc
##sudo apt-get -y install qtmultimedia5-doc
##sudo apt-get -y install qtscript5-doc
##sudo apt-get -y install qtsvg5-doc
##sudo apt-get -y install qtwebkit5-doc

## (Optional) Install Qt5 examples
#sudo apt-get -y install qtbase5-examples
#sudo apt-get -y install qtdeclarative5-examples
##sudo apt-get -y install qt3d5-examples
##sudo apt-get -y install qtgraphicaleffects5-examples
##sudo apt-get -y install qtlocations5-examples
##sudo apt-get -y install qtmultimedia5-examples
##sudo apt-get -y install qtscript5-examples
##sudo apt-get -y install qtsensors5-examples
##sudo apt-get -y install qtsvg5-examples
##sudo apt-get -y install qtsystems5-examples
##sudo apt-get -y install qtwebkit5-examples
##sudo apt-get -y install qtxmlpatterns5-examples

## Install packages required to build dlt-daemon
#sudo apt-get -y install cmake

## Install other packages required to build OVIP_Apps
#sudo apt-get -y install libglib2.0-dev
#sudo apt-get -y install libsqlite3-dev
#sudo apt-get -y install libudev-dev
## FIXME: Package libsystemd-daemon not found
## FIXME: Package conn-cb-api not found

## Install Doxygen
#sudo apt-get -y install doxygen

## Install git and related tools
#sudo apt-get -y install git git-svn tig

# Other things I will never live without...
sudo apt-get -y install mc

# === EOF ===
