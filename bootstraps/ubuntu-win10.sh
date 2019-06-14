#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install git

# stop bell sound
sudo sed -i 's/# set bell-style none/set bell-style none/g' /etc/inputrc

# set up bin
mkdir ~/bin
echo -e 'export PATH="$PATH:$HOME\bin"' >> ~/.bashrc

# configure shell prompt
echo "set bell-style none" >> .inputrc

# make bashrc load envars dot files
echo -e "\nsource ~/.bash_envvars" >> ~/.bashrc
echo -e "source ~/.bash_aliases\n" >> ~/.bashrc

# download and set up dot files
mkdir ~/repos
git clone https://jackstapleton:$PASS@github.com/jackstapleton/dot-files.git ~/repos/dot-files
~/repos/dot-files/link_dot_files.sh

# install and run vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
