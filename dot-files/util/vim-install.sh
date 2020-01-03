#!/bin/bash

echo "Running $0"

CURRENTDIR=$(pwd)

BASEDIR=$(dirname $0)

DOTFILESDIR=$BASEDIR/..

# link vimrc with vim vundle plugins
ln -s $DOTFILESDIR/vimrc $HOME/.vimrc

# install and run vundle
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

ln -s $DOTFILESDIR/vim.plugin $HOME/.vim/plugin

# # Python completion engine only configured currently for ubuntu
# LINUX_DISTRIBUTION=`cat /etc/*release | grep ^NAME= | cut -d '=' -f 2`
# echo $LINUX_DISTRIBUTION

# if [ $LINUX_DISTRIBUTION = '"Ubuntu"' ]; then
#     if [ -d $HOME/.vim/bundle/YouCompleteMe ]; then
#         read -p "Do you want to install Valloric/YouCompleteMe ? (y/n): " INSTALL_YCM
#         if [ $INSTALL_YCM = "y" ]; then
#             echo "Installing YCM"
#             sudo apt install git build-essential cmake python3-dev -y
#             cd $HOME/.vim/bundle/YouCompleteMe
#             python3 install.py
#             cd $CURRENTDIR
#         fi
#     fi
# fi

echo "$0 Complete"
