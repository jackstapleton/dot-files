#!/bin/bash


echo -e "\nRunning $0\n"


wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O $HOME/conda.sh
bash $HOME/conda.sh -b -p ~/miniconda
rm $HOME/conda.sh

source ~/miniconda/etc/profile.d/conda.sh
conda activate
conda install conda-build -y


echo -e "\nCompleted $0\n"
