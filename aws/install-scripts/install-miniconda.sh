#!/bin/bash

echo "Running $0"

# miniconda installs
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O $HOME/conda.sh
export MINICONDAHOME=$HOME/miniconda
bash $HOME/conda.sh -b -p $MINICONDAHOME
rm $HOME/conda.sh

. $MINICONDAHOME/etc/profile.d/conda.sh
conda activate
conda install conda-build -y
