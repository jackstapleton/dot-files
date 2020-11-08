#!/bin/bash

echo -e "\nRunning $0\n"

BASEDIR=$(dirname $0)

source $HOME/miniconda/etc/profile.d/conda.sh
conda activate base

conda env create --file=$BASEDIR/kdb-prod.yml --prefix $1

echo -e "\nCompleted $0\n"
