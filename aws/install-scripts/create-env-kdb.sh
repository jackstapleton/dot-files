#!/bin/bash

echo "Running $0"

BASEDIR=$(dirname $0)

# activate conda
source $HOME/miniconda/etc/profile.d/conda.sh
conda activate base

# create kdb
conda env create --file=$BASEDIR/kdb.yml --prefix /opt/kdb

echo "$0 complete"
