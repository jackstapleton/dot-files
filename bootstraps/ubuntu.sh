#!/bin/bash
set -x

sudo apt update -y
sudo apt upgrade -y

sudo apt install gcc git g++ make nodejs rlwrap npm silversearcher-ag -y

sudo npm install -g @angular/cli

DIR=`dirname $0`
$DIR/vim-vundle.sh

sudo $DIR/install-ripgrep-on-ubuntu.sh

# anaconda installs
wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh -O ~/conda.sh
bash ~/conda.sh -b -p ~/anaconda3
rm ~/conda.sh

. ~/anaconda3/etc/profile.d/conda.sh
conda activate

# kdb installs
conda install -c kx kdb
conda install -c kx embedpy
conda install -c kx jupyterq

# python packages
yes | pip install qpython
yes | pip install requests-html

# link the rest of the dot files
bash $DIR/link-dot-files.sh

# tell bashrc to source  .bash_envvars
echo ". ~/.bash_envvars" >> ~/.bashrc
