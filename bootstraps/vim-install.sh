#!/bin/bash

# install and run vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Python completion engine only configured currently for ubuntu
LINUX_DISTRIBUTION=`cat /etc/*release | grep ^NAME= | cut -d '=' -f 2`

echo $LINUX_DISTRIBUTION

if [ $LINUX_DISTRIBUTION = '"Ubuntu"' ]; then
    read -p "Do you want to install Valloric/YouCompleteMe ? (y/n): " INSTALL_YCM
    if [ $INSTALL_YCM = "y" ]; then
        echo "Installing YCM"
        sudo apt install git build-essential cmake python3-dev -y
        cd ~/.vim/bundle/YouCompleteMe
        python3 install.py
        cd ~
    fi
fi

# fuzzy file finder while in vim
# read -p "Do you want to install C extension for Yggdroot/LeaderF ? (y/n): " INSTALL_CLF
# if [ $INSTALL_CLF = "y" ]; then
#     echo "Installing CLF"
#     cd ~/.vim/bundle/LeaderF
#     ./install.sh
#     cd
# fi

# fuzzy file finder while in vim
#read -p "Do you want to install junegunn/fzf-vim ? (y/n): " INSTALL_FZF
#if [ $INSTALL_FZF = "y" ]; then
#    echo "Installing FZF"
#    ~/.vim/bundle/fzf/install
#fi
