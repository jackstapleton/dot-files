#!/bin/bash

echo "Running $0"


# set up dot files
$HOME/repos/environments-setup/dot-files/util/init.sh


# activate conda
source $HOME/miniconda/etc/profile.d/conda.sh
conda activate base

# create kdb-dev
BASEDIR=$(dirname $0)
conda env create --file=$BASEDIR/kdb-dev.yml
conda activate kdb-dev


# link repos into conda env
SRC=$CONDA_PREFIX/q/src
mkdir -p $SRC

for dir in init core
do
    echo "linking $dir"
    ln -s $HOME/repos/kdb-core/q/src/$dir $SRC
done


for module in pubsub
do
    echo "linking $module"
    ln -s $HOME/repos/kdb-$module/q $SRC/$module
done


echo 'linking main'
ln -s $HOME/repos/kdb-core/q/main $CONDA_PREFIX/q

echo 'linking util'
ln -s $HOME/repos/kdb-core/util $CONDA_PREFIX


echo "linking core"
mkdir -p $CONDA_PREFIX/core
ln -s $HOME/repos/kdb-core/config $CONDA_PREFIX/core/config
ln -s $HOME/repos/kdb-core/processes $CONDA_PREFIX/core/processes


for app in eventbus rdb
do
    echo "linking $app"
    ln -s $HOME/repos/kdb-$app $CONDA_PREFIX/$app
done


echo "$0 Complete"
