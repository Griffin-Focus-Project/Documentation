#!/bin/bash

sudo apt-get install ranger
sudo apt-get install terminator

# Setup UpBoard Xtreme
# Install Ubuntu Kernel
# From https://wiki.up-community.org/Ubuntu_18.04
# Causes error when reboot
sudo add-apt-repository ppa:aaeon-cm/upboard
sudo apt update
sudo apt-get autoremove --purge 'linux-.*generic'
sudo apt --fix-broken install
sudo apt-get install linux-generic-hwe-18.04-edge-upboard
sudo apt dist-upgrade -y
sudo update-grub
sudo reboot

