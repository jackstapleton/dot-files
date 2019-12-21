#!/bin/bash
set -x

echo "Running $0"

sudo apt update -y
sudo apt upgrade -y

sudo apt install gcc g++ make -y
sudo apt install rustc cargo -y
sudo apt install rlwrap silversearcher-ag ack -y
sudo apt install tree -y

BASEDIR=$(dirname $0)

# link dot files
bash $BASEDIR/link-dot-files.sh

# install and run vundle
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# git repos
bash $BASEDIR/git-clone.sh $HOME/repos

sudo $BASEDIR/install-ripgrep-on-ubuntu.sh

$BASEDIR/install-miniconda.sh

# tell bashrc to source  .bash_envvars
echo "" >> $HOME/.bashrc
echo ". $HOME/.bash_envvars" >> $HOME/.bashrc
echo ". $HOME/.bash_aliases" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc
