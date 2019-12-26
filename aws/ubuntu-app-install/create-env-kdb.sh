#!/bin/bash -x

echo "Running $0"

# activate conda
source $HOME/miniconda/etc/profile.d/conda.sh
conda activate base

# remove dev environment
conda remove --name kdb-dev

# create kdb-dev
BASEDIR=$(dirname $0)
conda env create --file=$BASEDIR/kdb.yml
