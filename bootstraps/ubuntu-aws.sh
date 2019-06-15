#!/bin/bash
set -x

sudo apt update -y
sudo apt upgrade -y

sudo apt install git -y

DIR=`dirname $0`
$DIR/vim-vundle.sh


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

# rlwrap install
sudo apt install rlwrap -y

# link the rest of the dot files
bash $DIR/link-dot-files.sh
