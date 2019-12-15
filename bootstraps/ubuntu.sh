#!/bin/bash
set -x

echo "Running $0"

sudo apt update -y
sudo apt upgrade -y

sudo apt install gcc g++ make -y
sudo apt install rustc cargo -y
sudo apt istall rlwrap silversearcher-ag ack rg -y

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

# anaconda installs
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O $HOME/conda.sh
export MINICONDAHOME=$HOME/miniconda
bash $HOME/conda.sh -b -p $MINICONDAHOME
rm $HOME/conda.sh

. $MINICONDAHOME/etc/profile.d/conda.sh
conda activate

# tell bashrc to source  .bash_envvars
echo "" >> $HOME/.bashrc
echo ". $HOME/.bash_envvars" >> $HOME/.bashrc
echo ". $HOME/.bash_aliases" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc
