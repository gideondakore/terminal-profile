#!/bin/bash

# Fail on any command.
set -eux -o pipefail

# Install Powerline for VIM.
sudo apt install -y python3-pip
pip3 install powerline-status
sudo cp configs/.vimrc ~/.vimrc
sudo apt install -y fonts-powerline

# Install Patched Font
mkdir -p ~/.fonts
sudo cp -a fonts/. ~/.fonts/
fc-cache -vf ~/.fonts/
